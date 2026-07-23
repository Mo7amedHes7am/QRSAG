import 'package:easy_localization/easy_localization.dart';
import 'package:qr_scanner_and_generator/generated/locale_keys.g.dart';

class AppValidators {
  static final RegExp emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
  static final RegExp phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');
  static final RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9_]+$');

  static String? validateRequired(String value) {
    if (value.trim().isEmpty) {
      return LocaleKeys.generate_validation_empty.tr();
    }
    return null;
  }

  static String? validateWebsite(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return null;

    final RegExp flexibleRegex = RegExp(
      r'^(https?:\/\/)?'
      r'([\w-]+\.)*'
      r'[\w-]+'
      r'\.[a-zA-Z]{2,}'
      r'([\/\w .-]*)*'
      r'(\?[^\s]*)?'
      r'(#[^\s]*)?$',
      caseSensitive: false,
    );

    if (!flexibleRegex.hasMatch(trimmed)) {
      return LocaleKeys.generate_validation_invalid_website.tr();
    }

    return null;
  }

  static String? validateEmail(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return null;

    if (!emailRegex.hasMatch(trimmed)) {
      return LocaleKeys.generate_validation_invalid_email.tr();
    }
    return null;
  }

  static String? validatePhone(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return LocaleKeys.generate_validation_empty.tr();
    }

    if (!phoneRegex.hasMatch(trimmed)) {
      return LocaleKeys.generate_validation_invalid_phone.tr();
    }
    return null;
  }

  static String? validateUsername(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return LocaleKeys.generate_validation_empty.tr();
    }

    if (trimmed.contains(' ')) {
      return LocaleKeys.generate_validation_invalid_username.tr();
    }

    if (!usernameRegex.hasMatch(trimmed)) {
      return LocaleKeys.generate_validation_invalid_username.tr();
    }
    return null;
  }

  static String? validateTextLength(String value, {int maxLength = 255}) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return null;

    if (trimmed.length > maxLength) {
      return LocaleKeys.generate_validation_max_length.tr(
        args: [maxLength.toString()],
      );
    }
    return null;
  }

  static String? validatePhoneWithCountryCode(
    String value,
    String countryCode,
  ) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return LocaleKeys.generate_validation_empty.tr();
    }

    String phoneWithoutCode = trimmed;
    if (trimmed.startsWith(countryCode)) {
      phoneWithoutCode = trimmed.substring(countryCode.length);
    } else if (trimmed.startsWith('+')) {
      phoneWithoutCode = trimmed.substring(1);
    }

    if (!RegExp(
      r'^[0-9]{7,15}$',
    ).hasMatch(phoneWithoutCode.replaceAll(' ', ''))) {
      return LocaleKeys.generate_validation_invalid_phone.tr();
    }
    return null;
  }
}
