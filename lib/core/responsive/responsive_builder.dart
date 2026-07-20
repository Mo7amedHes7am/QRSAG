import 'package:flutter/material.dart';
import 'responsive_core.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    super.key,
    required this.child,
    this.designSize = const Size(375, 812),
    this.designSizeLandscape,
    this.contentMaxWidth = 1400,
    this.centerContent = true,
    this.bounds = kDefaultScaleBounds,
    this.breakpoints = const ResponsiveBreakpoints(),
    this.minTextScale = 0.9,
    this.maxTextScale = 1.3,
  });

  final Widget child;

  final Size designSize;
  final Size? designSizeLandscape;

  final double contentMaxWidth;
  final bool centerContent;

  final Map<WindowClass, ScaleBounds> bounds;
  final ResponsiveBreakpoints breakpoints;

  final double minTextScale;
  final double maxTextScale;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, _) {
        ResponsiveUtil.instance.update(
          context,
          designSize: designSize,
          designSizeLandscape: designSizeLandscape,
          contentMaxWidth: contentMaxWidth,
          bounds: bounds,
          breakpoints: breakpoints,
          minTextScale: minTextScale,
          maxTextScale: maxTextScale,
        );

        Widget result = child;

        final wc = context.windowClass;

        final shouldCenter =
            centerContent &&
            (wc == WindowClass.large || wc == WindowClass.extraLarge);

        if (shouldCenter) {
          result = ColoredBox(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: contentMaxWidth),
                  child: result,
                ),
              ),
            ),
          );
        }

        return result;
      },
    );
  }
}
