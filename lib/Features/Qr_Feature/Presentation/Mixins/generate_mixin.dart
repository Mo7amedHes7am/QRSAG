import 'package:encrypt_decrypt_plus/encrypt_decrypt/xor.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Data/Models/controllertype.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Data/Models/qrtype.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Logic/Methods.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Cubit/qr_cubit_base.dart';
import 'package:qr_scanner_and_generator/core/Methods/app_validators.dart';
import 'package:qr_scanner_and_generator/core/cache/cache_manager.dart';
import 'package:uuid/uuid.dart';

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

      case QrType.wifi:
        wifiNameController = TextEditingController();
        wifiPasswordController = TextEditingController();
        hidden = false;
        encryption = 0;
        showPassword = false;
        break;

      case QrType.visa:
        try {
          VisaformKey = GlobalKey<FormState>();
        } catch (e) {}
        isCvvFocused = false;
        valid = false;
        useGlassMorphism = true;
        useBackgroundImage = false;
        useFloatingAnimation = true;
        cardHolderNameController = TextEditingController();
        cardNumberController = TextEditingController();
        cvvCodeController = TextEditingController();
        expiryDateController = TextEditingController();
      default:
    }
    countryCode = "+20";

    if (!isClosed) emit(QrGenerateLoaded());
  }

  void toggleHidden() {
    hidden = !hidden;
    emit(QrGenerateLoaded());
  }

  void setEncryption(int value) {
    encryption = value;
    showPassword = value != 0;
    emit(QrGenerateLoaded());
  }

  Future<dynamic> generateQr() async {
    late String data;
    String? id;

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

      case QrType.visa:
        final cardNumberError = AppValidators.validateVisaCardNumber(
          cardNumberController.text,
        );
        final cvvCodeError = AppValidators.validateCvvCode(
          cvvCodeController.text,
        );
        final cardHolderNameError = AppValidators.validateVisaCardHolderName(
          cardHolderNameController.text,
        );
        final expiryDateError = AppValidators.validateVisaCardExpireDate(
          expiryDateController.text,
        );

        if (cardNumberError != null) {
          emit(QrGenerateError(cardNumberError));
          return null;
        }

        if (cvvCodeError != null) {
          emit(QrGenerateError(cvvCodeError));
          return null;
        }

        if (cardHolderNameError != null) {
          emit(QrGenerateError(cardHolderNameError));
          return null;
        }
        if (expiryDateError != null) {
          emit(QrGenerateError(expiryDateError));
          return null;
        }

        XOR xor = XOR();

        var uuid = Uuid();
        id = uuid.v1().replaceAll("-", "");
        var encrypted = xor.xorEncode(
          cardNumberController.text.toString(),
          secretKey: id,
        );

        data =
            "VISA:N:${encrypted + '-VssEnc-' + id};"
            "E:${expiryDateController.text};"
            "C:${cardHolderNameController.text};"
            "V:${cvvCodeController.text};;";
        break;

      case QrType.wifi:
        data = 'WIFI:';

        String encryptionType = '';
        switch (encryption) {
          case 0:
            encryptionType = 'nopass';
            break;
          case 1:
            encryptionType = 'WPA';
            break;
          case 2:
            encryptionType = 'WEP';
            break;
        }

        data += 'T:$encryptionType;';
        data += 'S:${wifiNameController.text};';
        if (encryption != 0 && wifiPasswordController.text.isNotEmpty) {
          data += 'P:${wifiPasswordController.text};';
        }

        if (hidden) {
          data += 'H:true;';
        }

        data += ';';
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
      id: id,
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
      case ControllerType.wifiName:
        wifiNameController.clear();
        break;
      case ControllerType.wifiPassword:
        wifiPasswordController.clear();
        break;
      case ControllerType.cvvCode:
        cvvCodeController.clear();
        break;
      case ControllerType.cardHolderName:
        cardHolderNameController.clear();
        break;
      case ControllerType.cardNumber:
        cardNumberController.clear();
        break;
      case ControllerType.expiryDate:
        expiryDateController.clear();
        break;
    }
    emit(QrGenerateLoaded());
  }
}
