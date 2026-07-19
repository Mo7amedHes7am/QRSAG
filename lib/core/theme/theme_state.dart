import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner_and_generator/core/cache/cache_manager.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  static const String _key = "themeMode";

  ThemeCubit() : super(ThemeMode.system) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    int themeIndex = CacheManager.getGlobalData().theme;
    if (themeIndex == -1) {
      final brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      themeIndex = brightness == Brightness.dark
          ? ThemeMode.dark.index
          : ThemeMode.light.index;
      emit(ThemeMode.values[themeIndex]);
    } else {
      emit(ThemeMode.values[themeIndex]);
    }
  }

  Future<void> toggleTheme() async {
    final newTheme = state == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    emit(newTheme);
    await CacheManager.setGlobalData(theme: newTheme.index);
  }

  Future<void> changeTheme(ThemeMode mode) async {
    emit(mode);
    await CacheManager.setGlobalData(theme: mode.index);
  }
}
