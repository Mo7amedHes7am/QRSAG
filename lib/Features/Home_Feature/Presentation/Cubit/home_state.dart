// ignore_for_file: must_be_immutable

part of 'home_cubit_base.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  final String error;
  HomeErrorState(this.error);
}

class TabChangedState extends HomeState {}
