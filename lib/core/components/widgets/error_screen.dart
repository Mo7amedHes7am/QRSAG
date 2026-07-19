import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/custom_button.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/CustomText.dart';
import 'package:qr_scanner_and_generator/core/tools/Spacer.dart';
import 'package:qr_scanner_and_generator/core/utils/app_images.dart';

class ErrorScreen extends StatelessWidget {
  final String text;
  final String? errorDetails;
  final String? image;
  final double? customHeight;
  final double? customWidth;
  final Color? customColor;
  final String? buttonlabel;
  final VoidCallback? onTap;
  final bool? isTablet;
  final bool showRetryButton;

  const ErrorScreen({
    Key? key,
    required this.text,
    this.errorDetails,
    this.image,
    this.customHeight,
    this.customWidth,
    this.customColor,
    this.buttonlabel,
    this.onTap,
    this.isTablet,
    this.showRetryButton = true,
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
            Image.asset(
              AppImages.Gifs.error,
              width: customWidth ?? (tablet ? 240.w : 120.w),
              height: customHeight ?? (tablet ? 240.w : 120.w),
              fit: BoxFit.cover,
            ),

            Space.vertical.custom(tablet ? 32.h : 16.h),

            tablet
                ? CustomText.x32.extrabold(text).center.failed
                : CustomText.x26.extrabold(text).center.failed,

            if (errorDetails != null) ...[
              Space.vertical.custom(tablet ? 16.h : 12.h),
              Container(
                constraints: BoxConstraints(maxWidth: tablet ? 500.w : 300.w),
                child: tablet
                    ? CustomText.x16.medium(errorDetails!).center.grey
                    : CustomText.x14.medium(errorDetails!).center.grey,
              ),
            ],

            if (showRetryButton && buttonlabel != null && onTap != null) ...[
              Space.vertical.custom(tablet ? 32.h : 24.h),
              CustomButton(
                buttonTitle: buttonlabel!,
                onPressed: onTap!,
                active: true,
                customColor: customColor ?? Colors.red,
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
