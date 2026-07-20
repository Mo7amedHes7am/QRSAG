import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/custom_button.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:qr_scanner_and_generator/generated/locale_keys.g.dart';

Widget ContinueButton(BuildContext context, VoidCallback onPressed) {
  final isTablet = MediaQuery.of(context).size.width >= 600;
  final isWeb =
      Theme.of(context).platform == TargetPlatform.iOS ||
          Theme.of(context).platform == TargetPlatform.android
      ? false
      : true;

  return SafeArea(
    child: SizedBox(
      height: 100.h,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          isWeb ? 40.w : (isTablet ? 60.w : 20.w),
          10.h,
          isWeb ? 40.w : (isTablet ? 60.w : 20.w),
          isWeb ? 20.h : (isTablet ? 30.h : 20.h),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isWeb ? 400.w : double.infinity,
            ),
            child: CustomButton(
              buttonTitle: LocaleKeys.common_continue.tr(),
              onPressed: onPressed,
              active: true,
              height: isWeb ? 100.h : (isTablet ? 80.h : 55.h),
              style: 1,
              isTablet: isTablet,
            ),
          ),
        ),
      ),
    ),
  );
}
