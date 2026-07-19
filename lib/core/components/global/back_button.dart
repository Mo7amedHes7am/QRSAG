import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/Methods/app_Navigation.dart';

Widget Back_Button({
  required BuildContext context,
  int style = 1,
  bool isTablet = false,
  GestureTapCallback? onTap,
}) {
  final double scale = isTablet ? 1.45 : 1.0;

  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      InkWell(
        onTap: onTap ?? () => AppNavigator.back(context),
        child: Container(
          height: isTablet ? (80.sp * scale) : 42.sp,
          width: isTablet ? (80.sp * scale) : 42.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(isTablet ? 20.r : 12.r),
            color: style == 1
                ? Colors.white.withValues(alpha: 0.2)
                : appColors.primary.withValues(alpha: 0.2),
          ),
          child: Center(
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: style == 1 ? Colors.white : appColors.primaryTextColor,
              size: isTablet ? (32.sp * scale) : 22.sp,
            ),
          ),
        ),
      ),
    ],
  );
}
