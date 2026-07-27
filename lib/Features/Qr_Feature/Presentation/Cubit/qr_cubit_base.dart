import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Data/Models/qrtype.dart';
import 'package:qr_scanner_and_generator/core/cache/Models/HistoryModel.dart';

part 'qr_state.dart';

class QrCubitBase extends Cubit<QrState> {
  MobileScannerController? cameraController;
  late List<QrType> qrs;

  late TextEditingController generateController,
      firstnameController,
      lastnameController,
      companyController,
      jobController,
      phoneController,
      emailController,
      websiteController,
      addressController,
      cityController,
      countryController,
      industryController,
      eventNameController,
      eventLocationController,
      eventDescriptionController,
      cardHolderNameController,
      cardNumberController,
      cvvCodeController,
      expiryDateController,
      wifiNameController,
      wifiPasswordController,
      eventStartDateController,
      eventEndDateController;

  late final GlobalKey<FormState> VisaformKey;
  late bool scanLocked,
      isCvvFocused,
      useGlassMorphism,
      useBackgroundImage,
      useFloatingAnimation,
      valid,
      hidden,
      showPassword;

  late int encryption;
  late String countryCode;
  late QrType currentType;

  @factoryMethod
  QrCubitBase() : super(QrInitialState());

  init() {
    scanLocked = false;
    try {
      cameraController = MobileScannerController(
        torchEnabled: false,
        formats: [BarcodeFormat.qrCode],
        autoStart: true,
        facing: CameraFacing.back,
        detectionSpeed: DetectionSpeed.normal,
        detectionTimeoutMs: 1000,
      );
    } catch (e) {
      debugPrint('Camera controller init failed: $e');
      cameraController = null;
    }
    if (!isClosed) emit(QrInitialState());
  }

  @override
  Future<void> close() async {
    try {
      await cameraController?.dispose();
    } catch (e) {
      debugPrint('Camera controller dispose failed: $e');
    }
    return super.close();
  }

  Future<void> scanQrCode({required String scannedQrCode}) async {}

  Future<void> shareQrCode({
    required GlobalKey repaintKey,
    required String qrData,
  }) async {}

  Future<void> saveQrCode({required GlobalKey repaintKey}) async {}

  Future<void> deleteHistoryItem({
    required int index,
    required bool isScan,
  }) async {}

  loadHistory() {}

  initGeneratePage() {}

  initGenerateTypePage(QrType type) {}

  Future<dynamic> generateQr() async {}
}
