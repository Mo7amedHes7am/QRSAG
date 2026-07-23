import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner_and_generator/app/app.dart';
import 'package:qr_scanner_and_generator/app/app_initializer.dart';
import 'package:qr_scanner_and_generator/core/theme/theme_state.dart';
import 'package:qr_scanner_and_generator/generated/codegen_loader.g.dart';

void main() async {
  await AppInitializer.initialize();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  FlutterError.onError = (FlutterErrorDetails details) {
    if (details.exceptionAsString().contains(
      'MouseTracker._shouldMarkStateDirty',
    )) {
      debugPrint(
        'Suppressed MouseTracker assertion error: ${details.exception}',
      );
    } else {
      FlutterError.dumpErrorToConsole(details);
    }
  };
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('zh'),
        Locale('es'),
        Locale('ar'),
        Locale('hi'),
        Locale('bn'),
        Locale('pt'),
        Locale('ru'),
        Locale('ja'),
        Locale('pa'),
        Locale('de'),
        Locale('ko'),
        Locale('fr'),
        Locale('te'),
        Locale('mr'),
        Locale('tr'),
        Locale('ta'),
        Locale('vi'),
        Locale('ur'),
        Locale('fa'),
        Locale('pl'),
        Locale('uk'),
        Locale('ro'),
        Locale('nl'),
        Locale('th'),
        Locale('id'),
        Locale('ms'),
        Locale('sw'),
        Locale('it'),
        Locale('el'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: Locale(WidgetsBinding.instance.window.locale.languageCode),
      assetLoader: const CodegenLoader(),
      child: BlocProvider(create: (_) => ThemeCubit(), child: const QRSAGApp()),
    ),
  );
}
