import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/scanner/scan_line.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/scanner/scanner_corners.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';

class ScannerOverlay extends StatelessWidget {
  const ScannerOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;

    final width = isTablet ? 600.w : 300.w;
    final height = isTablet ? 300.h : 200.h;

    return Stack(
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.6),
            BlendMode.srcOut,
          ),
          child: Stack(
            children: [
              Container(color: Colors.black),
              Center(
                child: Container(
                  width: width,
                  height: height,
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
        ),

        Center(
          child: SizedBox(
            width: width,
            height: height,
            child: Stack(
              children: [
                const ScannerCorners(),
                ScanLine(height: height),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
