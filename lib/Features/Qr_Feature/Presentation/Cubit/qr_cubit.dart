import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'qr_state.dart';

@lazySingleton
class QrCubit extends Cubit<QrState> {
  @factoryMethod
  QrCubit() : super(QrInitialState());
}
