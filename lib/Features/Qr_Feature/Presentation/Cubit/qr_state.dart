// ignore_for_file: must_be_immutable

part of 'qr_cubit.dart';

@immutable
abstract class QrState {}

class QrInitialState extends QrState {}

class QrLoadingState extends QrState {}

class QrErrorState extends QrState {
  final String error;
  QrErrorState(this.error);
}

class QrSuccessState extends QrState {}
