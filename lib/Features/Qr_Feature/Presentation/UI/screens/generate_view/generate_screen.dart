import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Cubit/qr_cubit.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/generate/generate_type.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/main_app_bar.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/components/global/system_wrapper.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:qr_scanner_and_generator/core/utils/DI/di.dart';
import 'package:qr_scanner_and_generator/generated/locale_keys.g.dart';

class GenerateScreen extends StatelessWidget {
  const GenerateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<QrCubit>()..initGeneratePage(),
      child: BlocBuilder<QrCubit, QrState>(
        builder: (context, state) {
          final qrs = context.read<QrCubit>().qrs;
          return SystemWrapper(
            child: Scaffold(
              backgroundColor: appColors.background,
              appBar: MainAppBar(
                context: context,
                title: LocaleKeys.generate_title.tr(),
                hasBack: false,
                pageIndex: 0,
              ),
              extendBody: false,
              body: SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: GridView.builder(
                    padding: EdgeInsets.only(
                      left: 42.w,
                      right: 42.w,
                      bottom: 20.h,
                      top: 52.h,
                    ),
                    itemCount: qrs.length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 86.sp,
                      crossAxisSpacing: 43.sp,
                      mainAxisSpacing: 43.sp,
                    ),
                    shrinkWrap: true,
                    itemBuilder: (_, index) =>
                        Generatetype(type: qrs[index], context: context),
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
