import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 60.sp,
        height: 60.sp,
        decoration: BoxDecoration(
          color: appColors.primary,
          borderRadius: BorderRadius.circular(6.sp),
        ),
        child: Center(
          child: Icon(icon, color: appColors.background, size: 28.sp),
        ),
      ),
    );
  }
}
