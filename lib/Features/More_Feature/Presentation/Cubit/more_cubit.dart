import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'more_state.dart';

@lazySingleton
class MoreCubit extends Cubit<MoreState> {
  @factoryMethod
  MoreCubit() : super(MoreInitialState());
}
