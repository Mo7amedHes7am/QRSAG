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
      LanguageModel(
        flag: AppSvgs.ar,
        label: "اللغة العربية",
        code: "ar",
      ),
      LanguageModel(flag: AppSvgs.en, label: "English", code: "en"),
    ];
  }
}
