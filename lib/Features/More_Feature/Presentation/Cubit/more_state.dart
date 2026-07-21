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

class MoreSuccessState extends MoreState {}
