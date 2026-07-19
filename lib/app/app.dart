import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart'
    show
        BuildContext,
        MaterialApp,
        Widget,
        ThemeData,
        ThemeExtension,
        ThemeMode;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show WatchContext;
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/UI/screens/splash_screen.dart';
import 'package:qr_scanner_and_generator/core/Colors/Colors.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:qr_scanner_and_generator/core/theme/theme_state.dart';
import 'app_Methods.dart';
import 'app_variables.dart';

class QRSAGApp extends StatelessWidget {
  const QRSAGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.watch<ThemeCubit>().state == ThemeMode.light
          ? Color(0xffffffff)
          : Color(0xff1e1e1e),
      child: SafeArea(
        top: false,
        bottom: splash,
        child: MaterialApp(
          builder: (context, child) => ResponsiveBuilder(
            designSize: const Size(428, 926),
            contentMaxWidth: 1200,
            centerContent: true,
            child: child!,
          ),
          themeMode: context.watch<ThemeCubit>().state,
          theme: ThemeData.light().copyWith(
            extensions: <ThemeExtension<dynamic>>[QRSAGLightTheme()],
          ),
          darkTheme: ThemeData.dark().copyWith(
            extensions: <ThemeExtension<dynamic>>[QRSAGDarkTheme()],
          ),
          home: SplashPage(getData: true),
          navigatorKey: navigatorKey,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
