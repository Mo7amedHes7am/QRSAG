import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_motion.dart';

class FadeSlide extends StatelessWidget {
  const FadeSlide({
    super.key,
    required this.child,
    this.offset = const Offset(0, 0.1),
  });

  final Widget child;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    final scaledOffset = Offset(
      Motion.value(context, value: offset.dx),
      Motion.value(context, value: offset.dy),
    );

    return TweenAnimationBuilder(
      duration: Motion.duration(context),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: scaledOffset * (1 - value),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
