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

  WindowClass classify(double width) {
    if (width >= extraLarge) return WindowClass.extraLarge;
    if (width >= large) return WindowClass.large;
    if (width >= expanded) return WindowClass.expanded;
    if (width >= medium) return WindowClass.medium;
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
  double _maxTextAccessibilityScale = 1.3;
  double _minTextAccessibilityScale = 0.9;

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
    required double minTextAccessibilityScale,
    required double maxTextAccessibilityScale,
  }) {
    final mq = MediaQuery.of(context);
    _screenWidth = mq.size.width;
    _screenHeight = mq.size.height;
    _designSize = designSize;
    _designSizeLandscape = designSizeLandscape;
    _contentMaxWidth = contentMaxWidth;
    _bounds = bounds;
    _breakpoints = breakpoints;
    _minTextAccessibilityScale = minTextAccessibilityScale;
    _maxTextAccessibilityScale = maxTextAccessibilityScale;
    _orientation = mq.orientation;
    _windowClass = _breakpoints.classify(_screenWidth);
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
  EdgeInsets get safePadding => _safePadding;
  double get devicePixelRatio => _devicePixelRatio;

  bool get isPortrait => _orientation == Orientation.portrait;
  bool get isLandscape => _orientation == Orientation.landscape;

  bool get isMobile =>
      _windowClass == WindowClass.compact || _windowClass == WindowClass.medium;
  bool get isTablet => _windowClass == WindowClass.expanded;
  bool get isDesktop =>
      _windowClass == WindowClass.large ||
      _windowClass == WindowClass.extraLarge;

  bool get isIOS => _platform == AppPlatform.ios;
  bool get isAndroid => _platform == AppPlatform.android;
  bool get isWeb => _platform == AppPlatform.web;
  bool get isDesktopPlatform =>
      _platform == AppPlatform.macos ||
      _platform == AppPlatform.windows ||
      _platform == AppPlatform.linux;

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
    if (_windowClass == WindowClass.large ||
        _windowClass == WindowClass.extraLarge) {
      return _screenWidth < _contentMaxWidth ? _screenWidth : _contentMaxWidth;
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

  double get scaleUniform => ((scaleWidth + scaleHeight) / 2).clamp(
    _activeBounds.min,
    _activeBounds.max,
  );

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
    final deviceScaled = value * scaleText;
    final boundedScaler = _systemTextScaler.clamp(
      minScaleFactor: _minTextAccessibilityScale,
      maxScaleFactor: _maxTextAccessibilityScale,
    );
    return boundedScaler.scale(deviceScaled);
  }

  double widthPercent(double percent) => _screenWidth * percent / 100;
  double heightPercent(double percent) => _screenHeight * percent / 100;
}

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    super.key,
    required this.child,
    this.designSize = const Size(375, 812),
    this.designSizeLandscape,
    this.contentMaxWidth = 1400,
    this.centerContent = true,
    this.bounds = kDefaultScaleBounds,
    this.breakpoints = const ResponsiveBreakpoints(),
    this.minTextAccessibilityScale = 0.9,
    this.maxTextAccessibilityScale = 1.3,
  });

  final Size designSize;

  final Size? designSizeLandscape;

  final double contentMaxWidth;

  final bool centerContent;

  final Map<WindowClass, ScaleBounds> bounds;
  final ResponsiveBreakpoints breakpoints;
  final double minTextAccessibilityScale;
  final double maxTextAccessibilityScale;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        ResponsiveUtil.instance.update(
          context,
          designSize: designSize,
          designSizeLandscape: designSizeLandscape,
          contentMaxWidth: contentMaxWidth,
          bounds: bounds,
          breakpoints: breakpoints,
          minTextAccessibilityScale: minTextAccessibilityScale,
          maxTextAccessibilityScale: maxTextAccessibilityScale,
        );

        Widget result = child;

        final wc = ResponsiveUtil.instance.windowClass;
        final shouldCenter =
            centerContent &&
            (wc == WindowClass.large || wc == WindowClass.extraLarge);

        if (shouldCenter) {
          result = ColoredBox(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: contentMaxWidth),
                child: result,
              ),
            ),
          );
        }

        return result;
      },
    );
  }
}

extension ResponsiveNum on num {
  double get w => ResponsiveUtil.instance.w(toDouble());

  double get h => ResponsiveUtil.instance.h(toDouble());

  double get sp => ResponsiveUtil.instance.sp(toDouble());

  double get r => ResponsiveUtil.instance.r(toDouble());
}

extension ResponsiveContext on BuildContext {
  WindowClass get windowClass => ResponsiveUtil.instance.windowClass;
  AppPlatform get appPlatform => ResponsiveUtil.instance.platform;

  bool get isMobile => ResponsiveUtil.instance.isMobile;
  bool get isTablet => ResponsiveUtil.instance.isTablet;
  bool get isDesktop => ResponsiveUtil.instance.isDesktop;
  bool get isPortrait => ResponsiveUtil.instance.isPortrait;
  bool get isLandscape => ResponsiveUtil.instance.isLandscape;

  bool get isIOS => ResponsiveUtil.instance.isIOS;
  bool get isAndroid => ResponsiveUtil.instance.isAndroid;
  bool get isWeb => ResponsiveUtil.instance.isWeb;
  bool get isDesktopPlatform => ResponsiveUtil.instance.isDesktopPlatform;

  EdgeInsets get safePadding => ResponsiveUtil.instance.safePadding;

  double wp(double percent) => ResponsiveUtil.instance.widthPercent(percent);

  double hp(double percent) => ResponsiveUtil.instance.heightPercent(percent);
}
