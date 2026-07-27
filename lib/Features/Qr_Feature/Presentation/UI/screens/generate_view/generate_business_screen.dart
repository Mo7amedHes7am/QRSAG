import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Data/Models/controllertype.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Data/Models/qrtype.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Cubit/qr_cubit.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/generate/generate_background.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/generate/input_field.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/generate/submit_button.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/main_app_bar.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/UI/widgets/background_pattern.dart';
import 'package:qr_scanner_and_generator/core/components/global/system_wrapper.dart';

class GenerateBusinessScreen extends StatefulWidget {
  const GenerateBusinessScreen({super.key});

  @override
  State<GenerateBusinessScreen> createState() => _GenerateBusinessScreenState();
}

class _GenerateBusinessScreenState extends State<GenerateBusinessScreen> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QrCubit>();
    final type = QrType.business;

    cubit.initGenerateTypePage(type);

    return BlocBuilder<QrCubit, QrState>(
      builder: (context, state) {
        final industryController = cubit.industryController;
        final companyController = cubit.companyController;
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
              title: type.getLabelFromContext(context),
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
                          controller: companyController,
                          state: state,
                          controllerType: ControllerType.company,
                          required: true,
                        ),
                        InputField(
                          type: type,
                          cubit: cubit,
                          controller: industryController,
                          state: state,
                          controllerType: ControllerType.industry,
                          required: true,
                        ),
                        InputField(
                          type: type,
                          cubit: cubit,
                          controller: phoneController,
                          state: state,
                          controllerType: ControllerType.phone,
                          required: true,
                        ),
                        InputField(
                          type: type,
                          cubit: cubit,
                          controller: emailController,
                          state: state,
                          controllerType: ControllerType.email,
                          required: true,
                        ),
                        InputField(
                          type: type,
                          cubit: cubit,
                          controller: websiteController,
                          state: state,
                          controllerType: ControllerType.website,
                        ),
                        InputField(
                          type: type,
                          cubit: cubit,
                          controller: addressController,
                          state: state,
                          controllerType: ControllerType.address,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InputField(
                              width: 128.w,
                              type: type,
                              cubit: cubit,
                              controller: cityController,
                              state: state,
                              controllerType: ControllerType.city,
                            ),
                            InputField(
                              width: 128.w,
                              type: type,
                              cubit: cubit,
                              controller: countryController,
                              state: state,
                              controllerType: ControllerType.country,
                            ),
                          ],
                        ),

                        SizedBox(height: 52.h),
                        SubmitButton(
                          controllers: [
                            companyController,
                            industryController,
                            phoneController,
                            emailController,
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
