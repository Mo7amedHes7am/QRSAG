import 'package:qr_scanner_and_generator/core/Methods/Global_Methods.dart';
import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Color,
        ButtonStyle,
        BuildContext,
        Widget,
        ElevatedButton,
        Size,
        BorderRadius,
        RoundedRectangleBorder,
        BorderSide,
        Colors,
        TextStyle,
        FontWeight,
        TextOverflow,
        AnimatedContainer,
        AnimatedSwitcher,
        Curves,
        Center;
import 'package:flutter/cupertino.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';

class CustomButton extends StatelessWidget {
  final String buttonTitle;
  final bool active;
  final bool isLoading;
  final double? width;
  final double? height;
  final int? style;
  final Color? borderColor;
  final Color? customColor;
  final ButtonStyle? buttonStyle;
  final bool isTablet;
  final void Function() onPressed;

  const CustomButton({
    super.key,
    required this.buttonTitle,
    required this.onPressed,
    required this.active,
    required this.style,
    this.isLoading = false,
    this.buttonStyle,
    this.width,
    this.height,
    this.borderColor,
    this.customColor,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    final buttonWidth = width ?? (isTablet ? 800.w : 343.w);
    final buttonHeight = height ?? (isTablet ? 90.h : 52.h);

    final loadingWidth = isTablet ? 120.w : 70.w;

    final borderRadius = BorderRadius.circular(isTablet ? 120.r : 62.r);

    final textColor = active ? Colors.white : appColors.grey;

    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOutCubic,
        width: isLoading ? loadingWidth : buttonWidth,
        height: buttonHeight,
        child: ElevatedButton(
          onPressed: (active && !isLoading) ? onPressed : null,
          style:
              buttonStyle ??
              (active
                  ? style == 1
                        ? ElevatedButton.styleFrom(
                            fixedSize: Size(
                              isLoading ? loadingWidth : buttonWidth,
                              buttonHeight,
                            ),
                            backgroundColor: customColor ?? appColors.primary,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: borderRadius,
                            ),
                          )
                        : ElevatedButton.styleFrom(
                            fixedSize: Size(
                              isLoading ? loadingWidth : buttonWidth,
                              buttonHeight,
                            ),
                            elevation: 0,
                            backgroundColor: appColors.textfield,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: borderColor ?? appColors.grey,
                                width: isTablet ? 3.w : 1.w,
                              ),
                              borderRadius: borderRadius,
                            ),
                          )
                  : ElevatedButton.styleFrom(
                      fixedSize: Size(
                        isLoading ? loadingWidth : buttonWidth,
                        buttonHeight,
                      ),
                      elevation: 0,
                      backgroundColor: appColors.grey,
                      shape: RoundedRectangleBorder(borderRadius: borderRadius),
                    )),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            switchInCurve: Curves.easeOut,
            switchOutCurve: Curves.easeIn,
            child: isLoading
                ? const _IOSLoader()
                : AutoSizeText(
                    buttonTitle,
                    key: const ValueKey("text"),
                    maxLines: 1,
                    minFontSize: isTablet ? 18 : 12,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: isTablet ? 28.sp : 18.sp,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                      fontFamily: getLocaleFont(),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class _IOSLoader extends StatelessWidget {
  const _IOSLoader();

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.6, end: 1.0),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: const CupertinoActivityIndicator(radius: 12),
        );
      },
    );
  }
}
