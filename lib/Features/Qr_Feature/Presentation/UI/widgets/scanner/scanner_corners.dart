import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';

enum CornerType { topLeft, topRight, bottomLeft, bottomRight }

class ScannerCorners extends StatelessWidget {
  const ScannerCorners({super.key});

  @override
  Widget build(BuildContext context) {
    final size = 90.sp;
    final width = 4.sp;

    return Stack(
      children: [
        _corner(Alignment.topLeft, CornerType.topLeft, width, size),
        _corner(Alignment.topRight, CornerType.topRight, width, size),
        _corner(Alignment.bottomLeft, CornerType.bottomLeft, width, size),
        _corner(Alignment.bottomRight, CornerType.bottomRight, width, size),
      ],
    );
  }

  Widget _corner(
    Alignment alignment,
    CornerType type,
    double borderWidth,
    double size,
  ) {
    return Align(
      alignment: alignment,
      child: SizedBox(
        width: size,
        height: size,
        child: CustomPaint(
          painter: _CornerPainter(
            color: appColors.primary,
            borderWidth: borderWidth,
            type: type,
          ),
        ),
      ),
    );
  }
}

class _CornerPainter extends CustomPainter {
  final Color color;
  final double borderWidth;
  final CornerType type;

  _CornerPainter({
    required this.color,
    required this.borderWidth,
    required this.type,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;

    final path = Path();

    switch (type) {
      case CornerType.topLeft:
        path.moveTo(0, size.height);
        path.lineTo(0, 0);
        path.lineTo(size.width, 0);
        break;

      case CornerType.topRight:
        path.moveTo(size.width, size.height);
        path.lineTo(size.width, 0);
        path.lineTo(0, 0);
        break;

      case CornerType.bottomLeft:
        path.moveTo(0, 0);
        path.lineTo(0, size.height);
        path.lineTo(size.width, size.height);
        break;

      case CornerType.bottomRight:
        path.moveTo(size.width, 0);
        path.lineTo(size.width, size.height);
        path.lineTo(0, size.height);
        break;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
