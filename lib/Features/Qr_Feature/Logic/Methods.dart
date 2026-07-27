import 'package:easy_localization/easy_localization.dart';
import 'package:encrypt_decrypt_plus/encrypt_decrypt/xor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Data/Models/qrtype.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Cubit/qr_cubit.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/screens/generate_view/generate_business_Screen.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/screens/generate_view/generate_contact_screen.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/screens/generate_view/generate_event_screen.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/screens/generate_view/generate_text_screen.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/screens/generate_view/generate_visa_screen.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/screens/generate_view/generate_wifi_screen.dart';
import 'package:qr_scanner_and_generator/core/Methods/app_Navigation.dart';
import 'package:qr_scanner_and_generator/core/Methods/app_validators.dart';
import 'package:qr_scanner_and_generator/core/cache/cache_manager.dart';
import 'package:qr_scanner_and_generator/generated/locale_keys.g.dart';

QrType detectQrType(String qr) {
  final value = qr.trim().toLowerCase();

  final matchers = <(bool Function(String), QrType)>[
    ((v) => v.startsWith('wifi:'), QrType.wifi),
    ((v) => v.contains('wa.me') || v.contains('whatsapp.com'), QrType.whatsapp),
    ((v) => v.contains('x.com') || v.contains('twitter.com'), QrType.x),
    ((v) => v.contains('instagram.com'), QrType.instagram),
    ((v) => v.startsWith('http') || v.startsWith('www'), QrType.website),
    ((v) => v.startsWith('mailto:'), QrType.email),
    ((v) => v.startsWith('tel:'), QrType.phone),
    ((v) => v.startsWith('begin:vevent'), QrType.event),
    ((v) => v.startsWith('event'), QrType.event),
    ((v) => v.startsWith('begin:vcard'), QrType.contact),
    ((v) => v.startsWith('business:'), QrType.business),
    ((v) => v.startsWith('contact:'), QrType.contact),
    ((v) => v.startsWith('visa:'), QrType.visa),
  ];

  for (final (matcher, type) in matchers) {
    if (matcher(value)) return type;
  }

  return value.isEmpty ? QrType.text : QrType.data;
}

String _extractBetween(String data, String startKey, String endKey) {
  final lower = data.toLowerCase();
  final start = lower.indexOf(startKey);
  if (start == -1) return '';
  final end = lower.indexOf(endKey, start + startKey.length);
  if (end == -1) return '';
  return data.substring(start + startKey.length, end);
}

DateTime? tryParseDate(String dateString) {
  if (dateString.isEmpty) return null;

  dateString = dateString.trim();

  final numericRegex = RegExp(r'^-?\d+$');
  if (numericRegex.hasMatch(dateString)) {
    try {
      final milliseconds = int.parse(dateString);

      if (dateString.length == 10) {
        return DateTime.fromMillisecondsSinceEpoch(milliseconds * 1000);
      } else if (dateString.length == 13) {
        return DateTime.fromMillisecondsSinceEpoch(milliseconds);
      } else if (dateString.length >= 16) {
        return DateTime.fromMillisecondsSinceEpoch(milliseconds ~/ 1000);
      }
    } catch (e) {}
  }

  final List<String> formats = [
    'yyyy-MM-dd HH:mm:ss',
    'yyyy-MM-ddTHH:mm:ss',
    'yyyy-MM-dd HH:mm',
    'yyyy-MM-ddTHH:mm',
    'yyyy-MM-dd',
    'dd/MM/yyyy HH:mm:ss',
    'dd/MM/yyyy HH:mm',
    'dd/MM/yyyy',
    'MM/dd/yyyy HH:mm:ss',
    'MM/dd/yyyy HH:mm',
    'MM/dd/yyyy',
    'yyyy MMMM dd hh:mm aa',
    'yyyy MMMM dd',
    'MMMM dd, yyyy',
    'EEE, MMM d, yyyy HH:mm:ss',
    'EEE, MMM d, yyyy',
    'yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'',
    'yyyy-MM-dd\'T\'HH:mm:ss.SSS',
  ];

  for (var format in formats) {
    try {
      return DateFormat(
        format,
        CacheManager.getGlobalData().language,
      ).parse(dateString);
    } catch (e) {}
  }

  try {
    return DateTime.parse(dateString);
  } catch (e) {
    return null;
  }
}

String formatDateForDisplay(DateTime date) {
  return DateFormat(
    'yyyy MMMM dd hh:mm aa',
    CacheManager.getGlobalData().language,
  ).format(date);
}

String parseQrData(String data) {
  try {
    final type = detectQrType(data);

    switch (type) {
      case QrType.wifi:
        return "${LocaleKeys.qr_network_name.tr()}: ${_extractBetween(data, ";s:", ";p:")}\n"
            "${LocaleKeys.qr_network_password.tr()}: ${_extractBetween(data, ";p:", ";h:")}\n"
            "${LocaleKeys.qr_hidden.tr()}: ${_extractBetween(data, ";h:", ";;")}\n"
            "${LocaleKeys.qr_encryption.tr()}: ${_extractBetween(data, ":t:", ";s:")}\n";

      case QrType.event:
        final eventName = _extractBetween(data, ":n:", ";st:");
        final startDateStr = _extractBetween(data, ";st:", ";ed:");
        final endDateStr = _extractBetween(data, ";ed:", ";e:");
        final location = _extractBetween(data, ";e:", ";d:");
        final description = _extractBetween(data, ";d:", ";;");

        final startDate = tryParseDate(startDateStr);
        final endDate = tryParseDate(endDateStr);

        String result = "";

        if (eventName.isNotEmpty) {
          result += "${LocaleKeys.qr_event_name.tr()}: $eventName\n";
        }

        if (startDate != null) {
          result +=
              "${LocaleKeys.qr_starts_at.tr()}: ${formatDateForDisplay(startDate)}\n";
        } else if (startDateStr.isNotEmpty) {
          result += "${LocaleKeys.qr_starts_at.tr()}: $startDateStr\n";
        }

        if (endDate != null) {
          result +=
              "${LocaleKeys.qr_ends_at.tr()}: ${formatDateForDisplay(endDate)}\n";
        } else if (endDateStr.isNotEmpty) {
          result += "${LocaleKeys.qr_ends_at.tr()}: $endDateStr\n";
        }

        if (location.isNotEmpty) {
          result += "${LocaleKeys.qr_location.tr()}: $location\n";
        }

        if (description.isNotEmpty) {
          result += "${LocaleKeys.qr_description.tr()}: $description";
        }

        return result;

      case QrType.contact:
        return "${LocaleKeys.qr_name.tr()}: ${_extractBetween(data, ":n:", ";c:")}\n"
            "${LocaleKeys.qr_phone_number.tr()}: ${_extractBetween(data, ";p:", ";e:")}\n"
            "${LocaleKeys.qr_email.tr()}: ${_extractBetween(data, ";e:", ";w:")}\n"
            "${LocaleKeys.qr_website.tr()}: ${_extractBetween(data, ";w:", ";a:")}\n"
            "${LocaleKeys.qr_works_as.tr()}: ${_extractBetween(data, ";j:", ";p:")}"
            " ${LocaleKeys.qr_at.tr()}: ${_extractBetween(data, ";c:", ";j:")}\n"
            "${LocaleKeys.qr_address.tr()}: ${_extractBetween(data, ";a:", ";ci:")} "
            "${LocaleKeys.qr_city.tr()}: ${_extractBetween(data, ";ci:", ";co:")} "
            "${LocaleKeys.qr_country.tr()}: ${_extractBetween(data, ";co:", ";;")}";

      case QrType.business:
        return "${LocaleKeys.qr_name.tr()}: ${_extractBetween(data, ":n:", ";i:")}\n"
            "${LocaleKeys.qr_industry.tr()}: ${_extractBetween(data, ";i:", ";p:")}\n"
            "${LocaleKeys.qr_phone_number.tr()}: ${_extractBetween(data, ";p:", ";e:")}\n"
            "${LocaleKeys.qr_email.tr()}: ${_extractBetween(data, ";e:", ";w:")}\n"
            "${LocaleKeys.qr_website.tr()}: ${_extractBetween(data, ";w:", ";a:")}\n"
            "${LocaleKeys.qr_address.tr()}: ${_extractBetween(data, ";a:", ";ci:")} "
            "${LocaleKeys.qr_city.tr()}: ${_extractBetween(data, ";ci:", ";co:")} "
            "${LocaleKeys.qr_country.tr()}: ${_extractBetween(data, ";co:", ";;")}";

      case QrType.visa:
        final rawCard = _extractBetween(data, ":n:", ";e:");
        final parts = rawCard.split("-VssEnc-");
        final cardNumber = parts.length == 2
            ? XOR().xorDecode(parts[0], secretKey: parts[1])
            : rawCard;

        return "${LocaleKeys.qr_holder_name.tr()}: ${_extractBetween(data, ";c:", ";v:")}\n"
            "${LocaleKeys.qr_card_number.tr()}: $cardNumber\n"
            "${LocaleKeys.qr_expiry_date.tr()}: ${_extractBetween(data, ";e:", ";c:")}\n"
            "${LocaleKeys.qr_cvv.tr()}: ${_extractBetween(data, ";v:", ";;")}\n";

      default:
        return data;
    }
  } catch (_) {
    return data;
  }
}

String? extractVisaSecret(String scannedQrCode) {
  final parts = scannedQrCode.split("-VssEnc-");
  return parts.length == 2 ? parts[1] : null;
}

String formatDate(int timestamp) {
  final formatter = DateFormat(
    'dd MMM yyyy, h.mm aa',
    CacheManager.getGlobalData().language,
  );
  return formatter.format(DateTime.fromMillisecondsSinceEpoch(timestamp));
}

void handle_navigation({required QrType type, required BuildContext context}) {
  switch (type) {
    case QrType.text:
    case QrType.website:
    case QrType.whatsapp:
    case QrType.x:
    case QrType.email:
    case QrType.instagram:
    case QrType.phone:
    case QrType.data:
      AppNavigator.toPageWithCubit(
        context: context,
        cubit: context.read<QrCubit>(),
        screen: GenerateTextScreen(type: type),
      );
      break;
    case QrType.wifi:
      AppNavigator.toPageWithCubit(
        context: context,
        cubit: context.read<QrCubit>(),
        screen: GenerateWifiScreen(),
      );
      break;
    case QrType.event:
      AppNavigator.toPageWithCubit(
        context: context,
        cubit: context.read<QrCubit>(),
        screen: GenerateEventScreen(),
      );
      break;
    case QrType.contact:
      AppNavigator.toPageWithCubit(
        context: context,
        cubit: context.read<QrCubit>(),
        screen: GenerateContactScreen(),
      );
      break;
    case QrType.business:
      AppNavigator.toPageWithCubit(
        context: context,
        cubit: context.read<QrCubit>(),
        screen: GenerateBusinessScreen(),
      );
      break;
    case QrType.visa:
      AppNavigator.toPageWithCubit(
        context: context,
        cubit: context.read<QrCubit>(),
        screen: GenerateVisaScreen(),
      );
      break;
  }
}

String? validateInput({
  required TextEditingController controller,
  required QrType type,
}) {
  final text = controller.text.trim();

  final requiredError = AppValidators.validateRequired(text);
  if (requiredError != null) return requiredError;

  switch (type) {
    case QrType.text:
      return null;

    case QrType.website:
      return AppValidators.validateWebsite(text);

    case QrType.whatsapp:
    case QrType.phone:
      return AppValidators.validatePhone(text);

    case QrType.email:
      return AppValidators.validateEmail(text);

    case QrType.x:
    case QrType.instagram:
      return AppValidators.validateUsername(text);

    default:
      return null;
  }
}
