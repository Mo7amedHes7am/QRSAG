import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/cache/Adapters/GlobalCacheAdapter.dart';
import 'package:qr_scanner_and_generator/core/cache/Models/GlobalCacheModel.dart';
import 'package:qr_scanner_and_generator/core/cache/Models/HistoryModel.dart';

import 'Adapters/HistoryAdapter.dart';

class CacheManager {
  static Future<void> init() async {
    await Hive.initFlutter();

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GlobalCacheAdapter());
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(HistoryAdapter());
    }
    // await Hive.deleteBoxFromDisk('globalCache');
    globalBox = await Hive.openBox<GlobalCacheModel>('globalCache');
    historyBox = await Hive.openBox<HistoryModel>('historyCache');
    debugPrint('Global Box Initialized');
  }

  static Future<void> setGlobalData({
    int? theme,
    String? language,
    bool? onboarding,
    bool? vibrate,
    bool? beep,
  }) async {
    final cache = globalBox.get('global') ?? GlobalCacheModel.empty();

    final updated = cache.copyWith(
      theme: theme ?? cache.theme,
      onboarding: onboarding ?? cache.onboarding,
      language: language ?? cache.language,
      vibrate: vibrate ?? cache.vibrate,
      beep: beep ?? cache.beep,
    );

    await globalBox.put('global', updated);
  }

  static GlobalCacheModel _getGlobalModel() {
    return globalBox.get('global') ?? GlobalCacheModel.empty();
  }

  static GlobalCacheModel getGlobalData() {
    final cache = _getGlobalModel();
    return GlobalCacheModel(
      onboarding: cache.onboarding,
      theme: cache.theme,
      language: cache.language,
      vibrate: cache.vibrate,
      beep: cache.beep,
    );
  }

  static Future<void> reset() async {
    await globalBox.clear();
  }

  static Future<void> clearhistory() async {
    await historyBox.clear();
  }

  static Future<void> close() async {
    await globalBox.close();
  }
}
