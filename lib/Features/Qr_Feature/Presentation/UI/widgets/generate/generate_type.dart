import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Data/Models/qrtype.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Logic/Methods.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/CustomText.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';

Widget Generatetype({required QrType type, required BuildContext context}) {
  final isArabic = context.locale.languageCode == 'ar';
  return InkWell(
    onTap: () => handle_navigation(type: type, context: context),
    child: Container(
      width: 82.sp,
      height: 82.sp,
      decoration: BoxDecoration(
        color: appColors.primary,
        borderRadius: BorderRadius.circular(8.sp),
        border: Border.all(color: appColors.primaryTextColor),
        boxShadow: [
          BoxShadow(
            color: appColors.primary.withValues(alpha: 0.3),
            spreadRadius: 5.sp,
            blurRadius: 7.sp,
            offset: Offset(3, 3),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              width: 37.sp,
              height: 37.sp,
              type.image,
              color: appColors.primaryTextColor,
              fit: BoxFit.cover,
            ),
            CustomText.x12
                .medium(isArabic ? type.arlabel : type.enlabel)
                .primaryTextColor,
          ],
        ),
      ),
    ),
  );
}
