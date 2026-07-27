import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Data/Models/controllertype.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Data/Models/qrtype.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Logic/Methods.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Cubit/qr_cubit.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/custom_form_field.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:qr_scanner_and_generator/generated/locale_keys.g.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final QrType type;
  final ControllerType controllerType;
  final QrCubit cubit;
  final QrState state;
  final bool? required;
  final double? height;
  final double? width;

  const InputField({
    super.key,
    required this.controller,
    required this.type,
    required this.controllerType,
    required this.cubit,
    required this.state,
    this.required,
    this.height,
    this.width,
  });

  bool _matchesType(List<dynamic> types, dynamic comparedType) {
    return types.contains(comparedType);
  }

  bool _matchesController(ControllerType controllerType) {
    return this.controllerType == controllerType;
  }

  bool get _isPhoneField =>
      _matchesType([QrType.phone, QrType.whatsapp], type) ||
      _matchesController(ControllerType.phone);

  bool get _isRequired =>
      required ??
      [
        ControllerType.firstname,
        ControllerType.lastname,
        ControllerType.phone,
        ControllerType.generate,
      ].contains(controllerType);

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      height: height ?? 45.h,
      width: width ?? double.infinity,
      controller: controller,
      isEmail:
          _matchesType([QrType.email], type) ||
          _matchesController(ControllerType.email),
      isUserName: _matchesType([QrType.instagram, QrType.x], type),
      isUrl: _matchesType([QrType.website], type),
      isPlainText: _matchesType([QrType.text, QrType.data], type),
      isPhoneNumber: _isPhoneField,
      isFirstName: _matchesController(ControllerType.firstname),
      isLastName: _matchesController(ControllerType.lastname),
      isCompany: _matchesController(ControllerType.company),
      isJobTitle: _matchesController(ControllerType.job),
      isWeb: _matchesController(ControllerType.website),
      isAddress: _matchesType([
        ControllerType.address,
        ControllerType.eventLocation,
      ], controllerType),
      isCity: _matchesController(ControllerType.city),
      isCountry: _matchesController(ControllerType.country),
      isWifiName: _matchesController(ControllerType.wifiName),
      isWifiPassword: _matchesController(ControllerType.wifiPassword),
      isIndustryName: _matchesController(ControllerType.industry),
      isEventName: _matchesController(ControllerType.eventName),
      isEventDescription: _matchesController(ControllerType.eventDescription),
      isEventStartDate: _matchesController(ControllerType.eventStartDate),
      isEventEndDate: _matchesController(ControllerType.eventEndDate),
      maxLines: _matchesController(ControllerType.eventDescription) ? 5 : null,
      minLines: _matchesController(ControllerType.eventDescription) ? 3 : null,
      eventStartDate:
          _matchesType([
            ControllerType.eventStartDate,
            ControllerType.eventEndDate,
          ], controllerType)
          ? tryParseDate(cubit.eventStartDateController.text) ?? DateTime.now()
          : null,
      onEventStartDateSelected:
          _matchesController(ControllerType.eventStartDate)
          ? (date) {
              controller.text = formatDateForDisplay(date);
              cubit.eventStartDateController.text = date.toIso8601String();
              cubit.emit(QrGenerateLoaded());
            }
          : null,
      onEventEndDateSelected: _matchesController(ControllerType.eventEndDate)
          ? (date) {
              controller.text = formatDateForDisplay(date);
              cubit.emit(QrGenerateLoaded());
            }
          : null,
      showRequiredStar: _isRequired,
      countryCode: _isPhoneField ? cubit.countryCode : null,
      onCountryChanged: (country) => cubit.countryCode = country,
      validator: state is QrGenerateError
          ? (_) => (state as QrGenerateError).message
          : null,
      suffixIcon:
          _matchesType([
            ControllerType.eventStartDate,
            ControllerType.eventEndDate,
          ], controllerType)
          ? null
          : controller.text.isNotEmpty
          ? IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => cubit.clearInput(controllerType),
            )
          : const SizedBox(),
      onChanged: (_) => cubit.emit(QrGenerateLoaded()),
    );
  }
}
