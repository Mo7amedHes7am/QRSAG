import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/core/Methods/Global_Methods.dart';
import 'package:qr_scanner_and_generator/core/cache/cache_manager.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';

class DateTimePickerTheme {
  static ThemeData getLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color(0xffFDB623),
      primaryColorLight: const Color(0xffFFE082),
      primaryColorDark: const Color(0xffE6A000),
      scaffoldBackgroundColor: Colors.white,
      dialogBackgroundColor: Colors.white,

      colorScheme: const ColorScheme.light(
        primary: Color(0xffFDB623),
        secondary: Color(0xffFDB623),
        surface: Colors.white,
        background: Colors.white,
        error: Color(0xffd70015),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Color(0xff1F2937),
        onBackground: Color(0xff1F2937),
        onError: Colors.white,
        brightness: Brightness.light,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xffFDB623),
        foregroundColor: Color(0xff1F2937),
        elevation: 0,
        centerTitle: true,
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        titleTextStyle: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: const Color(0xff1F2937),
          fontFamily: getLocaleFont(),
        ),
        contentTextStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xff1F2937),
          fontFamily: getLocaleFont(),
        ),
      ),

      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: const Color(0xff1F2937),
          fontFamily: getLocaleFont(),
        ),
        headlineMedium: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: const Color(0xff1F2937),
          fontFamily: getLocaleFont(),
        ),
        headlineSmall: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: const Color(0xff1F2937),
          fontFamily: getLocaleFont(),
        ),
        bodyLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xff1F2937),
          fontFamily: getLocaleFont(),
        ),
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xff6B7280),
          fontFamily: getLocaleFont(),
        ),
        bodySmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xff9CA3AF),
          fontFamily: getLocaleFont(),
        ),
        labelLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontFamily: getLocaleFont(),
        ),
        labelMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: const Color(0xff1F2937),
          fontFamily: getLocaleFont(),
        ),
        labelSmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: const Color(0xff6B7280),
          fontFamily: getLocaleFont(),
        ),
      ),

      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xffFDB623),
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffFDB623),
          foregroundColor: Colors.white,
          disabledBackgroundColor: const Color(0xff9CA3AF),
          disabledForegroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            fontFamily: getLocaleFont(),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xff6B7280),
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            fontFamily: getLocaleFont(),
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xffE9EAEB)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xffE9EAEB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xffFDB623), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xffd70015)),
        ),
        labelStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xff1F2937),
          fontFamily: getLocaleFont(),
        ),
        hintStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xff9CA3AF),
          fontFamily: getLocaleFont(),
        ),
        errorStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xffd70015),
          fontFamily: getLocaleFont(),
        ),
      ),

      dividerTheme: const DividerThemeData(
        color: Color(0xffE9EAEB),
        thickness: 1,
        space: 1,
      ),

      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 2,
        shadowColor: const Color(0x14000000),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      popupMenuTheme: PopupMenuThemeData(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xff1F2937),
          fontFamily: getLocaleFont(),
        ),
      ),

      shadowColor: const Color(0x14000000),

      useMaterial3: true,
    );
  }

  static ThemeData getDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0xffFDB623),
      primaryColorLight: const Color(0xffFFE082),
      primaryColorDark: const Color(0xffE6A000),
      scaffoldBackgroundColor: const Color(0xff000814),
      dialogBackgroundColor: const Color(0xff000814),

      colorScheme: const ColorScheme.dark(
        primary: Color(0xffFDB623),
        secondary: Color(0xffFDB623),
        surface: Color(0xff000814),
        background: Color(0xff000814),
        error: Color(0xfff87171),
        onPrimary: Color(0xff000814),
        onSecondary: Color(0xff000814),
        onSurface: Color(0xffF9FAFB),
        onBackground: Color(0xffF9FAFB),
        onError: Colors.white,
        brightness: Brightness.dark,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xffFDB623),
        foregroundColor: Color(0xff000814),
        elevation: 0,
        centerTitle: true,
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: const Color(0xff000814),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        titleTextStyle: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: const Color(0xffF9FAFB),
          fontFamily: getLocaleFont(),
        ),
        contentTextStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xffF9FAFB),
          fontFamily: getLocaleFont(),
        ),
      ),

      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: const Color(0xffF9FAFB),
          fontFamily: getLocaleFont(),
        ),
        headlineMedium: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: const Color(0xffF9FAFB),
          fontFamily: getLocaleFont(),
        ),
        headlineSmall: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: const Color(0xffF9FAFB),
          fontFamily: getLocaleFont(),
        ),
        bodyLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xffF9FAFB),
          fontFamily: getLocaleFont(),
        ),
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xff9CA3AF),
          fontFamily: getLocaleFont(),
        ),
        bodySmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xff6B7280),
          fontFamily: getLocaleFont(),
        ),
        labelLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: const Color(0xff000814),
          fontFamily: getLocaleFont(),
        ),
        labelMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: const Color(0xffF9FAFB),
          fontFamily: getLocaleFont(),
        ),
        labelSmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: const Color(0xff9CA3AF),
          fontFamily: getLocaleFont(),
        ),
      ),

      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xffFDB623),
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffFDB623),
          foregroundColor: const Color(0xff000814),
          disabledBackgroundColor: const Color(0xff6B7280),
          disabledForegroundColor: const Color(0xff000814),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            fontFamily: getLocaleFont(),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xff9CA3AF),
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            fontFamily: getLocaleFont(),
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xff000814),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xff2F2F2F)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xff2F2F2F)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xffFDB623), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xfff87171)),
        ),
        labelStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xffF9FAFB),
          fontFamily: getLocaleFont(),
        ),
        hintStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xff6B7280),
          fontFamily: getLocaleFont(),
        ),
        errorStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xfff87171),
          fontFamily: getLocaleFont(),
        ),
      ),

      dividerTheme: const DividerThemeData(
        color: Color(0xff2F2F2F),
        thickness: 1,
        space: 1,
      ),

      cardTheme: CardThemeData(
        color: const Color(0xff000814),
        elevation: 2,
        shadowColor: const Color(0x22000000),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      popupMenuTheme: PopupMenuThemeData(
        color: const Color(0xff000814),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xffF9FAFB),
          fontFamily: getLocaleFont(),
        ),
      ),

      shadowColor: const Color(0x22000000),

      useMaterial3: true,
    );
  }

  static ThemeData getCurrentTheme() {
    final isDark = CacheManager.getGlobalData().theme == 0;
    return isDark ? getDarkTheme() : getLightTheme();
  }
}
