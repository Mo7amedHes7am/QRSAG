import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Logic/Methods.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/Cubit/splash_cubit.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/UI/widgets/background_pattern.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/components/global/system_wrapper.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:qr_scanner_and_generator/core/utils/DI/di.dart';
import 'package:qr_scanner_and_generator/core/utils/app_images.dart';

class SplashPage extends StatelessWidget {
  bool getData;
  SplashPage({required this.getData});

  @override
  Widget build(BuildContext context) {
    return SystemWrapper(
      child: BlocProvider(
        create: (_) => getIt<SplashCubit>()..init(context),
        child: BlocConsumer<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state is SplashLoadedState) {
              CheckWhereToGo(context: context);
            }
          },
          builder: (context, state) => Scaffold(
            backgroundColor: appColors.background,
            body: QRBackgroundPattern(
              patternSize: 50,
              opacity: 0.08,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      width: 200.sp,
                      height: 200.sp,
                      AppImages.Svgs.qrlogogold,
                    ),
                    Image(
                      image: AssetImage(AppImages.Gifs.loading),
                      color: appColors.primary,
                      width: 125.sp,
                      height: 125.sp,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
