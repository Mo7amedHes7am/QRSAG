import 'package:flutter/cupertino.dart';
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

class GenerateEventScreen extends StatelessWidget {
  const GenerateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QrCubit>();
    final type = QrType.event;
    cubit.initGenerateTypePage(type, context: context);

    return BlocBuilder<QrCubit, QrState>(
      builder: (context, state) {
        final eventNameController = cubit.eventNameController;
        final eventLocationController = cubit.eventLocationController;
        final eventDescriptionController = cubit.eventDescriptionController;
        final eventStartDateController = cubit.eventStartDateController;
        final eventEndDateController = cubit.eventEndDateController;

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
                          controller: eventNameController,
                          state: state,
                          controllerType: ControllerType.eventName,
                          required: true,
                        ),
                        InputField(
                          type: type,
                          cubit: cubit,
                          controller: eventStartDateController,
                          state: state,
                          controllerType: ControllerType.eventStartDate,
                          required: true,
                        ),
                        InputField(
                          type: type,
                          cubit: cubit,
                          controller: eventEndDateController,
                          state: state,
                          controllerType: ControllerType.eventEndDate,
                          required: true,
                        ),
                        InputField(
                          type: type,
                          cubit: cubit,
                          controller: eventLocationController,
                          state: state,
                          controllerType: ControllerType.eventLocation,
                          required: true,
                        ),
                        InputField(
                          type: type,
                          cubit: cubit,
                          controller: eventDescriptionController,
                          state: state,
                          controllerType: ControllerType.eventDescription,
                        ),

                        SizedBox(height: 52.h),
                        SubmitButton(
                          controllers: [
                            eventNameController,
                            eventStartDateController,
                            eventEndDateController,
                            eventLocationController,
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
