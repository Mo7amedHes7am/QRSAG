import 'package:flutter/material.dart';
import 'responsive_core.dart';

class Motion {
  const Motion._();

  static Duration duration(
      BuildContext context, {
        int ms = 300,
      }) {
    final scale = _motionScale(context);
    return Duration(milliseconds: (ms * scale).round());
  }

  static double value(
      BuildContext context, {
        required double value,
      }) {
    return value * _motionScale(context);
  }

  static Curve get curveStandard => Curves.easeInOut;
  static Curve get curveEntrance => Curves.easeOutCubic;
  static Curve get curveExit => Curves.easeInCubic;

  static double _motionScale(BuildContext context) {
    final util = ResponsiveUtil.instance;

    if (util.isDesktop) return 0.85;
    if (util.isTablet) return 0.95;
    return 1.0;
  }
}