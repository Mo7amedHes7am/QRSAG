import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Data/Models/language_model.dart';

part 'splash_state.dart';

@lazySingleton
abstract class SplashCubitBase extends Cubit<SplashState> {
  SplashCubitBase() : super(SplashInitialState());

  late final TextEditingController searchController;

  List<LanguageModel> filteredLanguages = [];
  late List<LanguageModel> allLanguages;
  late LanguageModel selectedLanguage;

  Future<void> init(BuildContext context) async {
    emit(SplashLoadingState());

    try {
      // CacheManager.reset();
      initLang(context);
      await Future.delayed(const Duration(seconds: 3));

      emit(SplashLoadedState());
    } catch (e) {
      emit(SplashErrorState(e.toString()));
    }
  }

  void onSearchChanged(String query) {}

  Future<void> changeLanguage({
    required LanguageModel lang,
    required BuildContext context,
  }) async {}

  void initLang(BuildContext context) {}
}
