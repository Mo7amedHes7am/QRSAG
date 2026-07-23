import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:qr_scanner_and_generator/core/cache/cache_manager.dart';
import 'package:qr_scanner_and_generator/core/theme/theme_state.dart';

part 'more_state.dart';

@injectable
class MoreCubit extends Cubit<MoreState> {
  MoreCubit() : super(MoreInitialState()) {
    loadSettings();
  }

  bool _beep = false;
  bool _vibrate = false;

  bool get beep => _beep;
  bool get vibrate => _vibrate;

  Future<void> loadSettings() async {
    try {
      if (!isClosed) emit(MoreLoadingState());

      final cache = CacheManager.getGlobalData();
      _beep = cache.beep;
      _vibrate = cache.vibrate;

      if (!isClosed) emit(MoreSuccessState(beep: _beep, vibrate: _vibrate));
    } catch (e) {
      if (!isClosed) emit(MoreErrorState(e.toString()));
    }
  }

  Future<void> toggleBeep() async {
    try {
      final newValue = !_beep;
      await CacheManager.setGlobalData(beep: newValue);
      _beep = newValue;

      if (state is MoreSuccessState) {
        final currentState = state as MoreSuccessState;
        if (!isClosed) emit(currentState.copyWith(beep: newValue));
      } else {
        if (!isClosed) emit(MoreSuccessState(beep: _beep, vibrate: _vibrate));
      }
    } catch (e) {
      if (!isClosed) emit(MoreErrorState(e.toString()));
    }
  }

  Future<void> toggleVibrate() async {
    try {
      final newValue = !_vibrate;
      await CacheManager.setGlobalData(vibrate: newValue);
      _vibrate = newValue;

      if (state is MoreSuccessState) {
        final currentState = state as MoreSuccessState;
        if (!isClosed) emit(currentState.copyWith(vibrate: newValue));
      } else {
        if (!isClosed) emit(MoreSuccessState(beep: _beep, vibrate: _vibrate));
      }
    } catch (e) {
      if (!isClosed) emit(MoreErrorState(e.toString()));
    }
  }

  void resetSettings() {
    _beep = false;
    _vibrate = false;
    if (!isClosed) emit(MoreSuccessState(beep: _beep, vibrate: _vibrate));
  }

  void refreshState() {
    if (!isClosed) emit(MoreSuccessState(beep: _beep, vibrate: _vibrate));
  }

  Future<void> changeTheme({required ThemeCubit cubit}) async {
    await HapticFeedback.lightImpact();
    await cubit.toggleTheme();
    await Future.delayed(Duration(milliseconds: 300));
    if (!isClosed) emit(MoreSuccessState(beep: _beep, vibrate: _vibrate));
  }
}
