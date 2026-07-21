import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/CustomText.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';

NavbarTab({
  required String label,
  required IconData icon,
  required VoidCallback onSelected,
  required bool isCenter,
  required bool isSelected,
}) {
  return isCenter
      ? InkWell(
          onTap: onSelected,
          child: Transform.translate(
            offset: Offset(0, -30.h),
            child: Container(
              width: 70.sp,
              height: 70.sp,
              decoration: BoxDecoration(
                color: isSelected ? appColors.primary : appColors.grey,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: appColors.primary.withValues(alpha: 0.5),
                    spreadRadius: 5.sp,
                    blurRadius: 7.sp,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Icon(icon, color: appColors.background, size: 40.sp),
              ),
            ),
          ),
        )
      : InkWell(
          onTap: onSelected,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 0.h),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: isSelected ? appColors.primary : Colors.transparent,
                  width: 4.sp,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: isSelected ? appColors.primary : appColors.grey,
                  size: (25).sp,
                ),
                CustomText.x18
                    .medium(label)
                    .center
                    .color(isSelected ? appColors.primary : appColors.grey),
              ],
            ),
          ),
        );
}
