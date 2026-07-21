import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/CustomText.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';

int b = 1;

StatefulBuilder CustomTabBar({
  required Widget Screen1,
  required Widget Screen2,
  required BuildContext context,
}) {
  return StatefulBuilder(
    builder: (context, setState) => Column(
      children: [
        SizedBox(height: 35.h),
        Container(
          width: MediaQuery.of(context).size.width - 96.w,
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
          height: 60.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.sp),
            color: appColors.textfield,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    b = 1;
                  });
                },
                child: Container(
                  width: (MediaQuery.of(context).size.width - 108.w) / 2,
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.sp),
                    color: b == 1 ? appColors.primary : Colors.transparent,
                  ),
                  child: Center(
                    child: CustomText.x18.medium("Scan").primaryTextColor,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    b = 2;
                  });
                },
                child: Container(
                  width: (MediaQuery.of(context).size.width - 108.w) / 2,
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.sp),
                    color: b == 2 ? appColors.primary : Colors.transparent,
                  ),
                  child: Center(
                    child: CustomText.x18.medium("Generate").primaryTextColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 39.h),
        Expanded(
          child: SingleChildScrollView(child: b == 1 ? Screen1 : Screen2),
        ),
        SizedBox(height: 120.h),
      ],
    ),
  );
}
