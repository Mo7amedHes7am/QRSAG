import 'package:flutter/material.dart';
import 'responsive_core.dart';

class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({
    super.key,
    required this.children,
    this.columns = 12,
    this.spacing = 16,
  });

  final List<ResponsiveGridItem> children;
  final int columns;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final spacingPx = spacing.r;

    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        final colWidth = (totalWidth - (columns - 1) * spacingPx) / columns;

        return Wrap(
          spacing: spacingPx,
          runSpacing: spacingPx,
          children: children.map((item) {
            final span = item.resolveSpan(context);

            return SizedBox(
              width: colWidth * span + spacingPx * (span - 1),
              child: item.child,
            );
          }).toList(),
        );
      },
    );
  }
}

class ResponsiveGridItem {
  final Widget child;

  final int compact;
  final int? medium;
  final int? expanded;
  final int? large;
  final int? extraLarge;

  const ResponsiveGridItem({
    required this.child,
    required this.compact,
    this.medium,
    this.expanded,
    this.large,
    this.extraLarge,
  });

  int resolveSpan(BuildContext context) {
    switch (context.windowClass) {
      case WindowClass.extraLarge:
        return extraLarge ?? large ?? expanded ?? medium ?? compact;
      case WindowClass.large:
        return large ?? expanded ?? medium ?? compact;
      case WindowClass.expanded:
        return expanded ?? medium ?? compact;
      case WindowClass.medium:
        return medium ?? compact;
      case WindowClass.compact:
        return compact;
    }
  }
}
