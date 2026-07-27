import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Cubit/qr_cubit.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Cubit/qr_cubit_base.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/Methods/Global_Methods.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:qr_scanner_and_generator/generated/locale_keys.g.dart';

class VisaUtils {
  static TextStyle getCreditCardTextStyle() {
    return TextStyle(
      color: appColors.background,
      fontFamily: getLocaleFont(),
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static InputConfiguration getInputConfiguration(
    BuildContext context,
    TextEditingController cardNumberController,
    TextEditingController expiryDateController,
    TextEditingController cvvCodeController,
    TextEditingController cardHolderNameController,
    QrCubit cubit,
  ) {
    return InputConfiguration(
      cardNumberTextStyle: getInputTextStyle(2),
      expiryDateTextStyle: getInputTextStyle(2),
      cvvCodeTextStyle: getInputTextStyle(2),
      cardHolderTextStyle: getInputTextStyle(2),
      cardNumberDecoration: getInputDecoration(
        context,
        hintText: LocaleKeys.visa_card_number_hint.tr(),
        labelText: LocaleKeys.visa_card_number_label.tr(),
        controller: cardNumberController,
        cubit: cubit,
      ),
      expiryDateDecoration: getInputDecoration(
        context,
        hintText: LocaleKeys.visa_card_expiry_hint.tr(),
        labelText: LocaleKeys.visa_card_expiry_label.tr(),
        controller: expiryDateController,
        cubit: cubit,
      ),
      cvvCodeDecoration: getInputDecoration(
        context,
        hintText: LocaleKeys.visa_card_cvv_hint.tr(),
        labelText: LocaleKeys.visa_card_cvv_label.tr(),
        controller: cvvCodeController,
        cubit: cubit,
      ),
      cardHolderDecoration: getInputDecoration(
        context,
        hintText: LocaleKeys.visa_card_holder_hint.tr(),
        labelText: LocaleKeys.visa_card_holder_label.tr(),
        controller: cardHolderNameController,
        cubit: cubit,
      ),
    );
  }

  static InputDecoration getInputDecoration(
    BuildContext context, {
    required String hintText,
    required String labelText,
    required TextEditingController controller,
    required QrCubit cubit,
  }) {
    return InputDecoration(
      labelStyle: getInputTextStyle(1),
      isCollapsed: false,
      contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
      hintText: hintText,
      labelText: labelText,
      filled: true,
      hintStyle: getInputTextStyle(3),
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: appColors.primary, width: 2.sp),
        borderRadius: BorderRadius.circular(8.sp),
      ),
      fillColor: appColors.textfield,
      suffixIcon: controller.text.trim().isNotEmpty
          ? IconButton(
              icon: Icon(
                Icons.close,
                color: const Color(0xff6D6D6D),
                size: 20.sp,
              ),
              onPressed: () {
                controller.clear();
                cubit.emit(QrGenerateLoaded());
              },
              tooltip: LocaleKeys.visa_card_clear_field.tr(),
            )
          : const SizedBox(),
    );
  }

  static TextStyle getInputTextStyle(int type) {
    return TextStyle(
      color: type == 1
          ? appColors.grey
          : type == 2
          ? appColors.primaryTextColor
          : const Color(0xff6D6D6D),
      fontFamily: getLocaleFont(),
      fontSize: type == 3 ? 12.sp : 14.sp,
      fontWeight: FontWeight.w400,
      overflow: type == 3 ? TextOverflow.ellipsis : null,
    );
  }

  static Glassmorphism? getGlassmorphismConfig({
    required bool useGlassMorphism,
  }) {
    if (!useGlassMorphism) {
      return null;
    }
    return Glassmorphism.defaultConfig();
  }

  static void onCreditCardModelChange(
    CreditCardModel creditCardModel,
    QrCubit cubit,
    TextEditingController cardNumberController,
    TextEditingController expiryDateController,
    TextEditingController cardHolderNameController,
    TextEditingController cvvCodeController,
  ) {
    cardNumberController.text = creditCardModel.cardNumber;
    expiryDateController.text = creditCardModel.expiryDate;
    cardHolderNameController.text = creditCardModel.cardHolderName;
    cvvCodeController.text = creditCardModel.cvvCode;

    cubit.isCvvFocused = creditCardModel.isCvvFocused;
    cubit.valid = validateForm(cubit.VisaformKey);
    cubit.emit(QrGenerateLoaded());
  }

  static bool validateForm(GlobalKey<FormState> formKey) {
    return formKey.currentState?.validate() ?? false;
  }
}
