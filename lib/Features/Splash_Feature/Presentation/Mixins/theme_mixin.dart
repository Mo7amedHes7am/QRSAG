import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Logic/Methods.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/Cubit/splash_cubit.dart';
import 'package:qr_scanner_and_generator/core/theme/theme_state.dart';

mixin ThemeMixin on SplashCubitBase {
  Future<void> initTheme(BuildContext context) async {
    themeCubit = context.read<ThemeCubit>();
    currentTheme = themeCubit.state;
    isDark = currentTheme == ThemeMode.dark;
  }

  Future<void> changeTheme({required BuildContext context}) async {
    themeCubit.changeTheme(currentTheme);
    CheckWhereToGo(context: context);
  }

  @override
  Future<void> toggleTheme({required BuildContext context}) async {
    await themeCubit.toggleTheme();
    await initTheme(context);
    if (!isClosed) emit(ThemeChangedState());
  }
}
