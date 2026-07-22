import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Data/Models/qrtype.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Logic/Methods.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Cubit/qr_cubit_base.dart';
import 'package:qr_scanner_and_generator/core/cache/cache_manager.dart';

mixin GenerateMixin on QrCubitBase {
  initGeneratePage() {
    qrs = QrType.all;
    if (!isClosed) emit(QrGenerateLoaded());
  }

  void initGenerateTypePage(QrType type) {
    currentType = type;
    generateController = TextEditingController();
    countryCode = "+20";

    if (!isClosed) emit(QrGenerateLoaded());
  }

  Future<dynamic> generateQr() async {
    final validationError = validateInput(
      controller: generateController,
      type: currentType,
    );

    if (validationError != null) {
      emit(QrGenerateError(validationError));
      return null;
    }

    final text = generateController.text.trim();

    final data = currentType == QrType.x
        ? "https://x.com/${text.replaceAll("@", "")}"
        : currentType == QrType.instagram
        ? "https://www.instagram.com/${text.replaceAll("@", "")}"
        : currentType == QrType.whatsapp
        ? "https://wa.me/${countryCode + text.replaceAll("+", "")}"
        : currentType == QrType.email
        ? "mailto:$text"
        : currentType == QrType.phone
        ? "tel:${countryCode + text}"
        : text;

    debugPrint(data);

    final result = await CacheManager.saveToHistoryCache(
      data: data,
      isScanned: false,
    );

    return result;
  }

  void clearInput() {
    generateController.clear();
    emit(QrGenerateLoaded());
  }
}
