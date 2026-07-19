import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/Cubit/splash_cubit.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/utils/DI/di.dart';

class SplashPage extends StatelessWidget {
  bool getData;
  SplashPage({required this.getData});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _initializeSplashCubit(context),
      child: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(color: appColors.background),
              child: Placeholder(),
            ),
          );
        },
      ),
    );
  }

  SplashCubit _initializeSplashCubit(BuildContext context) {
    final cubit = getIt<SplashCubit>();
    cubit.startLoaderAnimation();
    if (getData == true) {
      cubit.init(context);
    }
    return cubit;
  }
}
