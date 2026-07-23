import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner_and_generator/Features/Home_Feature/Presentation/UI/screens/navbar_screen.dart';
import 'package:qr_scanner_and_generator/Features/More_Feature/Presentation/Cubit/more_cubit.dart';
import 'package:qr_scanner_and_generator/Features/More_Feature/Presentation/UI/screens/settings_view.dart';
import 'package:qr_scanner_and_generator/core/Methods/app_Navigation.dart';
import 'package:qr_scanner_and_generator/core/utils/DI/di.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/Cubit/splash_cubit.dart';

class SettingsScreen extends StatelessWidget {
  int pageIndex;
  SettingsScreen({required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AppNavigator.offallpages(context, NavbarScreen(index: pageIndex));
        return false;
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider<MoreCubit>(create: (_) => getIt<MoreCubit>()),
          BlocProvider<SplashCubit>(create: (_) => getIt<SplashCubit>()),
        ],
        child: SettingsView(pageIndex: pageIndex),
      ),
    );
  }
}
