import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Data/Models/controllertype.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Data/Models/qrtype.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Cubit/qr_cubit.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/generate/generate_background.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/generate/input_field.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/generate/submit_button.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/main_app_bar.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/UI/widgets/background_pattern.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/components/global/system_wrapper.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';

class GenerateContactScreen extends StatelessWidget {
  const GenerateContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QrCubit>();
    final isArabic = context.locale.languageCode == 'ar';
    final type = QrType.contact;

    cubit.initGenerateTypePage(type);

    return BlocBuilder<QrCubit, QrState>(
      builder: (context, state) {
        final firstnameController = cubit.firstnameController;
        final lastnameController = cubit.lastnameController;
        final companyController = cubit.companyController;
        final jobController = cubit.jobController;
        final phoneController = cubit.phoneController;
        final emailController = cubit.emailController;
        final websiteController = cubit.websiteController;
        final addressController = cubit.addressController;
        final cityController = cubit.cityController;
        final countryController = cubit.countryController;

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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InputField(
                              type: type,
                              cubit: cubit,
                              controller: firstnameController,
                              state: state,
                              width: 128,
                              controllertype: ControllerType.firstname,
                            ),
                            InputField(
                              type: type,
                              cubit: cubit,
                              controller: lastnameController,
                              state: state,
                              width: 128,
                              controllertype: ControllerType.lastname,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InputField(
                              type: type,
                              cubit: cubit,
                              controller: companyController,
                              state: state,
                              width: 128,
                              controllertype: ControllerType.company,
                            ),
                            InputField(
                              type: type,
                              cubit: cubit,
                              controller: jobController,
                              state: state,
                              width: 128,
                              controllertype: ControllerType.job,
                            ),
                          ],
                        ),
                        InputField(
                          type: type,
                          cubit: cubit,
                          controller: phoneController,
                          state: state,
                          controllertype: ControllerType.phone,
                        ),
                        InputField(
                          type: type,
                          cubit: cubit,
                          controller: emailController,
                          state: state,
                          controllertype: ControllerType.email,
                        ),
                        InputField(
                          type: type,
                          cubit: cubit,
                          controller: websiteController,
                          state: state,
                          controllertype: ControllerType.website,
                        ),
                        InputField(
                          type: type,
                          cubit: cubit,
                          controller: addressController,
                          state: state,
                          controllertype: ControllerType.address,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InputField(
                              type: type,
                              cubit: cubit,
                              controller: cityController,
                              state: state,
                              width: 128,
                              controllertype: ControllerType.city,
                            ),
                            InputField(
                              type: type,
                              cubit: cubit,
                              controller: countryController,
                              state: state,
                              width: 128,
                              controllertype: ControllerType.country,
                            ),
                          ],
                        ),

                        SizedBox(height: 52.h),
                        SubmitButton(
                          controllers: [
                            firstnameController,
                            lastnameController,
                            phoneController,
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
