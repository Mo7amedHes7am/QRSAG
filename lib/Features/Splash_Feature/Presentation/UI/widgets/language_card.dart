import 'package:qr_scanner_and_generator/Features/Splash_Feature/Data/Models/language_model.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/CustomText.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';

class LanguageCard extends StatelessWidget {
  final LanguageModel lang;
  final bool isSelected;
  final VoidCallback? onTap;
  final bool isTablet;

  const LanguageCard({
    super.key,
    required this.lang,
    required this.isSelected,
    this.onTap,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    final isClickable = onTap != null;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: isTablet ? 18.h : 10.h,
          horizontal: isTablet ? 24.w : 16.w,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? appColors.primary : appColors.grey,
          ),
          borderRadius: BorderRadius.circular(isTablet ? 60.r : 40.r),
          color: isSelected
              ? appColors.button.withValues(alpha: 0.2)
              : appColors.background,
        ),
        child: Row(
          children: [
            Container(
              width: isTablet ? 70.sp : 40.sp,
              height: isTablet ? 70.sp : 40.sp,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              clipBehavior: Clip.hardEdge,
              child: SvgPicture.asset(lang.flag, fit: BoxFit.cover),
            ),

            SizedBox(width: 12.w),

            Expanded(
              child: CustomText.x22
                  .bold(lang.label)
                  .fontSize(isTablet ? 22.sp : 16.sp)
                  .color(
                    isSelected ? appColors.grey : appColors.primaryTextColor,
                  ),
            ),

            Container(
              width: isTablet ? 40.sp : 22.sp,
              height: isTablet ? 40.sp : 22.sp,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? appColors.primary : Colors.transparent,
                border: isSelected ? null : Border.all(color: appColors.grey),
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: isTablet ? 24.sp : 14.sp,
                      color: Colors.white,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
