import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Data/Models/controllertype.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Data/Models/qrtype.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Logic/Methods.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Cubit/qr_cubit_base.dart';
import 'package:qr_scanner_and_generator/core/Methods/app_validators.dart';
import 'package:qr_scanner_and_generator/core/cache/cache_manager.dart';

mixin GenerateMixin on QrCubitBase {
  initGeneratePage() {
    qrs = QrType.all;
    if (!isClosed) emit(QrGenerateLoaded());
  }

  void initGenerateTypePage(QrType type) {
    currentType = type;
    switch (type) {
      case QrType.text:
      case QrType.website:
      case QrType.x:
      case QrType.email:
      case QrType.instagram:
      case QrType.data:
      case QrType.whatsapp:
      case QrType.phone:
        generateController = TextEditingController();
        break;
      case QrType.contact:
        firstnameController = TextEditingController();
        lastnameController = TextEditingController();
        companyController = TextEditingController();
        jobController = TextEditingController();
        phoneController = TextEditingController();
        emailController = TextEditingController();
        websiteController = TextEditingController();
        addressController = TextEditingController();
        cityController = TextEditingController();
        countryController = TextEditingController();
        break;
      default:
    }
    countryCode = "+20";

    if (!isClosed) emit(QrGenerateLoaded());
  }

  Future<dynamic> generateQr() async {
    late final data;

    switch (currentType) {
      case QrType.contact:
        final firstNameError = AppValidators.validateRequired(
          firstnameController.text,
        );
        final lastNameError = AppValidators.validateRequired(
          lastnameController.text,
        );
        final phoneError = AppValidators.validatePhone(phoneController.text);

        if (firstNameError != null) {
          emit(QrGenerateError(firstNameError));
          return null;
        }

        if (lastNameError != null) {
          emit(QrGenerateError(lastNameError));
          return null;
        }

        if (phoneError != null) {
          emit(QrGenerateError(phoneError));
          return null;
        }

        String? emailError;
        if (emailController.text.trim().isNotEmpty) {
          emailError = AppValidators.validateEmail(emailController.text.trim());
          if (emailError != null) {
            emit(QrGenerateError(emailError));
            return null;
          }
        }

        String? websiteError;
        if (websiteController.text.trim().isNotEmpty) {
          websiteError = AppValidators.validateWebsite(
            websiteController.text.trim(),
          );
          if (websiteError != null) {
            emit(QrGenerateError(websiteError));
            return null;
          }
        }

        data =
            "CONTACT:N:${firstnameController.text.trim()} ${lastnameController.text.trim()};"
            "C:${companyController.text.trim().isNotEmpty ? companyController.text.trim() : "No Company"};"
            "J:${jobController.text.trim().isNotEmpty ? jobController.text.trim() : "No Job"};"
            "P:${countryCode + phoneController.text.trim()};"
            "E:${emailController.text.trim().isNotEmpty ? emailController.text.trim() : "No Email"};"
            "W:${websiteController.text.trim().isNotEmpty ? websiteController.text.trim() : "No Website"};"
            "A:${addressController.text.trim().isNotEmpty ? addressController.text.trim() : "No Address"};"
            "Ci:${cityController.text.trim().isNotEmpty ? cityController.text.trim() : "No City"};"
            "Co:${countryController.text.trim().isNotEmpty ? countryController.text.trim() : "No Country"};;";
        break;

      default:
        final validationError = validateInput(
          controller: generateController,
          type: currentType,
        );

        if (validationError != null) {
          emit(QrGenerateError(validationError));
          return null;
        }

        final text = generateController.text.trim();

        data = currentType == QrType.x
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
    }

    final result = await CacheManager.saveToHistoryCache(
      data: data,
      isScanned: false,
      type: currentType,
    );

    return result;
  }

  void clearInput(ControllerType type) {
    switch (type) {
      case ControllerType.generate:
        generateController.clear();
        break;
      case ControllerType.firstname:
        firstnameController.clear();
        break;
      case ControllerType.lastname:
        lastnameController.clear();
        break;
      case ControllerType.company:
        companyController.clear();
        break;
      case ControllerType.job:
        jobController.clear();
        break;
      case ControllerType.phone:
        phoneController.clear();
        break;
      case ControllerType.email:
        emailController.clear();
        break;
      case ControllerType.website:
        websiteController.clear();
        break;
      case ControllerType.address:
        addressController.clear();
        break;
      case ControllerType.city:
        cityController.clear();
        break;
      case ControllerType.country:
        countryController.clear();
        break;
      default:
    }
    emit(QrGenerateLoaded());
  }
}
