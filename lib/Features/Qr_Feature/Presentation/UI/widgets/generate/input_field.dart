import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Data/Models/qrtype.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Cubit/qr_cubit.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/custom_form_field.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';

Widget InputField({
  required TextEditingController controller,
  required QrType type,
  required QrCubit cubit,
  required QrState state,
}) {
  return CustomFormField(
    height: 45.h,
    controller: controller,
    isEmail: type == QrType.email,
    isUserName: [QrType.instagram, QrType.x].contains(type),
    isUrl: QrType.website == type,
    isPlainText: [QrType.text, QrType.data].contains(type),
    isPhoneNumber: [QrType.phone, QrType.whatsapp].contains(type),
    countryCode: cubit.countryCode,
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
        ? IconButton(icon: Icon(Icons.close), onPressed: cubit.clearInput)
        : const SizedBox(),
    onChanged: (_) {
      cubit.emit(QrGenerateLoaded());
    },
  );
}
