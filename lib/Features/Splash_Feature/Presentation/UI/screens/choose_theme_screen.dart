import 'package:qr_scanner_and_generator/Features/Splash_Feature/Logic/Methods.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/CustomText.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/custom_button.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/directionality_widget.dart';
import 'package:qr_scanner_and_generator/core/theme/theme_state.dart';
import 'package:qr_scanner_and_generator/core/tools/Spacer.dart';
import 'package:qr_scanner_and_generator/core/utils/app_images.dart';
import 'package:qr_scanner_and_generator/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';

class ChooseThemeScreen extends StatefulWidget {
  const ChooseThemeScreen({super.key});

  @override
  State<ChooseThemeScreen> createState() => _ChooseThemeScreenState();
}

class _ChooseThemeScreenState extends State<ChooseThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    final currentTheme = themeCubit.state;
    final isDark = currentTheme == ThemeMode.dark;

    final size = MediaQuery.of(context).size;
    final isTablet = size.width >= 600;
    final isLandscape = size.width > size.height;

    final double vFactor = isLandscape ? 0.75 : 1.0;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: appColors.background,
        systemNavigationBarIconBrightness: isDark
            ? Brightness.light
            : Brightness.dark,
      ),
      child: DirectionalityWidget(
        child: Scaffold(
          backgroundColor: appColors.background,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                vertical: 16.h * vFactor,
                horizontal: isTablet ? 60.w : 20.w,
              ),
              child: Center(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: isTablet ? 800.w : double.infinity,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      isTablet
                          ? CustomText.x32
                                .semibold(LocaleKeys.chooseTheme_title.tr())
                                .primaryTextColor
                          : CustomText.x22
                                .semibold(LocaleKeys.chooseTheme_title.tr())
                                .primaryTextColor,

                      Space.vertical.custom(isTablet ? 20.h : 10.h),

                      isTablet
                          ? CustomText.x24
                                .semibold(LocaleKeys.chooseTheme_subtitle.tr())
                                .secondaryTextColor
                          : CustomText.x16
                                .semibold(LocaleKeys.chooseTheme_subtitle.tr())
                                .secondaryTextColor,

                      Space.vertical.custom(
                        (isTablet ? 100.h : 58.h) * vFactor,
                      ),

                      Center(
                        child: Lottie.asset(
                          isDark ? AppImages.Json.dark : AppImages.Json.light,
                          width: isTablet
                              ? (isLandscape ? 280.sp : 400.sp)
                              : (isLandscape ? 150.sp : 200.sp),
                          height: isTablet
                              ? (isLandscape ? 280.sp : 400.sp)
                              : (isLandscape ? 150.sp : 200.sp),
                          fit: BoxFit.contain,
                        ),
                      ),

                      Space.vertical.custom((isTablet ? 60.h : 32.h) * vFactor),

                      Center(
                        child: isTablet
                            ? CustomText.x40
                                  .semibold(
                                    isDark
                                        ? LocaleKeys.chooseTheme_darkMode.tr()
                                        : LocaleKeys.chooseTheme_lightMode.tr(),
                                  )
                                  .center
                                  .primaryTextColor
                            : CustomText.x30
                                  .semibold(
                                    isDark
                                        ? LocaleKeys.chooseTheme_darkMode.tr()
                                        : LocaleKeys.chooseTheme_lightMode.tr(),
                                  )
                                  .center
                                  .primaryTextColor,
                      ),

                      Space.vertical.custom((isTablet ? 60.h : 32.h) * vFactor),

                      Center(
                        child: GestureDetector(
                          onTap: () async {
                            themeCubit.toggleTheme();
                            await Future.delayed(
                              const Duration(milliseconds: 450),
                            );
                            setState(() {});
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            width: isTablet
                                ? (isLandscape ? 280.sp : 360.sp)
                                : (isLandscape ? 150.sp : 180.sp),
                            height: isTablet
                                ? (isLandscape ? 150.sp : 200.sp)
                                : (isLandscape ? 80.sp : 100.sp),
                            padding: EdgeInsets.all(isTablet ? 30.sp : 15.sp),
                            decoration: BoxDecoration(
                              color: isDark
                                  ? appColors.primary
                                  : appColors.grey,
                              borderRadius: BorderRadius.circular(
                                isTablet ? 200.r : 100.r,
                              ),
                            ),
                            child: AnimatedAlign(
                              duration: const Duration(milliseconds: 250),
                              alignment: isDark
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              curve: Curves.easeInOut,
                              child: Container(
                                width: isTablet
                                    ? (isLandscape ? 100.sp : 140.sp)
                                    : (isLandscape ? 60.sp : 70.sp),
                                height: isTablet
                                    ? (isLandscape ? 100.sp : 140.sp)
                                    : (isLandscape ? 60.sp : 70.sp),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Space.vertical.custom(
                        (isTablet ? 100.h : 50.h) * vFactor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          bottomNavigationBar: Container(
            padding: EdgeInsets.only(
              bottom: isTablet ? 80.h : 50.h,
              right: isTablet ? 60.w : 20.w,
              left: isTablet ? 60.w : 20.w,
            ),
            child: CustomButton(
              buttonTitle: LocaleKeys.common_continue.tr(),
              onPressed: () async {
                themeCubit.changeTheme(currentTheme);
                await Future.delayed(const Duration(milliseconds: 450));
                setState(() {});
                CheckWhereToGo(context: context);
              },
              active: true,
              height: isTablet ? 90.h : 55.h,
              style: 1,
              isTablet: isTablet,
            ),
          ),
        ),
      ),
    );
  }
}
