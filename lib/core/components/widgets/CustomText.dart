import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/Methods/Global_Methods.dart';
import 'package:qr_scanner_and_generator/core/tools/Sizes.dart';

class CustomText {
  const CustomText._();

  static final x8 = TextSize(AppSizes.space.x8);
  static final x10 = TextSize(AppSizes.space.x10);
  static final x12 = TextSize(AppSizes.space.x12);
  static final x13 = TextSize(AppSizes.space.x13);
  static final x14 = TextSize(AppSizes.space.x14);
  static final x16 = TextSize(AppSizes.space.x16);
  static final x18 = TextSize(AppSizes.space.x18);
  static final x20 = TextSize(AppSizes.space.x20);
  static final x22 = TextSize(AppSizes.space.x22);
  static final x24 = TextSize(AppSizes.space.x24);
  static final x26 = TextSize(AppSizes.space.x26);
  static final x28 = TextSize(AppSizes.space.custom(28));
  static final x30 = TextSize(AppSizes.space.x30);
  static final x32 = TextSize(AppSizes.space.x32);
  static final x36 = TextSize(AppSizes.space.custom(36));
  static final x40 = TextSize(AppSizes.space.custom(40));
}

class TextSize {
  final double size;

  const TextSize(this.size);

  TextBuilder extralight(String text) =>
      TextBuilder(text, size, FontWeight.w100);

  TextBuilder light(String text) => TextBuilder(text, size, FontWeight.w400);

  TextBuilder medium(String text) => TextBuilder(text, size, FontWeight.w500);

  TextBuilder bold(String text) => TextBuilder(text, size, FontWeight.w700);

  TextBuilder semibold(String text) => TextBuilder(text, size, FontWeight.w800);

  TextBuilder extrabold(String text) =>
      TextBuilder(text, size, FontWeight.w900);
}

class TextBuilder {
  final String text;
  final double size;
  final FontWeight weight;
  final TextAlign? align;
  final int? maxLines;
  final double? customWidth;
  final TextDecoration? decoration;
  final double? customFontSize;

  const TextBuilder(
    this.text,
    this.size,
    this.weight, {
    this.align,
    this.decoration,
    this.maxLines,
    this.customWidth,
    this.customFontSize,
  });

  TextBuilder get center => TextBuilder(
    text,
    size,
    weight,
    align: TextAlign.center,
    maxLines: maxLines,
    customWidth: customWidth,
    customFontSize: customFontSize,
  );

  TextBuilder get underline => TextBuilder(
    text,
    size,
    weight,
    decoration: TextDecoration.underline,
    maxLines: maxLines,
    customWidth: customWidth,
    customFontSize: customFontSize,
  );

  TextBuilder get lineThrough => TextBuilder(
    text,
    size,
    weight,
    decoration: TextDecoration.lineThrough,
    maxLines: maxLines,
    customWidth: customWidth,
    customFontSize: customFontSize,
  );

  TextBuilder get left => TextBuilder(
    text,
    size,
    weight,
    align: TextAlign.left,
    maxLines: maxLines,
    customWidth: customWidth,
    customFontSize: customFontSize,
  );

  TextBuilder get right => TextBuilder(
    text,
    size,
    weight,
    align: TextAlign.right,
    maxLines: maxLines,
    customWidth: customWidth,
    customFontSize: customFontSize,
  );

  TextBuilder get justify => TextBuilder(
    text,
    size,
    weight,
    align: TextAlign.justify,
    maxLines: maxLines,
    customWidth: customWidth,
    customFontSize: customFontSize,
  );

  TextBuilder get start => TextBuilder(
    text,
    size,
    weight,
    align: TextAlign.start,
    maxLines: maxLines,
    customWidth: customWidth,
    customFontSize: customFontSize,
  );

  TextBuilder get end => TextBuilder(
    text,
    size,
    weight,
    align: TextAlign.end,
    maxLines: maxLines,
    customWidth: customWidth,
    customFontSize: customFontSize,
  );

  TextBuilder lines(int lines) => TextBuilder(
    text,
    size,
    weight,
    align: align,
    maxLines: lines,
    customWidth: customWidth,
    customFontSize: customFontSize,
  );

  TextBuilder width(double width) => TextBuilder(
    text,
    size,
    weight,
    align: align,
    maxLines: maxLines,
    customWidth: width,
    customFontSize: customFontSize,
  );

  TextBuilder fontSize(double fontSize) => TextBuilder(
    text,
    size,
    weight,
    align: align,
    maxLines: maxLines,
    customWidth: customWidth,
    customFontSize: fontSize,
  );

  TextBuilder responsiveFontSize(double fontSize) => TextBuilder(
    text,
    size,
    weight,
    align: align,
    maxLines: maxLines,
    customWidth: customWidth,
    customFontSize: fontSize.sp,
  );

  TextBuilder scaleForDevice({required bool isTablet}) => TextBuilder(
    text,
    size,
    weight,
    align: align,
    maxLines: maxLines,
    customWidth: customWidth,
    customFontSize: isTablet ? size * 1.2 : size,
  );

  TextBuilder copyWith({
    String? text,
    double? size,
    FontWeight? weight,
    TextAlign? align,
    int? maxLines,
    double? customWidth,
    TextDecoration? decoration,
    double? customFontSize,
  }) {
    return TextBuilder(
      text ?? this.text,
      size ?? this.size,
      weight ?? this.weight,
      align: align ?? this.align,
      maxLines: maxLines ?? this.maxLines,
      customWidth: customWidth ?? this.customWidth,
      decoration: decoration ?? this.decoration,
      customFontSize: customFontSize ?? this.customFontSize,
    );
  }

  Text get primaryTextColor => _build(appColors.primaryTextColor);

  Text get lightTextColor => _build(appColors.secondaryTextColor);

  Text get primary => _build(appColors.primary);

  Text get failed => _build(appColors.failed);

  Text get white => _build(Colors.white);
  Text get black => _build(Colors.black);

  Text get waiting => _build(appColors.waiting);

  Text get secondaryTextColor => _build(appColors.secondaryTextColor);

  Text get grey => _build(appColors.grey);

  Text get button => _build(appColors.button);

  Text get background => _build(appColors.background);

  Text get link => _build(appColors.link);

  Text get formfield => _build(appColors.textfield);

  Text get success => _build(appColors.done);

  Text color(Color c) => _build(c);

  Text _build(Color color) {
    final double finalFontSize = customFontSize ?? size;

    final textWidget = Text(
      text,
      textAlign: align,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: TextStyle(
        fontSize: finalFontSize,
        fontWeight: weight,
        color: color,
        decoration: decoration ?? TextDecoration.none,
        decorationColor: decoration != null ? color : null,
        fontFamily: getLocaleFont(),
      ),
    );

    if (customWidth != null) {
      return Text.rich(
        TextSpan(
          children: [
            WidgetSpan(
              child: SizedBox(width: customWidth, child: textWidget),
            ),
          ],
        ),
      );
    }

    return textWidget;
  }
}
