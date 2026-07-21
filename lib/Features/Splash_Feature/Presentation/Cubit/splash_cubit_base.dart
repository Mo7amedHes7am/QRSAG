import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Data/Models/language_model.dart';
import 'package:qr_scanner_and_generator/core/cache/cache_manager.dart';
import 'package:qr_scanner_and_generator/core/theme/theme_state.dart';

part 'splash_state.dart';

abstract class SplashCubitBase extends Cubit<SplashState> {
  SplashCubitBase() : super(SplashInitialState());

  late final TextEditingController searchController;

  List<LanguageModel> filteredLanguages = [];
  late List<LanguageModel> allLanguages;
  late LanguageModel selectedLanguage;

  late ThemeCubit themeCubit;
  late ThemeMode currentTheme;
  late bool isDark;

  Future<void> init(BuildContext context) async {
    if (!isClosed) emit(SplashLoadingState());

    try {
      // CacheManager.reset();
      final cache = CacheManager.getGlobalData();
      if (cache.language == "" || cache.language.isEmpty) initLang(context);
      if (cache.theme == -1) initTheme(context);
      await Future.delayed(const Duration(seconds: 3));

      if (!isClosed) emit(SplashLoadedState());
    } catch (e) {
      if (!isClosed) emit(SplashErrorState(e.toString()));
    }
  }

  void initLang(BuildContext context) {}
  void initTheme(BuildContext context) {}

  void onSearchChanged(String query) {}

  Future<void> changeLanguage({
    required LanguageModel lang,
    required BuildContext context,
  }) async {}

  Future<void> changeTheme({required BuildContext context}) async {}

  Future<void> toggleTheme({required BuildContext context}) async {}
}
