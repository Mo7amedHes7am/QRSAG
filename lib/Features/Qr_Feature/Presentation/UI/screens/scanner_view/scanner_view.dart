import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../Cubit/qr_cubit.dart';

class ScannerView extends StatefulWidget {
  final QrCubit cubit;

  const ScannerView({super.key, required this.cubit});

  @override
  State<ScannerView> createState() => _ScannerViewState();
}

class _ScannerViewState extends State<ScannerView> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    widget.cubit.cameraController?.stop();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!widget.cubit.cameraController!.value.isInitialized) return;

    if (state == AppLifecycleState.paused) {
      widget.cubit.cameraController?.stop();
    } else if (state == AppLifecycleState.resumed) {
      widget.cubit.cameraController?.start();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      controller: widget.cubit.cameraController,
      fit: BoxFit.cover,
      onDetect: (barcodeCapture) {
        if (!widget.cubit.scanLocked &&
            barcodeCapture.barcodes.isNotEmpty &&
            barcodeCapture.barcodes.first.rawValue != null) {
          widget.cubit.scanQrCode(
            scannedQrCode: barcodeCapture.barcodes.first.rawValue!,
          );
        }
      },
    );
  }
}
