import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Data/Models/language_model.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/Cubit/splash_cubit.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/UI/widgets/choose_language_content.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/CustomText.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:qr_scanner_and_generator/generated/locale_keys.g.dart';

Widget buildCLLandscape(
  BuildContext context,
  LanguageModel currentLang,
  bool isTablet,
  bool isWeb,
  SplashCubit cubit,
) {
  return Padding(
    padding: EdgeInsets.all(isWeb ? 40.w : (isTablet ? 60.w : 20.w)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: isWeb ? 1 : 1,
          child: Padding(
            padding: EdgeInsets.only(right: isWeb ? 40.w : 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText.x26
                    .semibold(LocaleKeys.chooseLanguage_title.tr())
                    .primaryTextColor,
                SizedBox(height: 12.h),
                CustomText.x18
                    .semibold(LocaleKeys.chooseLanguage_subtitle.tr())
                    .secondaryTextColor,
              ],
            ),
          ),
        ),
        Expanded(
          flex: isWeb ? 1 : 1,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: isWeb ? 500.w : double.infinity,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: CLContent(context, currentLang, isTablet, isWeb, cubit),
            ),
          ),
        ),
      ],
    ),
  );
}
