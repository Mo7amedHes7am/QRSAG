import 'package:flutter/widgets.dart';
import 'responsive_core.dart';

class Insets {
  const Insets._();

  static double get xs => 4.r;
  static double get sm => 8.r;
  static double get md => 16.r;
  static double get lg => 24.r;
  static double get xl => 32.r;
  static double get xxl => 48.r;

  static EdgeInsets all(double value) => EdgeInsets.all(value.r);

  static EdgeInsets symmetric({double h = 0, double v = 0}) =>
      EdgeInsets.symmetric(horizontal: h.r, vertical: v.r);

  static EdgeInsets only({
    double left = 0,
    double right = 0,
    double top = 0,
    double bottom = 0,
  }) => EdgeInsets.only(
    left: left.r,
    right: right.r,
    top: top.r,
    bottom: bottom.r,
  );
}

class Gaps {
  const Gaps._();

  static SizedBox get xs => SizedBox(height: Insets.xs);
  static SizedBox get sm => SizedBox(height: Insets.sm);
  static SizedBox get md => SizedBox(height: Insets.md);
  static SizedBox get lg => SizedBox(height: Insets.lg);
  static SizedBox get xl => SizedBox(height: Insets.xl);
  static SizedBox get xxl => SizedBox(height: Insets.xxl);

  static SizedBox h(double value) => SizedBox(height: value.h);
  static SizedBox w(double value) => SizedBox(width: value.w);
}
