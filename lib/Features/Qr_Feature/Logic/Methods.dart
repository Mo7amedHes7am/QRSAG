import 'package:easy_localization/easy_localization.dart';
import 'package:encrypt_decrypt_plus/encrypt_decrypt/xor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Data/Models/qrtype.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Cubit/qr_cubit.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/screens/generate_view/generate_text_screen.dart';
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
    ((v) => v.startsWith('begin:vcard'), QrType.contact),
    ((v) => v.startsWith('business:'), QrType.business),
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
        return "${LocaleKeys.qr_event_name.tr()}: ${_extractBetween(data, ":n:", ";st:")}\n"
            "${LocaleKeys.qr_starts_at.tr()}: ${_extractBetween(data, ";st:", ";ed:")}\n"
            "${LocaleKeys.qr_ends_at.tr()}: ${_extractBetween(data, ";ed:", ";e:")}\n"
            "${LocaleKeys.qr_location.tr()}: ${_extractBetween(data, ";e:", ";d:")}\n"
            "${LocaleKeys.qr_description.tr()}: ${_extractBetween(data, ";d:", ";;")}";

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
      // Get.to(GenerateWifiScreen());
      break;
    case QrType.event:
      // Get.to(GenerateEventScreen());
      break;
    case QrType.contact:
      // Get.to(GenerateContactScreen());
      break;
    case QrType.business:
      // Get.to(GenerateBusinessScreen());
      break;
    case QrType.visa:
      // Get.to(GenerateVisaScreen());
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
