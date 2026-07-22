// ignore_for_file: must_be_immutable

part of 'qr_cubit_base.dart';

@immutable
abstract class QrState {}

class QrInitialState extends QrState {}

class QrLoadingState extends QrState {}

class QrErrorState extends QrState {
  final String error;
  QrErrorState(this.error);
}

class QrSuccessState extends QrState {}

class QrScannedState extends QrState {
  final HistoryModel historyData;
  QrScannedState({required this.historyData});
}

class QrResultActionState extends QrState {}

class QrActionLoadingState extends QrResultActionState {}

class QrShareSuccessState extends QrResultActionState {}

class QrSaveSuccessState extends QrResultActionState {
  QrSaveSuccessState({required this.path});
  final String path;
}

class QrActionErrorState extends QrResultActionState {
  QrActionErrorState({required this.message});
  final String message;
}

class QrActionIdleState extends QrResultActionState {}

class QrHistoryLoaded extends QrState {}

class QrGenerateLoaded extends QrState {}

class QrGenerateError extends QrState {
  final String message;
  QrGenerateError(this.message);
}
