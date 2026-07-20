import 'package:flutter/material.dart'
    show ThemeData, TextTheme, FontWeight, TextStyle, BottomAppBarThemeData;
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/Methods/Global_Methods.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';

class AppTheme {
  static ThemeData get themeData => ThemeData(
    fontFamily: getLocaleFont(),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: appColors.primaryTextColor,
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
      ),
    ),
    scaffoldBackgroundColor: appColors.background,
    bottomAppBarTheme: BottomAppBarThemeData(color: appColors.background),
  );
}
