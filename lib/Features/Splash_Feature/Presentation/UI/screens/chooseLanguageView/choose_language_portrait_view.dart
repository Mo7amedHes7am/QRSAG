import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Data/Models/language_model.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/Cubit/splash_cubit.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/UI/widgets/choose_language_content.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';

Widget buildCLPortrait(
  BuildContext context,
  LanguageModel currentLang,
  bool isTablet,
  bool isWeb,
  SplashCubit cubit,
) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: isWeb ? (isTablet ? 80.w : 40.w) : (isTablet ? 60.w : 20.w),
      vertical: 20.h,
    ),
    child: ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: isWeb ? 600.w : (isTablet ? 700.w : double.infinity),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: CLContent(context, currentLang, isTablet, isWeb, cubit),
      ),
    ),
  );
}
