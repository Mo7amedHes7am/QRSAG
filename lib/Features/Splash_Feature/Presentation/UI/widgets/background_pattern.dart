import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:qr_scanner_and_generator/core/utils/app_images.dart';

class QRBackgroundPattern extends StatelessWidget {
  final Widget child;
  final double patternSize;
  final double opacity;

  const QRBackgroundPattern({
    Key? key,
    required this.child,
    this.patternSize = 60,
    this.opacity = 0.08,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Opacity(
            opacity: opacity,
            child: LayoutBuilder(
              builder: (context, constraints) {
                int cols = (constraints.maxWidth / patternSize).ceil();
                int rows = (constraints.maxHeight / patternSize).ceil();

                return Wrap(
                  spacing: patternSize / 2,
                  runSpacing: patternSize / 2,
                  children: List.generate(
                    cols * rows,
                    (index) => SvgPicture.asset(
                      AppSvgs.qrlogogold,
                      width: patternSize.sp,
                      height: patternSize.sp,
                      color: appColors.grey,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        child,
      ],
    );
  }
}
