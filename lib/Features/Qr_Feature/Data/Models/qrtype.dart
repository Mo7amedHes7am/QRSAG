import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/core/utils/app_images.dart';
import 'localization/translations.dart';

enum QrType {
  text,
  website,
  wifi,
  event,
  contact,
  business,
  visa,
  whatsapp,
  x,
  email,
  instagram,
  phone,
  data;

  String getLabel(String languageCode) {
    return QrTypeTranslations.getTranslation(this, languageCode);
  }

  String getLabelFromContext(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return getLabel(locale.languageCode);
  }

  String get image {
    switch (this) {
      case QrType.text:
        return AppSvgs.text;
      case QrType.website:
        return AppSvgs.website;
      case QrType.wifi:
        return AppSvgs.wifi;
      case QrType.event:
        return AppSvgs.event;
      case QrType.contact:
        return AppSvgs.contact;
      case QrType.business:
        return AppSvgs.business;
      case QrType.visa:
        return AppSvgs.visa;
      case QrType.whatsapp:
        return AppSvgs.whatsapp;
      case QrType.x:
        return AppSvgs.twitter;
      case QrType.email:
        return AppSvgs.email;
      case QrType.instagram:
        return AppSvgs.instagram;
      case QrType.phone:
        return AppSvgs.phone;
      case QrType.data:
        return AppSvgs.data;
    }
  }

  Map<String, String> getAllLabels() {
    return {
      'english': getLabel('en'),
      'arabic': getLabel('ar'),
      'chinese': getLabel('zh'),
      'spanish': getLabel('es'),
      'hindi': getLabel('hi'),
      'bengali': getLabel('bn'),
      'portuguese': getLabel('pt'),
      'russian': getLabel('ru'),
      'japanese': getLabel('ja'),
      'punjabi': getLabel('pa'),
      'german': getLabel('de'),
      'korean': getLabel('ko'),
      'french': getLabel('fr'),
      'telugu': getLabel('te'),
      'marathi': getLabel('mr'),
      'turkish': getLabel('tr'),
      'tamil': getLabel('ta'),
      'vietnamese': getLabel('vi'),
      'urdu': getLabel('ur'),
      'persian': getLabel('fa'),
      'polish': getLabel('pl'),
      'ukrainian': getLabel('uk'),
      'romanian': getLabel('ro'),
      'dutch': getLabel('nl'),
      'thai': getLabel('th'),
      'indonesian': getLabel('id'),
      'malay': getLabel('ms'),
      'swahili': getLabel('sw'),
      'italian': getLabel('it'),
      'greek': getLabel('el'),
    };
  }

  static List<QrType> get all => [
    QrType.text,
    QrType.website,
    QrType.wifi,
    QrType.event,
    QrType.contact,
    QrType.business,
    QrType.visa,
    QrType.whatsapp,
    QrType.x,
    QrType.email,
    QrType.instagram,
    QrType.phone,
  ];

  static List<Map<String, dynamic>> getAllWithLabels(String languageCode) {
    return all
        .map(
          (type) => {
            'type': type,
            'label': type.getLabel(languageCode),
            'image': type.image,
          },
        )
        .toList();
  }

  static QrType? fromLabel(String label, String languageCode) {
    return all.firstWhere(
      (type) =>
          type.getLabel(languageCode).toLowerCase() == label.toLowerCase(),
      orElse: () => QrType.text,
    );
  }
}

extension QrTypeExtension on QrType {
  String getLabelFromContext(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return getLabel(locale.languageCode);
  }
}
