import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/Methods/app_Navigation.dart';

Widget Back_Button({
  required BuildContext context,
  int style = 1,
  bool isTablet = false,
  int size = 40,
  GestureTapCallback? onTap,
}) {
  final double scale = isTablet ? 1.45 : 1.0;

  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      InkWell(
        onTap: onTap ?? () => AppNavigator.back(context),
        child: Container(
          height: isTablet ? ((2 * size).sp * scale) : size.sp,
          width: isTablet ? ((2 * size) * scale) : size.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(isTablet ? 20.r : 12.r),
            color: style == 1 ? appColors.background : appColors.primary,
            boxShadow: [
              BoxShadow(
                color: appColors.primary.withValues(alpha: 0.3),
                spreadRadius: 5.sp,
                blurRadius: 7.sp,
                offset: const Offset(-2, -1),
              ),
            ],
          ),
          child: Center(
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: style == 1
                  ? appColors.primary
                  : appColors.primaryTextColor,
              size: isTablet ? ((size / 2).sp * scale) : (size / 2).sp,
            ),
          ),
        ),
      ),
    ],
  );
}
