import 'package:flutter/material.dart';

OverlayEntry? _overlayEntry;

enum OverlayAlign { left, right, center }

void showOverlay({
  required BuildContext context,
  required GlobalKey key,
  required Widget child,
  required double width,
  OverlayAlign align = OverlayAlign.left,
}) {
  removeOverlay();

  final renderBox = key.currentContext!.findRenderObject() as RenderBox;
  final offset = renderBox.localToGlobal(Offset.zero);
  final size = renderBox.size;

  final screenWidth = MediaQuery.of(context).size.width;

  double left;

  switch (align) {
    case OverlayAlign.left:
      left = offset.dx;
      break;

    case OverlayAlign.right:
      left = offset.dx + size.width - width;
      break;

    case OverlayAlign.center:
      left = offset.dx + (size.width / 2) - (width / 2);
      break;
  }

  if (left < 8) left = 8;
  if (left + width > screenWidth - 8) {
    left = screenWidth - width - 8;
  }

  _overlayEntry = OverlayEntry(
    builder: (context) => Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: removeOverlay,
            child: Container(color: Colors.transparent),
          ),
        ),

        Positioned(
          left: left,
          top: offset.dy + size.height + 8,
          child: Material(color: Colors.transparent, child: child),
        ),
      ],
    ),
  );

  Overlay.of(context).insert(_overlayEntry!);
}

void removeOverlay() {
  _overlayEntry?.remove();
  _overlayEntry = null;
}
