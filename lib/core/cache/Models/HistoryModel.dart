import 'package:flutter/material.dart';

class HistoryModel {
  String data, id, type, img, wifi;
  int datesubmitted;
  Map<String, String> labels;

  HistoryModel({
    required this.data,
    required this.id,
    required this.type,
    required this.img,
    required this.datesubmitted,
    required this.wifi,
    Map<String, String>? labels,
  }) : labels = labels ?? {};

  String getLocalizedLabel(String languageCode) {
    if (labels.containsKey(languageCode)) {
      return labels[languageCode]!;
    }

    if (labels.containsKey('en')) {
      return labels['en']!;
    }

    if (labels.isNotEmpty) {
      return labels.values.first;
    }

    return '';
  }

  String getLocalizedLabelFromContext(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return getLocalizedLabel(locale.languageCode);
  }

  String get arlabel => labels['ar'] ?? '';
  set arlabel(String value) => labels['ar'] = value;

  String get enlabel => labels['en'] ?? '';
  set enlabel(String value) => labels['en'] = value;

  Map<String, dynamic> toJson() => {
    'data': data,
    'id': id,
    'type': type,
    'img': img,
    'wifi': wifi,
    'datesubmitted': datesubmitted,
    'labels': labels,
  };

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
    data: json['data'] ?? '',
    id: json['id'] ?? '',
    type: json['type'] ?? '',
    img: json['img'] ?? '',
    wifi: json['wifi'] ?? '',
    datesubmitted: json['datesubmitted'] ?? 0,
    labels: Map<String, String>.from(json['labels'] ?? {}),
  );
}
