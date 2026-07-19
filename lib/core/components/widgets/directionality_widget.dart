import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart'
    show Widget, Color, BuildContext, SafeArea, Directionality;
import 'package:flutter/src/widgets/framework.dart';

class DirectionalityWidget extends StatelessWidget {
  final Widget child;
  final Color? safeareacolor;
  const DirectionalityWidget({
    super.key,
    required this.child,
    this.safeareacolor,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          context.locale.languageCode == 'ar' ||
              context.locale.languageCode == 'fa' ||
              context.locale.languageCode == 'ur'
          ? ui.TextDirection.rtl
          : ui.TextDirection.ltr,
      child: SafeArea(top: false, bottom: true, child: child),
    );
  }
}
