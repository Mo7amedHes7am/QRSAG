import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:qr_scanner_and_generator/Features/Home_Feature/Presentation/UI/screens/navbar_screen.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/Cubit/splash_cubit.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/UI/screens/ChooseThemeView/choose_theme_screen.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/UI/screens/chooseLanguageView/choose_language_screen.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/UI/screens/welcome_screen.dart';
import 'package:qr_scanner_and_generator/core/Methods/app_Navigation.dart';
import 'package:qr_scanner_and_generator/core/cache/Models/GlobalCacheModel.dart';
import 'package:qr_scanner_and_generator/core/cache/cache_manager.dart';

Future<void> CheckWhereToGo({required BuildContext context}) async {
  GlobalCacheModel cache = CacheManager.getGlobalData();
  if (cache.language.isEmpty || cache.language == "") {
    AppNavigator.toPageWithCubit(
      context: context,
      screen: ChooseLanguageScreen(),
      cubit: context.read<SplashCubit>(),
      transition: Transition.circularReveal,
      curve: Curves.fastOutSlowIn,
      duration: Duration(seconds: 3),
    );
  } else if (cache.theme == -1) {
    AppNavigator.offPageWithCubit(
      context: context,
      screen: ChooseThemeScreen(),
      cubit: context.read<SplashCubit>(),
      transition: Transition.circularReveal,
      curve: Curves.fastOutSlowIn,
      duration: Duration(seconds: 3),
    );
  } else if (cache.onboarding == false) {
    AppNavigator.offallpages(
      context,
      WelcomeScreen(),
      transition: Transition.circularReveal,
      curve: Curves.fastOutSlowIn,
      duration: Duration(seconds: 3),
    );
  } else {
    AppNavigator.offallpages(
      context,
      NavbarScreen(),
      transition: Transition.circularReveal,
      curve: Curves.fastOutSlowIn,
      duration: Duration(seconds: 3),
    );
  }
}
