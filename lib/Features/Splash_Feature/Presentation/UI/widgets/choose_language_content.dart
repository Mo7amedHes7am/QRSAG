import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Data/Models/language_model.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/Cubit/splash_cubit.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/UI/widgets/language_card.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/CustomText.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/custom_form_field.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/no_data_screen.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:qr_scanner_and_generator/generated/locale_keys.g.dart';

List<Widget> CLContent(
  BuildContext context,
  LanguageModel currentLang,
  bool isTablet,
  bool isWeb,
  SplashCubit cubit,
) {
  return [
    CustomText.x18
        .semibold(LocaleKeys.chooseLanguage_selected.tr())
        .primaryTextColor,

    SizedBox(height: 10.h),

    LanguageCard(lang: currentLang, isSelected: true, isTablet: isTablet),

    SizedBox(height: 20.h),

    CustomText.x18
        .semibold(LocaleKeys.chooseLanguage_all.tr())
        .primaryTextColor,

    SizedBox(height: 12.h),

    Container(
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: isWeb ? 500.w : double.infinity),
      child: CustomFormField(
        controller: cubit.searchController,
        onChanged: cubit.onSearchChanged,
        height: isWeb ? (isTablet ? 65.h : 55.h) : (isTablet ? 70.h : 55.h),
        hint: LocaleKeys.common_search.tr(),
        prefixIcon: Icon(
          Icons.search_outlined,
          color: appColors.primaryTextColor,
          size: isWeb ? 20.sp : 24.sp,
        ),
        isTablet: isTablet,
        enabled: true,
      ),
    ),

    SizedBox(height: 12.h),

    ConstrainedBox(
      constraints: BoxConstraints(maxHeight: isWeb ? 400.h : double.infinity),
      child: cubit.filteredLanguages.isEmpty
          ? NoDataScreen(
              text: LocaleKeys.chooseLanguage_nodata.tr(),
              isTablet: isTablet,
            )
          : ListView.separated(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(height: 12.h),
              itemCount: cubit.filteredLanguages.length,
              itemBuilder: (context, index) {
                final lang = cubit.filteredLanguages[index];
                return LanguageCard(
                  lang: lang,
                  isSelected: currentLang.label == lang.label,
                  isTablet: isTablet,
                  onTap: () async =>
                      await cubit.changeLanguage(lang: lang, context: context),
                );
              },
            ),
    ),
  ];
}
