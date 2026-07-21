import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/screens/history_view/history_screen.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/screens/scanner_view/scan_qr_screen.dart';

part 'home_state.dart';

abstract class HomeCubitBase extends Cubit<HomeState> {
  HomeCubitBase() : super(HomeInitialState());

  final Pages = [Placeholder(), ScanQrScreen(), HistoryScreen()];
  int selected = 1;

  void changeTab(int index) {}
}
