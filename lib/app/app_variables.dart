import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show ThemeMode, Theme, VoidCallback;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qr_scanner_and_generator/app/app_Methods.dart';
import 'package:qr_scanner_and_generator/core/Colors/AppTheme.dart';
import 'package:qr_scanner_and_generator/core/cache/Models/GlobalCacheModel.dart';
import 'package:qr_scanner_and_generator/core/cache/Models/HistoryModel.dart';

List<bool> loading = [];
Function(void)? action;
AppColors get appColors =>
    Theme.of(navigatorKey.currentContext!).extension<AppColors>()!;
ThemeMode themeMode = ThemeMode.system;
late Box<GlobalCacheModel> globalBox;
late Box<HistoryModel> historyBox;
bool splash = false;
late Function(BuildContext) changeTheme;

Map<String, dynamic>? currentResponse;
