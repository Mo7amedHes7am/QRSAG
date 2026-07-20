import 'package:flutter/material.dart';
import 'responsive_core.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.compact,
    this.medium,
    this.expanded,
    this.large,
    this.extraLarge,
  });

  final WidgetBuilder compact;
  final WidgetBuilder? medium;
  final WidgetBuilder? expanded;
  final WidgetBuilder? large;
  final WidgetBuilder? extraLarge;

  @override
  Widget build(BuildContext context) {
    switch (context.windowClass) {
      case WindowClass.extraLarge:
        return (extraLarge ?? large ?? expanded ?? medium ?? compact)(context);
      case WindowClass.large:
        return (large ?? expanded ?? medium ?? compact)(context);
      case WindowClass.expanded:
        return (expanded ?? medium ?? compact)(context);
      case WindowClass.medium:
        return (medium ?? compact)(context);
      case WindowClass.compact:
        return compact(context);
    }
  }
}

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  final WidgetBuilder mobile;
  final WidgetBuilder? tablet;
  final WidgetBuilder? desktop;

  @override
  Widget build(BuildContext context) {
    if (context.isDesktop) return (desktop ?? tablet ?? mobile)(context);
    if (context.isTablet) return (tablet ?? mobile)(context);
    return mobile(context);
  }
}

class OrientationLayout extends StatelessWidget {
  const OrientationLayout({
    super.key,
    required this.portrait,
    required this.landscape,
  });

  final WidgetBuilder portrait;
  final WidgetBuilder landscape;

  @override
  Widget build(BuildContext context) {
    return context.isLandscape ? landscape(context) : portrait(context);
  }
}

class ResponsiveValue<T> {
  const ResponsiveValue({
    required this.compact,
    this.medium,
    this.expanded,
    this.large,
    this.extraLarge,
  });

  final T compact;
  final T? medium;
  final T? expanded;
  final T? large;
  final T? extraLarge;

  T resolve(BuildContext context) {
    switch (context.windowClass) {
      case WindowClass.extraLarge:
        return extraLarge ?? large ?? expanded ?? medium ?? compact;
      case WindowClass.large:
        return large ?? expanded ?? medium ?? compact;
      case WindowClass.expanded:
        return expanded ?? medium ?? compact;
      case WindowClass.medium:
        return medium ?? compact;
      case WindowClass.compact:
        return compact;
    }
  }
}
