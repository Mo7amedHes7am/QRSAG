import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/theme/theme_state.dart';

Widget systemWrapper(BuildContext context, Widget child) {
  final themeMode = context.watch<ThemeCubit>().state;
  final isDark = themeMode == ThemeMode.dark;

  return AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle(
      systemNavigationBarColor: appColors.background,
      systemNavigationBarIconBrightness: isDark
          ? Brightness.light
          : Brightness.dark,
    ),
    child: child,
  );
}
