library responsive;

import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum AppPlatform { android, ios, web, macos, windows, linux, fuchsia, unknown }

AppPlatform resolveAppPlatform() {
  if (kIsWeb) return AppPlatform.web;

  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
      return AppPlatform.android;
    case TargetPlatform.iOS:
      return AppPlatform.ios;
    case TargetPlatform.macOS:
      return AppPlatform.macos;
    case TargetPlatform.windows:
      return AppPlatform.windows;
    case TargetPlatform.linux:
      return AppPlatform.linux;
    case TargetPlatform.fuchsia:
      return AppPlatform.fuchsia;
  }

  return AppPlatform.unknown;
}

enum WindowClass { compact, medium, expanded, large, extraLarge }

class ResponsiveBreakpoints {
  final double medium;
  final double expanded;
  final double large;
  final double extraLarge;

  const ResponsiveBreakpoints({
    this.medium = 600,
    this.expanded = 840,
    this.large = 1200,
    this.extraLarge = 1600,
  });

  WindowClass classify(double width, double height) {
    final shortest = math.min(width, height);

    if (shortest >= extraLarge) return WindowClass.extraLarge;
    if (shortest >= large) return WindowClass.large;
    if (shortest >= expanded) return WindowClass.expanded;
    if (shortest >= medium) return WindowClass.medium;
    return WindowClass.compact;
  }
}

class ScaleBounds {
  final double min;
  final double max;

  const ScaleBounds(this.min, this.max);
}

const Map<WindowClass, ScaleBounds> kDefaultScaleBounds = {
  WindowClass.compact: ScaleBounds(0.85, 1.15),
  WindowClass.medium: ScaleBounds(0.90, 1.20),
  WindowClass.expanded: ScaleBounds(0.90, 1.25),
  WindowClass.large: ScaleBounds(0.95, 1.30),
  WindowClass.extraLarge: ScaleBounds(0.95, 1.30),
};

class ResponsiveUtil {
  ResponsiveUtil._internal();

  static final ResponsiveUtil instance = ResponsiveUtil._internal();

  double _screenWidth = 375;
  double _screenHeight = 812;

  Size _designSize = const Size(375, 812);
  Size? _designSizeLandscape;

  double _contentMaxWidth = 1400;

  Map<WindowClass, ScaleBounds> _bounds = kDefaultScaleBounds;

  double _minTextScale = 0.9;
  double _maxTextScale = 1.3;

  Orientation _orientation = Orientation.portrait;
  WindowClass _windowClass = WindowClass.compact;
  AppPlatform _platform = AppPlatform.unknown;

  EdgeInsets _safePadding = EdgeInsets.zero;
  double _devicePixelRatio = 1.0;
  TextScaler _systemTextScaler = TextScaler.noScaling;

  ResponsiveBreakpoints _breakpoints = const ResponsiveBreakpoints();

  void update(
    BuildContext context, {
    required Size designSize,
    Size? designSizeLandscape,
    required double contentMaxWidth,
    required Map<WindowClass, ScaleBounds> bounds,
    required ResponsiveBreakpoints breakpoints,
    required double minTextScale,
    required double maxTextScale,
  }) {
    final mq = MediaQuery.of(context);

    _screenWidth = mq.size.width;
    _screenHeight = mq.size.height;

    _designSize = designSize;
    _designSizeLandscape = designSizeLandscape;

    _contentMaxWidth = contentMaxWidth;
    _bounds = bounds;
    _breakpoints = breakpoints;

    _minTextScale = minTextScale;
    _maxTextScale = maxTextScale;

    _orientation = mq.orientation;
    _windowClass = _breakpoints.classify(_screenWidth, _screenHeight);
    _platform = resolveAppPlatform();

    _safePadding = mq.padding;
    _devicePixelRatio = mq.devicePixelRatio;
    _systemTextScaler = mq.textScaler;
  }

  double get screenWidth => _screenWidth;
  double get screenHeight => _screenHeight;
  Orientation get orientation => _orientation;
  WindowClass get windowClass => _windowClass;
  AppPlatform get platform => _platform;

  bool get isMobile =>
      _windowClass == WindowClass.compact || _windowClass == WindowClass.medium;

  bool get isTablet => _windowClass == WindowClass.expanded;

  bool get isDesktop =>
      _windowClass == WindowClass.large ||
      _windowClass == WindowClass.extraLarge;

  bool get isPortrait => _orientation == Orientation.portrait;
  bool get isLandscape => _orientation == Orientation.landscape;

  Size get _activeDesignSize {
    if (_orientation == Orientation.landscape) {
      return _designSizeLandscape ??
          Size(_designSize.height, _designSize.width);
    }
    return _designSize;
  }

  ScaleBounds get _activeBounds =>
      _bounds[_windowClass] ?? kDefaultScaleBounds[_windowClass]!;

  double get _effectiveWidth {
    if (isDesktop) {
      return math.min(_screenWidth, _contentMaxWidth);
    }
    return _screenWidth;
  }

  double get scaleWidth {
    final raw = _effectiveWidth / _activeDesignSize.width;
    return raw.clamp(_activeBounds.min, _activeBounds.max);
  }

  double get scaleHeight {
    final raw = _screenHeight / _activeDesignSize.height;
    return raw.clamp(_activeBounds.min, _activeBounds.max);
  }

  double get scaleUniform => math.min(scaleWidth, scaleHeight);

  double get scaleText {
    final base = (scaleWidth + scaleHeight) / 2;

    if (isDesktop || isTablet) {
      return base.clamp(_activeBounds.min, 1.15);
    }

    return base.clamp(_activeBounds.min, _activeBounds.max);
  }

  double w(double value) => value * scaleWidth;
  double h(double value) => value * scaleHeight;
  double r(double value) => value * scaleUniform;

  double sp(double value) {
    final base = value * scaleText;

    final sysScale = _systemTextScaler.scale(1.0);
    final clamped = sysScale.clamp(_minTextScale, _maxTextScale);

    return base * clamped;
  }

  double widthPercent(double percent) => _screenWidth * percent / 100;
  double heightPercent(double percent) => _screenHeight * percent / 100;
}

extension ResponsiveNum on num {
  double get w => ResponsiveUtil.instance.w(toDouble());
  double get h => ResponsiveUtil.instance.h(toDouble());
  double get sp => ResponsiveUtil.instance.sp(toDouble());
  double get r => ResponsiveUtil.instance.r(toDouble());
}

extension ResponsiveContext on BuildContext {
  WindowClass get windowClass => ResponsiveUtil.instance.windowClass;

  bool get isMobile => ResponsiveUtil.instance.isMobile;
  bool get isTablet => ResponsiveUtil.instance.isTablet;
  bool get isDesktop => ResponsiveUtil.instance.isDesktop;

  bool get isPortrait => ResponsiveUtil.instance.isPortrait;
  bool get isLandscape => ResponsiveUtil.instance.isLandscape;

  EdgeInsets get safePadding => ResponsiveUtil.instance._safePadding;

  double wp(double percent) => ResponsiveUtil.instance.widthPercent(percent);

  double hp(double percent) => ResponsiveUtil.instance.heightPercent(percent);
}
