import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

abstract class HomeCubitBase extends Cubit<HomeState> {
  HomeCubitBase() : super(HomeInitialState());

  final Pages = [Placeholder(), Placeholder(), Placeholder()];
  int selected = 1;

  void changeTab(int index) {}
}
