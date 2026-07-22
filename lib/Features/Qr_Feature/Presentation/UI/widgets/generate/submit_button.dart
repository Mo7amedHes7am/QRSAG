import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Cubit/qr_cubit.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/screens/result_view/result_screen.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/Methods/Global_Methods.dart';
import 'package:qr_scanner_and_generator/core/Methods/app_Navigation.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/CustomText.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:qr_scanner_and_generator/generated/locale_keys.g.dart';

Widget SubmitButton({
  required TextEditingController controller,
  required QrCubit cubit,
  required BuildContext context,
}) {
  return InkWell(
    onTap: controller.text.trim().isEmpty
        ? null
        : () async {
            final result = await cubit.generateQr();

            if (result == null) return;

            showToast(LocaleKeys.generate_success.tr(), isError: false);

            AppNavigator.offPageWithCubit(
              context: context,
              cubit: cubit,
              screen: ResultScreen(result: result),
            );
          },
    child: Container(
      padding: EdgeInsets.all(14.sp),
      decoration: BoxDecoration(
        color: controller.text.trim().isEmpty ? Colors.grey : appColors.primary,
        borderRadius: BorderRadius.circular(6.sp),
      ),
      child: Center(
        child: CustomText.x16.medium(LocaleKeys.generate_title.tr()).background,
      ),
    ),
  );
}
