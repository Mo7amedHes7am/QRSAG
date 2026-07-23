import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/CustomText.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return CustomText.x26
        .medium(title)
        .width(MediaQuery.sizeOf(context).width)
        .start
        .primary;
  }
}
