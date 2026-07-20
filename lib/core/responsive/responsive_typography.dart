import 'package:flutter/material.dart';
import 'responsive_core.dart';

class AppText {
  const AppText._();

  static TextStyle get displayLarge =>
      TextStyle(fontSize: 48.sp, fontWeight: FontWeight.bold, height: 1.2);

  static TextStyle get headline =>
      TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w600);

  static TextStyle get title =>
      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600);

  static TextStyle get bodyLarge => TextStyle(fontSize: 18.sp);

  static TextStyle get body => TextStyle(fontSize: 16.sp);

  static TextStyle get bodySmall => TextStyle(fontSize: 14.sp);

  static TextStyle get caption =>
      TextStyle(fontSize: 12.sp, color: Colors.grey);

  static TextStyle responsive(
    BuildContext context, {
    required double mobile,
    double? tablet,
    double? desktop,
    FontWeight? weight,
  }) {
    final size = context.isDesktop
        ? (desktop ?? tablet ?? mobile)
        : context.isTablet
        ? (tablet ?? mobile)
        : mobile;

    return TextStyle(fontSize: size.sp, fontWeight: weight);
  }
}
