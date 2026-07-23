import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Data/Models/controllertype.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Data/Models/qrtype.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Cubit/qr_cubit.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/generate/encryption_option.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/generate/generate_background.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/generate/input_field.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/generate/submit_button.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/main_app_bar.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/UI/widgets/background_pattern.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/components/global/system_wrapper.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/CustomText.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:qr_scanner_and_generator/generated/locale_keys.g.dart';

class GenerateWifiScreen extends StatelessWidget {
  const GenerateWifiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QrCubit>();
    final type = QrType.wifi;
    final isArabic = context.locale.languageCode == 'ar';

    cubit.initGenerateTypePage(type);

    return BlocBuilder<QrCubit, QrState>(
      builder: (context, state) {
        final wifiNameController = cubit.wifiNameController;
        final wifiPasswordController = cubit.wifiPasswordController;
        final hidden = cubit.hidden;
        final encryption = cubit.encryption;
        final showPassword = cubit.showPassword;

        return SystemWrapper(
          child: Scaffold(
            backgroundColor: appColors.background,
            appBar: MainAppBar(
              context: context,
              title: isArabic ? type.arlabel : type.enlabel,
              hasBack: true,
              backstyle: 1,
            ),
            body: QRBackgroundPattern(
              child: Center(
                child: SingleChildScrollView(
                  child: GenerateBackground(
                    type: type,
                    child: Column(
                      children: [
                        SizedBox(height: 18.h),

                        InputField(
                          type: type,
                          cubit: cubit,
                          controller: wifiNameController,
                          state: state,
                          controllertype: ControllerType.wifiName,
                        ),

                        Row(
                          children: [
                            Checkbox(
                              value: hidden,
                              onChanged: (value) {
                                cubit.toggleHidden();
                              },
                              fillColor: WidgetStatePropertyAll(
                                hidden ? appColors.primary : Colors.transparent,
                              ),
                              checkColor: Colors.white,
                              activeColor: appColors.primary,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              side: BorderSide(
                                color: appColors.primary,
                                width: 2.sp,
                              ),
                            ),
                            CustomText.x14
                                .medium(LocaleKeys.generate_wifi_hidden.tr())
                                .start
                                .color(
                                  hidden
                                      ? appColors.primary
                                      : appColors.primaryTextColor,
                                ),
                          ],
                        ),

                        if (showPassword) ...[
                          InputField(
                            type: type,
                            cubit: cubit,
                            controller: wifiPasswordController,
                            state: state,
                            controllertype: ControllerType.wifiPassword,
                          ),
                        ],

                        SizedBox(height: 18.h),

                        CustomText.x14
                            .medium(LocaleKeys.generate_wifi_encryption.tr())
                            .start
                            .width(MediaQuery.sizeOf(context).width)
                            .primaryTextColor,

                        SizedBox(height: 8.h),

                        Row(
                          children: [
                            EncryptionOption(
                              context: context,
                              value: 0,
                              label: LocaleKeys.generate_wifi_encryption_none
                                  .tr(),
                              currentValue: encryption,
                              onChanged: (val) {
                                cubit.setEncryption(val);
                              },
                              cubit: cubit,
                            ),
                            EncryptionOption(
                              context: context,
                              value: 1,
                              label: LocaleKeys.generate_wifi_encryption_wpa
                                  .tr(),
                              currentValue: encryption,
                              onChanged: (val) {
                                cubit.setEncryption(val);
                              },
                              cubit: cubit,
                            ),
                            EncryptionOption(
                              context: context,
                              value: 2,
                              label: LocaleKeys.generate_wifi_encryption_wep
                                  .tr(),
                              currentValue: encryption,
                              onChanged: (val) {
                                cubit.setEncryption(val);
                              },
                              cubit: cubit,
                            ),
                          ],
                        ),

                        SizedBox(height: 52.h),

                        SubmitButton(
                          controllers: [
                            wifiNameController,
                            if (showPassword) wifiPasswordController,
                          ],
                          cubit: cubit,
                          context: context,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
