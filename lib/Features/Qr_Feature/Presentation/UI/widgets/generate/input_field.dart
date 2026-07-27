import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Data/Models/controllertype.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Data/Models/qrtype.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Cubit/qr_cubit.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/custom_form_field.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';

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

  bool _matchesType(List<QrType> types) {
    return types.contains(type);
  }

  bool _matchesController(ControllerType controllerType) {
    return this.controllerType == controllerType;
  }

  bool get _isPhoneField =>
      _matchesType([QrType.phone, QrType.whatsapp]) ||
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
          _matchesType([QrType.email]) ||
          _matchesController(ControllerType.email),
      isUserName: _matchesType([QrType.instagram, QrType.x]),
      isUrl: _matchesType([QrType.website]),
      isPlainText: _matchesType([QrType.text, QrType.data]),
      isPhoneNumber: _isPhoneField,
      isFirstName: _matchesController(ControllerType.firstname),
      isLastName: _matchesController(ControllerType.lastname),
      isCompany: _matchesController(ControllerType.company),
      isJobTitle: _matchesController(ControllerType.job),
      isWeb: _matchesController(ControllerType.website),
      isAddress: _matchesController(ControllerType.address),
      isCity: _matchesController(ControllerType.city),
      isCountry: _matchesController(ControllerType.country),
      isWifiName: _matchesController(ControllerType.wifiName),
      isWifiPassword: _matchesController(ControllerType.wifiPassword),
      isIndustryName: _matchesController(ControllerType.industry),
      showRequiredStar: _isRequired,
      countryCode: _isPhoneField ? cubit.countryCode : null,
      onCountryChanged: (country) => cubit.countryCode = country,
      validator: state is QrGenerateError
          ? (_) => (state as QrGenerateError).message
          : null,
      suffixIcon: controller.text.isNotEmpty
          ? IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => cubit.clearInput(controllerType),
            )
          : const SizedBox(),
      onChanged: (_) => cubit.emit(QrGenerateLoaded()),
    );
  }
}
