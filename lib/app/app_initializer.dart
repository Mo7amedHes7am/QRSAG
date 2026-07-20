import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner_and_generator/core/cache/cache_manager.dart';
import 'package:qr_scanner_and_generator/core/utils/DI/di.dart';
import 'package:qr_scanner_and_generator/core/utils/my_observer.dart';

class AppInitializer {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _initializeDependencies();
    await _initializeCache();
    await EasyLocalization.ensureInitialized();
  }

  static Future<void> _initializeDependencies() async {
    configureDependencies();
    Bloc.observer = MyBlocObserver();
  }

  static Future<void> _initializeCache() async {
    await CacheManager.init();
  }
}
