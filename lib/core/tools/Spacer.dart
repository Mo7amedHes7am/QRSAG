import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';

class Space {
  static const vertical = Vertical();
  static const horizontal = Horizontal();
}

class Vertical {
  const Vertical();

  Widget get x4 => SizedBox(height: 4.h);
  Widget get x8 => SizedBox(height: 8.h);
  Widget get x12 => SizedBox(height: 12.h);
  Widget get x16 => SizedBox(height: 16.h);
  Widget get x17 => SizedBox(height: 17.h);
  Widget get x18 => SizedBox(height: 18.h);
  Widget get x20 => SizedBox(height: 20.h);
  Widget get x24 => SizedBox(height: 24.h);
  Widget get x25 => SizedBox(height: 25.h);
  Widget get x30 => SizedBox(height: 30.h);
  Widget get x40 => SizedBox(height: 40.h);
  Widget get x46 => SizedBox(height: 46.h);
  Widget get x60 => SizedBox(height: 60.h);
  Widget get x125 => SizedBox(height: 125.h);

  Widget custom(double height) => SizedBox(height: height.h);
}

class Horizontal {
  const Horizontal();

  Widget get x4 => SizedBox(width: 4.w);
  Widget get x8 => SizedBox(width: 8.w);
  Widget get x12 => SizedBox(width: 12.w);
  Widget get x16 => SizedBox(width: 16.w);

  Widget custom(double width) => SizedBox(width: width.w);
}
