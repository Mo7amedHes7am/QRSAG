import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Data/Models/language_model.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/Cubit/splash_cubit.dart';
import 'package:qr_scanner_and_generator/core/cache/cache_manager.dart';

mixin LanguageMixin on SplashCubitBase {
  void initLang(BuildContext context) {
    try {
      searchController = TextEditingController();
    } catch (e) {}
    allLanguages = LanguageModel.languages();
    filteredLanguages = List.from(allLanguages);
    final Loc = context.locale.languageCode;
    selectedLanguage = allLanguages.singleWhere(
      (element) => element.code == Loc,
      orElse: () => allLanguages[1],
    );
  }

  void onSearchChanged(String query) {
    if (isClosed) return;

    if (query.isEmpty) {
      filteredLanguages = List.from(allLanguages);
    } else {
      filteredLanguages = allLanguages
          .where(
            (lang) => lang.label.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }

    if (!isClosed) emit(LanguageFilteredState(List.from(filteredLanguages)));
  }

  Future<void> changeLanguage({
    required LanguageModel lang,
    required BuildContext context,
  }) async {
    await context.setLocale(Locale(lang.code));
    await CacheManager.setGlobalData(language: lang.code);
    selectedLanguage = lang;
    if (!isClosed) emit(LanguageChangedState(lang));
  }
}
