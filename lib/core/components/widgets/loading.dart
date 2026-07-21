import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:gif/gif.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/directionality_widget.dart';
import 'package:qr_scanner_and_generator/core/utils/app_images.dart';

class LoadingScaffold extends StatefulWidget {
  final bool loading;
  final Widget child;
  final bool opacity;
  final bool isTablet;

  const LoadingScaffold({
    super.key,
    required this.loading,
    required this.child,
    this.opacity = true,
    this.isTablet = false,
  });

  @override
  State<LoadingScaffold> createState() => _LoadingScaffoldState();
}

class _LoadingScaffoldState extends State<LoadingScaffold> {
  @override
  Widget build(BuildContext context) {
    return DirectionalityWidget(
      child: Stack(
        key: ValueKey(widget.loading),
        children: [
          widget.loading ? const SizedBox.expand() : widget.child,
          if (widget.loading) _buildLoadingOverlay(),
        ],
      ),
    );
  }

  Widget _buildLoadingOverlay() {
    return Positioned.fill(
      child: Container(
        color: widget.opacity
            ? appColors.background
            : appColors.secondaryTextColor.withOpacity(0.4),
        child: Center(
          child: Gif(
            autostart: Autostart.loop,
            image: AssetImage(AppGifs.loading),
            width: widget.isTablet ? 400.sp : 250.sp,
            height: widget.isTablet ? 400.sp : 250.sp,
            useCache: true,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
