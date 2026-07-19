class GlobalCacheModel {
  bool onboarding;
  int theme;
  String language;
  bool vibrate;
  bool beep;

  GlobalCacheModel({
    this.onboarding = false,
    this.theme = -1,
    this.language = "",
    this.vibrate = true,
    this.beep = true,
  });

  factory GlobalCacheModel.empty() => GlobalCacheModel();

  GlobalCacheModel copyWith({
    bool? onboarding,
    int? theme,
    String? language,
    bool? vibrate,
    bool? beep,
  }) {
    return GlobalCacheModel(
      onboarding: onboarding ?? this.onboarding,
      theme: theme ?? this.theme,
      language: language ?? this.language,
      vibrate: vibrate ?? this.vibrate,
      beep: beep ?? this.beep,
    );
  }
}
