import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';

class AppSizes {
  static const icon = IconSizes();
  static const horizontalspace = HorizontalSpace();
  static const verticalspace = VerticalSpace();
  static const space = SymmetricSpace();
  static const radius = RadiusSize();
}

class IconSizes {
  const IconSizes();

  double get xs => 18.sp;

  double get sm => 22.sp;

  double get md => 26.sp;

  double get lg => 32.sp;

  double get xl => 40.sp;

  double custom(double size) => size.sp;
  double get small => 22.sp;
  double get medium => 25.6.sp;
  double get large => 35.sp;
}

class HorizontalSpace {
  const HorizontalSpace();

  double get x1 => 1.w;

  double get x3 => 3.w;

  double get x4 => 4.w;

  double get x8 => 8.w;

  double get x12 => 12.w;

  double get x16 => 16.w;

  double get x23 => 23.w;

  double get x24 => 24.w;

  double get x27 => 27.w;

  double get x32 => 32.w;

  double get x50 => 50.w;

  double get x85 => 85.w;

  double get x120 => 120.w;

  double get x122 => 122.w;

  double get x343 => 343.w;

  double get x345 => 345.w;

  double custom(double width) => width.w;
}

class VerticalSpace {
  const VerticalSpace();

  double get x4 => 4.h;

  double get x8 => 8.h;

  double get x13 => 13.h;

  double get x16 => 16.h;

  double get x18 => 18.h;

  double get x20 => 20.h;

  double get x21 => 21.h;

  double get x24 => 24.h;

  double get x32 => 32.h;

  double get x35 => 35.h;

  double get x37 => 37.h;

  double get x52 => 52.h;

  double get x56 => 56.h;

  double get x90 => 90.h;

  double get x125 => 125.h;

  double get x250 => 250.h;

  double get x325 => 325.h;

  double custom(double height) => height.h;
}

class RadiusSize {
  const RadiusSize();

  double get x12 => 12.r;

  double get x16 => 16.r;

  double get x25 => 25.r;

  double get x100 => 100.r;

  double custom(double radius) => radius.r;
}

class SymmetricSpace {
  const SymmetricSpace();

  double get x8 => 8.sp;

  double get x10 => 10.sp;

  double get x12 => 12.sp;

  double get x13 => 13.sp;

  double get x14 => 14.sp;

  double get x16 => 16.sp;

  double get x18 => 18.sp;

  double get x20 => 20.sp;

  double get x22 => 22.sp;

  double get x24 => 24.sp;

  double get x26 => 26.sp;

  double get x30 => 30.sp;

  double get x32 => 32.sp;

  double get x48 => 48.sp;

  double get x55 => 55.sp;

  double get x80 => 80.sp;

  double get x120 => 120.sp;

  double get x125 => 125.sp;

  double get x152 => 152.sp;

  double get x164 => 164.sp;

  double get x264 => 264.sp;

  double custom(double size) => size.sp;
}
