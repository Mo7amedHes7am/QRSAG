part of 'splash_cubit.dart';

@immutable
abstract class SplashState {}

class SplashInitialState extends SplashState {}

class SplashLoadingState extends SplashState {
  final int activeIndex;

  SplashLoadingState(this.activeIndex);
}

class SplashErrorState extends SplashState {
  final String error;

  SplashErrorState(this.error);
}

class SplashWelcomeState extends SplashState {
  final int step;

  SplashWelcomeState(this.step);
}

class SplashNavigateToLoginState extends SplashState {}

class SplashNavigateToHomeState extends SplashState {}

class SplashUserLoadedState extends SplashState {
  List<CategoryModel> categories;

  SplashUserLoadedState(this.categories);
}

class GetUserDataErrorState extends SplashState {}

class GetUserDataSuccessState extends SplashState {
  GetUserDataSuccessState();
}

class GetTeacherListErrorState extends SplashState {}

class GetTeacherListSuccessState extends SplashState {
  GetTeacherListSuccessState();
}

class GetSessionListErrorState extends SplashState {}

class GetSessionListSuccessList extends SplashState {
  GetSessionListSuccessList();
}

class GetPackageListErrorState extends SplashState {}

class GetPackageListSuccessList extends SplashState {
  GetPackageListSuccessList();
}
