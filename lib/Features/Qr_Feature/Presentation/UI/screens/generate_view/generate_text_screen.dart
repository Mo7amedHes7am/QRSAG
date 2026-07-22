import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Data/Models/qrtype.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Cubit/qr_cubit.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/generate/input_field.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/generate/submit_button.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/main_app_bar.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/UI/widgets/background_pattern.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/components/global/system_wrapper.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';

class GenerateTextScreen extends StatelessWidget {
  final QrType type;
  const GenerateTextScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QrCubit>();
    final isArabic = context.locale.languageCode == 'ar';

    cubit.initGenerateTypePage(type);

    return BlocBuilder<QrCubit, QrState>(
      builder: (context, state) {
        final controller = cubit.generateController;

        return SystemWrapper(
          child: SafeArea(
            child: Scaffold(
              backgroundColor: appColors.background,
              appBar: MainAppBar(
                title: isArabic ? type.arlabel : type.enlabel,
                hasBack: true,
                backstyle: 2,
              ),
              body: QRBackgroundPattern(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 151.h, right: 46.w, left: 46.w),
                  child: Column(
                    children: [
                      Container(
                        width: 336.w,
                        padding: EdgeInsets.all(35.sp),
                        decoration: _boxDecoration(),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              type.image,
                              width: 60.sp,
                              height: 60.sp,
                              color: appColors.primary,
                            ),

                            SizedBox(height: 18.h),
                            InputField(
                              type: type,
                              cubit: cubit,
                              controller: controller,
                              state: state,
                            ),
                            SizedBox(height: 52.h),
                            SubmitButton(
                              controller: controller,
                              cubit: cubit,
                              context: context,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: appColors.primaryTextColor.withValues(alpha: 0.3),
      borderRadius: BorderRadius.circular(6.sp),
      border: Border(
        bottom: BorderSide(color: appColors.primary, width: 5.sp),
        top: BorderSide(color: appColors.primary, width: 5.sp),
      ),
    );
  }
}
