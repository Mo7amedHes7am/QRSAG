import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/CustomText.dart';
import 'package:toastification/toastification.dart';

class ToastService {
  static final ToastService _instance = ToastService._internal();
  factory ToastService() => _instance;
  ToastService._internal();

  static String? _lastMessage;
  static DateTime? _lastShowTime;
  static bool _isToastVisible = false;
  static Timer? _visibilityTimer;

  static void showSuccess({
    required BuildContext context,
    required String message,
    bool isTablet = false,
  }) {
    _showToastWithDebounce(
      context: context,
      message: message,
      type: ToastificationType.success,
      primaryColor: appColors.done,
      icon: Icons.check_circle_outline,
      isTablet: isTablet,
    );
  }

  static void showError({
    required BuildContext context,
    required String message,
    bool isTablet = false,
  }) {
    _showToastWithDebounce(
      context: context,
      message: message,
      type: ToastificationType.error,
      primaryColor: appColors.failed,
      icon: Icons.error_outline,
      isTablet: isTablet,
    );
  }

  static void showInfo({
    required BuildContext context,
    required String message,
    bool isTablet = false,
  }) {
    _showToastWithDebounce(
      context: context,
      message: message,
      type: ToastificationType.info,
      primaryColor: appColors.waiting,
      icon: Icons.info_outline,
      isTablet: isTablet,
    );
  }

  static void showWarning({
    required BuildContext context,
    required String message,
    bool isTablet = false,
  }) {
    _showToastWithDebounce(
      context: context,
      message: message,
      type: ToastificationType.warning,
      primaryColor: appColors.waiting,
      icon: Icons.warning_amber_outlined,
      isTablet: isTablet,
    );
  }

  static void _showToastWithDebounce({
    required BuildContext context,
    required String message,
    required ToastificationType type,
    required Color primaryColor,
    required IconData icon,
    bool isTablet = false,
  }) {
    final now = DateTime.now();

    if (_isToastVisible) {
      debugPrint('Toast is already visible, skipping: $message');
      return;
    }

    if (message == _lastMessage &&
        _lastShowTime != null &&
        now.difference(_lastShowTime!) < const Duration(seconds: 3)) {
      debugPrint('Same message shown recently, skipping: $message');
      return;
    }

    _lastMessage = message;
    _lastShowTime = now;
    _isToastVisible = true;

    _visibilityTimer?.cancel();

    _showToast(
      context: context,
      message: message,
      type: type,
      primaryColor: primaryColor,
      icon: icon,
      isTablet: isTablet,
    );

    _visibilityTimer = Timer(const Duration(seconds: 3), () {
      _isToastVisible = false;
      _visibilityTimer = null;
    });
  }

  static void _showToast({
    required BuildContext context,
    required String message,
    required ToastificationType type,
    required Color primaryColor,
    required IconData icon,
    bool isTablet = false,
  }) {
    final double scale = isTablet ? 1.45 : 1.0;

    toastification.show(
      context: context,
      type: type,
      style: ToastificationStyle.flat,
      autoCloseDuration: const Duration(seconds: 3),
      title: CustomText.x16
          .bold(message)
          .fontSize(isTablet ? (22.sp * scale) : 16.sp)
          .color(Colors.white),
      icon: Icon(
        icon,
        color: Colors.white,
        size: isTablet ? (28.sp * scale) : 20.sp,
      ),
      alignment: Alignment.bottomCenter,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isTablet ? (24.w * scale) : 16.w,
        vertical: isTablet ? (16.h * scale) : 12.h,
      ),
      margin: EdgeInsets.zero,
      borderRadius: BorderRadius.zero,
      boxShadow: [
        BoxShadow(
          color: primaryColor.withOpacity(0.3),
          blurRadius: isTablet ? (14.r * scale) : 8.r,
          offset: const Offset(0, 4),
        ),
      ],
      showProgressBar: false,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: true,
      pauseOnHover: true,
      applyBlurEffect: false,
    );
  }

  static void reset() {
    _lastMessage = null;
    _lastShowTime = null;
    _isToastVisible = false;
    _visibilityTimer?.cancel();
    _visibilityTimer = null;
  }
}
