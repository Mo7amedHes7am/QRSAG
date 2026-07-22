import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Data/Models/qrtype.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';

Widget GenerateBackground({required QrType type, required Widget child}) {
  return Container(
    width: 336.w,
    padding: EdgeInsets.all(35.sp),
    decoration: _boxDecoration(),
    child: Column(
      children: [
        SvgPicture.asset(
          type.image,
          width: 60.sp,
          height: 60.sp,
          color: appColors.primary,
        ),
        child,
      ],
    ),
  );
}

BoxDecoration _boxDecoration() {
  return BoxDecoration(
    color: appColors.primaryTextColor.withValues(alpha: 0.3),
    borderRadius: BorderRadius.circular(6.sp),
    border: Border(
      bottom: BorderSide(color: appColors.primary, width: 5.sp),
      top: BorderSide(color: appColors.primary, width: 5.sp),
    ),
  );
}
