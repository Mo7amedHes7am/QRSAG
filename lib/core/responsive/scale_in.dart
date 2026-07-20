import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_motion.dart';

class ScaleIn extends StatelessWidget {
  const ScaleIn({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Motion.duration(context),
      tween: Tween(begin: 0.9, end: 1.0),
      curve: Motion.curveEntrance,
      builder: (context, value, child) {
        return Transform.scale(scale: value, child: child);
      },
      child: child,
    );
  }
}
