import 'package:qr_scanner_and_generator/Features/Splash_Feature/Logic/Methods.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/Cubit/splash_cubit.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/UI/screens/chooseLanguageView/choose_language_landscape_view.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/UI/screens/chooseLanguageView/choose_language_portrait_view.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/UI/widgets/continue_button.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/components/global/system_wrapper.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/directionality_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseLanguageScreen extends StatelessWidget {
  const ChooseLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isWeb =
        Theme.of(context).platform == TargetPlatform.iOS ||
            Theme.of(context).platform == TargetPlatform.android
        ? false
        : true;

    return SystemWrapper(
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: BlocProvider.value(
          value: context.watch<SplashCubit>(),
          child: BlocConsumer<SplashCubit, SplashState>(
            listener: (context, state) {
              if (state is LanguageFilteredState) {}
            },
            builder: (context, state) {
              final _cubit = context.read<SplashCubit>();
              final currentLang = _cubit.selectedLanguage;
              return DirectionalityWidget(
                child: Scaffold(
                  backgroundColor: appColors.background,
                  body: SafeArea(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final isLandscape =
                            constraints.maxWidth > constraints.maxHeight;
                        final isTablet = constraints.maxWidth >= 600;

                        return SingleChildScrollView(
                          child: Center(
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: isWeb ? 1200 : double.infinity,
                              ),
                              child: isLandscape
                                  ? buildCLLandscape(
                                      context,
                                      currentLang,
                                      isTablet,
                                      isWeb,
                                      _cubit,
                                    )
                                  : buildCLPortrait(
                                      context,
                                      currentLang,
                                      isTablet,
                                      isWeb,
                                      _cubit,
                                    ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  bottomNavigationBar: ContinueButton(context, () {
                    _cubit.changeLanguage(
                      lang: _cubit.selectedLanguage,
                      context: context,
                    );
                    CheckWhereToGo(context: context);
                  }),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
