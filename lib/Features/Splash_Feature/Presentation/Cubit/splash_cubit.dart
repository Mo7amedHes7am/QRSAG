import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Data/Model/CategoryModel.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Logic/Methods.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/cache/cache_manager.dart';

part 'splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  Timer? _timer;
  int active = 0;

  int _onboardStep = 0;

  @factoryMethod
  SplashCubit() : super(SplashInitialState());

  void startLoaderAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (!isClosed) {
        if (timer.tick % 5 == 0) {
          active = (active + 1) % 3;
          emit(SplashLoadingState(active));
        }
      }
    });
  }

  void stopLoaderAnimation() {
    _timer?.cancel();
  }

  Future<void> init(BuildContext context) async {
    emit(SplashInitialState());

    try {
      if (CacheManager.getGlobalData().language == '') {
        await CacheManager.setGlobalData(language: context.locale.languageCode);
      }

      await Future.delayed(const Duration(seconds: 2));

      if (CacheManager.getGlobalData().onboarding == false) {
        stopLoaderAnimation();
        emit(SplashWelcomeState(0));
      } else {
        splash = true;
        CheckWhereToGo(context, true);
        stopLoaderAnimation();
      }
    } catch (e) {
      stopLoaderAnimation();
      emit(SplashErrorState(e.toString()));
    }
  }
}
