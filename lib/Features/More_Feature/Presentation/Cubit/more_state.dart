// ignore_for_file: must_be_immutable

part of 'more_cubit.dart';

@immutable
abstract class MoreState {}

class MoreInitialState extends MoreState {}

class MoreLoadingState extends MoreState {}

class MoreErrorState extends MoreState {
  final String error;
  MoreErrorState(this.error);
}

class MoreSuccessState extends MoreState {
  final bool beep;
  final bool vibrate;

  MoreSuccessState({required this.beep, required this.vibrate});

  MoreSuccessState copyWith({bool? beep, bool? vibrate}) {
    return MoreSuccessState(
      beep: beep ?? this.beep,
      vibrate: vibrate ?? this.vibrate,
    );
  }
}
