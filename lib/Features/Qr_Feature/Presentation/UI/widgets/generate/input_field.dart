import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Data/Models/controllertype.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Data/Models/qrtype.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Cubit/qr_cubit.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/custom_form_field.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';

Widget InputField({
  required TextEditingController controller,
  required QrType type,
  required ControllerType controllertype,
  required QrCubit cubit,
  required QrState state,
  double? height,
  double? width,
}) {
  final H = height ?? 45.h;
  final W = width ?? double.infinity;
  return CustomFormField(
    height: H,
    width: W,
    controller: controller,
    isEmail: type == QrType.email || controllertype == ControllerType.email,
    isUserName: [QrType.instagram, QrType.x].contains(type),
    isUrl: QrType.website == type,
    isPlainText: [QrType.text, QrType.data].contains(type),
    isPhoneNumber:
        [QrType.phone, QrType.whatsapp].contains(type) ||
        controllertype == ControllerType.phone,
    isFirstName: ControllerType.firstname == controllertype,
    isLastName: ControllerType.lastname == controllertype,
    isCompany: ControllerType.company == controllertype,
    isJobTitle: ControllerType.job == controllertype,
    isWeb: controllertype == ControllerType.website,
    isAddress: controllertype == ControllerType.address,
    isCity: controllertype == ControllerType.city,
    isCountry: controllertype == ControllerType.country,
    isWifiName: controllertype == ControllerType.wifiName,
    isWifiPassword: controllertype == ControllerType.wifiPassword,
    showRequiredStar: [
      ControllerType.firstname,
      ControllerType.lastname,
      ControllerType.phone,
      ControllerType.generate,
    ].contains(controllertype),
    countryCode:
        ([QrType.phone, QrType.whatsapp].contains(type) ||
            controllertype == ControllerType.phone)
        ? cubit.countryCode
        : null,
    onCountryChanged: (country) {
      cubit.countryCode = country;
    },
    validator: (_) {
      if (state is QrGenerateError) {
        return state.message;
      }
      return null;
    },
    suffixIcon: controller.text.isNotEmpty
        ? IconButton(
            icon: Icon(Icons.close),
            onPressed: () => cubit.clearInput(controllertype),
          )
        : const SizedBox(),
    onChanged: (_) {
      cubit.emit(QrGenerateLoaded());
    },
  );
}
