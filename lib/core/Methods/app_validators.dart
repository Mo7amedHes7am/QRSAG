import 'package:easy_localization/easy_localization.dart';
import 'package:qr_scanner_and_generator/generated/locale_keys.g.dart';

class AppValidators {
  static final RegExp emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');

  static final RegExp phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');

  static String? validateRequired(String value) {
    if (value.trim().isEmpty) {
      return LocaleKeys.generate_validation_empty.tr();
    }
    return null;
  }

  static String? validateWebsite(String value) {
    final uri = Uri.tryParse(value);
    if (uri == null || !uri.hasAbsolutePath) {
      return LocaleKeys.generate_validation_invalid_website.tr();
    }
    return null;
  }

  static String? validateEmail(String value) {
    if (!emailRegex.hasMatch(value)) {
      return LocaleKeys.generate_validation_invalid_email.tr();
    }
    return null;
  }

  static String? validatePhone(String value) {
    if (!phoneRegex.hasMatch(value)) {
      return LocaleKeys.generate_validation_invalid_phone.tr();
    }
    return null;
  }

  static String? validateUsername(String value) {
    if (value.contains(' ')) {
      return LocaleKeys.generate_validation_invalid_username.tr();
    }
    return null;
  }
}
