import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner_and_generator/Features/Home_Feature/Presentation/UI/screens/navbar_screen.dart';
import 'package:qr_scanner_and_generator/Features/More_Feature/Logic/Methods.dart';
import 'package:qr_scanner_and_generator/Features/More_Feature/Presentation/Cubit/more_cubit.dart';
import 'package:qr_scanner_and_generator/Features/More_Feature/Presentation/UI/widgets/contact_tile.dart';
import 'package:qr_scanner_and_generator/Features/More_Feature/Presentation/UI/widgets/section_header.dart';
import 'package:qr_scanner_and_generator/Features/More_Feature/Presentation/UI/widgets/settings_tile.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/main_app_bar.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/Cubit/splash_cubit.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/UI/screens/chooseLanguageView/choose_language_screen.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/Methods/Global_Methods.dart';
import 'package:qr_scanner_and_generator/core/Methods/app_Navigation.dart';
import 'package:qr_scanner_and_generator/core/components/global/system_wrapper.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/loading.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:qr_scanner_and_generator/core/theme/theme_state.dart';
import 'package:qr_scanner_and_generator/core/utils/app_images.dart';
import 'package:qr_scanner_and_generator/generated/locale_keys.g.dart';

class SettingsView extends StatelessWidget {
  int pageIndex;
  SettingsView({required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<MoreCubit, MoreState>(
          listener: (context, state) {
            if (state is MoreErrorState) {
              showToast(state.error, isError: true);
            }
          },
        ),
      ],
      child: BlocBuilder<MoreCubit, MoreState>(
        builder: (context, state) {
          final cubit = context.read<MoreCubit>();
          final splashCubit = context.read<SplashCubit>();
          ThemeCubit themeCubit = context.watch<ThemeCubit>();
          bool isDark = themeCubit.state == ThemeMode.dark;

          return SystemWrapper(
            child: LoadingScaffold(
              loading: state is MoreLoadingState,
              child: Scaffold(
                backgroundColor: appColors.background,
                appBar: MainAppBar(
                  title: LocaleKeys.settings_title.tr(),
                  hasBack: true,
                  context: context,
                  backstyle: 1,
                  customback: () => AppNavigator.offallpages(
                    context,
                    NavbarScreen(index: pageIndex),
                  ),
                ),
                body: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                    vertical: 30.h,
                  ),
                  child: Column(
                    children: [
                      SectionHeader(
                        title: LocaleKeys.settings_main_settings.tr(),
                      ),
                      SizedBox(height: 29.h),

                      SettingsTile(
                        iconPath: AppSvgs.vibrates,
                        title: LocaleKeys.settings_vibrate_title.tr(),
                        subtitle: LocaleKeys.settings_vibrate_subtitle.tr(),
                        showSwitch: true,
                        switchValue: cubit.vibrate,
                        onSwitchChanged: () {
                          context.read<MoreCubit>().toggleVibrate();
                        },
                      ),
                      SizedBox(height: 19.h),

                      SettingsTile(
                        iconPath: AppSvgs.bepp,
                        title: LocaleKeys.settings_beep_title.tr(),
                        subtitle: LocaleKeys.settings_beep_subtitle.tr(),
                        showSwitch: true,
                        switchValue: cubit.beep,
                        onSwitchChanged: () {
                          context.read<MoreCubit>().toggleBeep();
                        },
                      ),
                      SizedBox(height: 64.h),

                      SectionHeader(
                        title: LocaleKeys.settings_contact_customization.tr(),
                      ),
                      SizedBox(height: 28.h),

                      ContactTile(
                        icon: Icons.support_agent_rounded,
                        title: LocaleKeys.settings_contact_us_title.tr(),
                        subtitle: LocaleKeys.settings_contact_us_subtitle.tr(),
                        onTap: launchEmail,
                      ),

                      SettingsTile(
                        iconPath: AppSvgs.privacy,
                        title: LocaleKeys.settings_privacy_policy_title.tr(),
                        subtitle: LocaleKeys.settings_privacy_policy_subtitle
                            .tr(),
                        showSwitch: false,
                        onTap: () => launchPrivacyPolicy(context),
                        showDivider: true,
                      ),

                      SettingsTile(
                        title: LocaleKeys.settings_change_language_title.tr(),
                        icon: Icons.language,
                        onTap: () => AppNavigator.toPageWithCubit(
                          context: context,
                          cubit: splashCubit,
                          screen: ChooseLanguageScreen(back: true),
                        ).then((value) => cubit.refreshState()),
                        showDivider: true,
                        subtitle: LocaleKeys.settings_change_language_subtitle
                            .tr(),
                      ),

                      SettingsTile(
                        title: LocaleKeys.settings_change_theme_title.tr(),
                        icon: isDark ? Icons.dark_mode : Icons.light_mode,
                        onTap: () async =>
                            await cubit.changeTheme(cubit: themeCubit),
                        showDivider: false,
                        subtitle: LocaleKeys.settings_change_language_subtitle
                            .tr(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
