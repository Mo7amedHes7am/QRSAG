import 'package:qr_scanner_and_generator/core/components/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/CustomText.dart';
import 'package:qr_scanner_and_generator/core/tools/Spacer.dart';
import 'package:qr_scanner_and_generator/core/utils/app_images.dart';

class NoDataScreen extends StatelessWidget {
  final String text;
  final String? image;
  final String? secondText;
  final double? customHeight;
  final double? customWidth;
  final Color? customColor;
  final String? buttonlabel;
  final VoidCallback? onTap;
  final bool? isTablet;

  const NoDataScreen({
    Key? key,
    required this.text,
    this.image,
    this.secondText,
    this.customHeight,
    this.customWidth,
    this.customColor,
    this.buttonlabel,
    this.onTap,
    this.isTablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool tablet = isTablet ?? MediaQuery.of(context).size.width >= 600;

    return Center(
      child: Padding(
        padding: EdgeInsets.all(tablet ? 24.w : 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              image ?? AppImages.Svgs.nodata,
              width: customWidth ?? (tablet ? 240.w : 120.w),
              height: customHeight ?? (tablet ? 240.w : 120.w),
              fit: BoxFit.cover,
            ),

            Space.vertical.custom(tablet ? 32.h : 16.h),

            tablet
                ? CustomText.x32.extrabold(text).center.primaryTextColor
                : CustomText.x26.extrabold(text).center.primaryTextColor,

            if (secondText != null) ...[
              Space.vertical.custom(tablet ? 24.h : 16.h),
              Container(
                constraints: BoxConstraints(maxWidth: tablet ? 500.w : 277.w),
                child: tablet
                    ? CustomText.x20.medium(secondText!).center.primaryTextColor
                    : CustomText.x16
                          .medium(secondText!)
                          .center
                          .primaryTextColor,
              ),
            ],

            if (buttonlabel != null && onTap != null) ...[
              Space.vertical.custom(tablet ? 32.h : 16.h),
              CustomButton(
                buttonTitle: buttonlabel!,
                onPressed: onTap!,
                active: true,
                customColor: customColor,
                style: 1,
                isTablet: tablet,
                width: tablet ? 400.w : null,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
