import 'package:qr_scanner_and_generator/core/utils/app_images.dart';

class LanguageModel {
  final String flag;
  final String label;
  final String code;

  const LanguageModel({
    required this.flag,
    required this.label,
    required this.code,
  });

  factory LanguageModel.fromMap(Map<String, dynamic> map) {
    return LanguageModel(
      flag: map['flag'] ?? '',
      label: map['label'] ?? '',
      code: map['code'] ?? '',
    );
  }

  static List<LanguageModel> languages() {
    return [
      const LanguageModel(flag: AppSvgs.ar, label: "العربية", code: "ar"),
      const LanguageModel(flag: AppSvgs.en, label: "English", code: "en"),
      const LanguageModel(flag: AppSvgs.zh, label: "中文", code: "zh"),
      const LanguageModel(flag: AppSvgs.es, label: "Español", code: "es"),
      const LanguageModel(flag: AppSvgs.hi, label: "हिन्दी", code: "hi"),
      const LanguageModel(flag: AppSvgs.bn, label: "বাংলা", code: "bn"),
      const LanguageModel(flag: AppSvgs.pt, label: "Português", code: "pt"),
      const LanguageModel(flag: AppSvgs.ru, label: "Русский", code: "ru"),
      const LanguageModel(flag: AppSvgs.ja, label: "日本語", code: "ja"),
      const LanguageModel(flag: AppSvgs.pa, label: "ਪੰਜਾਬੀ", code: "pa"),
      const LanguageModel(flag: AppSvgs.de, label: "Deutsch", code: "de"),
      const LanguageModel(flag: AppSvgs.ko, label: "한국어", code: "ko"),
      const LanguageModel(flag: AppSvgs.fr, label: "Français", code: "fr"),
      const LanguageModel(flag: AppSvgs.te, label: "తెలుగు", code: "te"),
      const LanguageModel(flag: AppSvgs.mr, label: "मराठी", code: "mr"),
      const LanguageModel(flag: AppSvgs.tr, label: "Türkçe", code: "tr"),
      const LanguageModel(flag: AppSvgs.ta, label: "தமிழ்", code: "ta"),
      const LanguageModel(flag: AppSvgs.vi, label: "Tiếng Việt", code: "vi"),
      const LanguageModel(flag: AppSvgs.ur, label: "اردو", code: "ur"),
      const LanguageModel(flag: AppSvgs.fa, label: "فارسی", code: "fa"),
      const LanguageModel(flag: AppSvgs.pl, label: "Polski", code: "pl"),
      const LanguageModel(flag: AppSvgs.uk, label: "Українська", code: "uk"),
      const LanguageModel(flag: AppSvgs.ro, label: "Română", code: "ro"),
      const LanguageModel(flag: AppSvgs.nl, label: "Nederlands", code: "nl"),
      const LanguageModel(flag: AppSvgs.th, label: "ไทย", code: "th"),
      const LanguageModel(
        flag: AppSvgs.id,
        label: "Bahasa Indonesia",
        code: "id",
      ),
      const LanguageModel(flag: AppSvgs.ms, label: "Bahasa Melayu", code: "ms"),
      const LanguageModel(flag: AppSvgs.sw, label: "Kiswahili", code: "sw"),
      const LanguageModel(flag: AppSvgs.it, label: "Italiano", code: "it"),
      const LanguageModel(flag: AppSvgs.el, label: "Ελληνικά", code: "el"),
    ];
  }
}
