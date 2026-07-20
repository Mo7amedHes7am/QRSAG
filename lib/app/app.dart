import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart'
    show
        BuildContext,
        MaterialApp,
        Widget,
        ThemeData,
        ThemeExtension,
        ThemeMode,
        Colors;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show WatchContext;
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/UI/screens/splash_screen.dart';
import 'package:qr_scanner_and_generator/core/Colors/Colors.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:qr_scanner_and_generator/core/theme/theme_state.dart';
import 'app_Methods.dart';

class QRSAGApp extends StatelessWidget {
  const QRSAGApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeCubit>().state;
    final isLight = themeMode == ThemeMode.light;
    final backgroundColor = isLight
        ? const Color(0xffffffff)
        : const Color(0xff000814);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isLight ? Brightness.dark : Brightness.light,
        statusBarBrightness: isLight ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: isLight
            ? Brightness.dark
            : Brightness.light,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );

    return MaterialApp(
      builder: (context, child) => ColoredBox(
        color: backgroundColor,
        child: SafeArea(
          child: ResponsiveBuilder(
            designSize: const Size(428, 926),
            contentMaxWidth: 1200,
            centerContent: true,
            child: child!,
          ),
        ),
      ),
      themeMode: themeMode,
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
    );
  }
}
