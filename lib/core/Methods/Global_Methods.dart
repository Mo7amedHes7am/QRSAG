import 'package:country_code_picker/country_code_picker.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:qr_scanner_and_generator/core/cache/cache_manager.dart';

String convertArabicToEnglish(String input) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

  for (int i = 0; i < arabic.length; i++) {
    input = input.replaceAll(arabic[i], english[i]);
  }
  return input;
}

bool validatePhoneNumber(String phoneNumber, String countryCode) {
  try {
    final parsedNumber = PhoneNumber.parse(
      phoneNumber,
      callerCountry: IsoCode.fromJson(
        CountryCode.fromDialCode(countryCode).code!,
      ),
    );
    return parsedNumber.isValid();
  } catch (e) {
    return false;
  }
}

String getLocaleFont() {
  return CacheManager.getGlobalData().language == 'ar' ? 'Zain' : 'Helvetica';
}
