import 'package:easy_localization/easy_localization.dart';
import 'package:qr_scanner_and_generator/generated/locale_keys.g.dart';

class AppValidators {
  static final RegExp emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
  static final RegExp phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');
  static final RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9_]+$');
  static final RegExp visaCardNumberRegex = RegExp(
    r'^4[0-9]{12}(?:[0-9]{3})?$',
  );
  static final RegExp cvvCodeRegex = RegExp(r'^[0-9]{3,4}$');
  static final RegExp cardHolderNameRegex = RegExp(
    r'^[a-zA-Z]+(?:[ ]?[a-zA-Z]+)*$',
  );
  static final RegExp cardExpiryRegex = RegExp(
    r'^(0[1-9]|1[0-2])\/([0-9]{2})$',
  );

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

  static String? validateVisaCardNumber(String? value) {
    if (value == null) return null;

    final cleaned = value.replaceAll(RegExp(r'[\s-]'), '');

    if (cleaned.isEmpty) {
      return LocaleKeys.generate_validation_empty.tr();
    }

    if (cleaned.length < 13 || cleaned.length > 16) {
      return LocaleKeys.generate_validation_invalid_card_number.tr();
    }

    if (!visaCardNumberRegex.hasMatch(cleaned)) {
      return LocaleKeys.generate_validation_invalid_card_number.tr();
    }

    if (!_isValidLuhn(cleaned)) {
      return LocaleKeys.generate_validation_invalid_card_number.tr();
    }

    return null;
  }

  static String? validateCvvCode(String? value) {
    if (value == null) return null;

    final trimmed = value.trim();

    if (trimmed.isEmpty) {
      return LocaleKeys.generate_validation_empty.tr();
    }

    if (!cvvCodeRegex.hasMatch(trimmed)) {
      return LocaleKeys.generate_validation_invalid_cvv.tr();
    }

    return null;
  }

  static String? validateVisaCardHolderName(String? value) {
    if (value == null) return null;
    final trimmed = value.trim();

    if (trimmed.isEmpty) {
      return LocaleKeys.generate_validation_empty.tr();
    }

    if (trimmed.length < 2) {
      return LocaleKeys.generate_validation_invalid_card_holder_name.tr();
    }

    if (!cardHolderNameRegex.hasMatch(trimmed)) {
      return LocaleKeys.generate_validation_invalid_card_holder_name.tr();
    }

    return null;
  }

  static String? validateVisaCardExpireDate(String? value) {
    if (value == null) return null;
    final trimmed = value.trim();

    if (trimmed.isEmpty) {
      return LocaleKeys.generate_validation_empty.tr();
    }

    if (!cardExpiryRegex.hasMatch(trimmed)) {
      return LocaleKeys.generate_validation_invalid_expiry_date.tr();
    }

    final parts = trimmed.split('/');
    final month = int.parse(parts[0]);
    final year = int.parse(parts[1]);

    final now = DateTime.now();
    final currentYear = now.year % 100;
    final currentMonth = now.month;

    if (month < 1 || month > 12) {
      return LocaleKeys.generate_validation_invalid_expiry_date.tr();
    }

    if (year < currentYear || (year == currentYear && month < currentMonth)) {
      return LocaleKeys.generate_validation_card_expired.tr();
    }

    if (year > currentYear + 20) {
      return LocaleKeys.generate_validation_invalid_expiry_date.tr();
    }

    return null;
  }

  static bool _isValidLuhn(String cardNumber) {
    int sum = 0;
    bool alternate = false;

    for (int i = cardNumber.length - 1; i >= 0; i--) {
      int n = int.parse(cardNumber[i]);

      if (alternate) {
        n *= 2;
        if (n > 9) {
          n = (n % 10) + 1;
        }
      }

      sum += n;
      alternate = !alternate;
    }

    return (sum % 10 == 0);
  }
}
