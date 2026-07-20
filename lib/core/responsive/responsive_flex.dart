import 'package:flutter/material.dart';
import 'responsive_core.dart';

enum FlexSize { hug, fill }

class FlexItem extends StatelessWidget {
  const FlexItem({
    super.key,
    required this.child,
    this.flex,
    this.size = FlexSize.hug,
  });

  final Widget child;
  final int? flex;
  final FlexSize size;

  @override
  Widget build(BuildContext context) {
    if (size == FlexSize.fill || flex != null) {
      return Expanded(flex: flex ?? 1, child: child);
    }
    return child;
  }
}

class HStack extends StatelessWidget {
  const HStack({
    super.key,
    required this.children,
    this.spacing = 0,
    this.alignment = CrossAxisAlignment.center,
    this.mainAlignment = MainAxisAlignment.start,
    this.wrap = false,
  });

  final List<Widget> children;
  final double spacing;
  final CrossAxisAlignment alignment;
  final MainAxisAlignment mainAlignment;
  final bool wrap;

  @override
  Widget build(BuildContext context) {
    final spaced = _withSpacing(children, spacing);

    if (wrap) {
      return Wrap(
        spacing: spacing.r,
        runSpacing: spacing.r,
        children: children,
      );
    }

    return Row(
      crossAxisAlignment: alignment,
      mainAxisAlignment: mainAlignment,
      children: spaced,
    );
  }
}

class VStack extends StatelessWidget {
  const VStack({
    super.key,
    required this.children,
    this.spacing = 0,
    this.alignment = CrossAxisAlignment.start,
    this.mainAlignment = MainAxisAlignment.start,
  });

  final List<Widget> children;
  final double spacing;
  final CrossAxisAlignment alignment;
  final MainAxisAlignment mainAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      mainAxisAlignment: mainAlignment,
      children: _withSpacing(children, spacing),
    );
  }
}

class ZStack extends StatelessWidget {
  const ZStack({
    super.key,
    required this.children,
    this.alignment = Alignment.center,
  });

  final List<Widget> children;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: alignment, children: children);
  }
}

List<Widget> _withSpacing(List<Widget> children, double spacing) {
  if (children.isEmpty) return children;

  final space = SizedBox(width: spacing.r, height: spacing.r);

  return List.generate(children.length * 2 - 1, (index) {
    if (index.isEven) return children[index ~/ 2];
    return space;
  });
}
