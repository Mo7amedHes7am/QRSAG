part of 'splash_cubit_base.dart';

@immutable
abstract class SplashState {}

class SplashInitialState extends SplashState {}

class SplashLoadingState extends SplashState {}

class SplashErrorState extends SplashState {
  final String error;

  SplashErrorState(this.error);
}

class SplashLoadedState extends SplashState {}

class LanguageFilteredState extends SplashState {
  final List<LanguageModel> filteredLanguages;

  LanguageFilteredState(this.filteredLanguages);
}

class LanguageChangedState extends SplashState {
  final LanguageModel language;

  LanguageChangedState(this.language);
}
