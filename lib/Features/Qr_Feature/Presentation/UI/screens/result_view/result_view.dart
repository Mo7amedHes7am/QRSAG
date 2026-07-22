import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Logic/Methods.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Cubit/qr_cubit.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/URLMessage.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/action_button.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/main_app_bar.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/Methods/Global_Methods.dart';
import 'package:qr_scanner_and_generator/core/cache/Models/HistoryModel.dart';
import 'package:qr_scanner_and_generator/core/components/global/qr_code.dart';
import 'package:qr_scanner_and_generator/core/components/global/system_wrapper.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/CustomText.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/loading.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:qr_scanner_and_generator/generated/locale_keys.g.dart';

class ResultView extends StatelessWidget {
  final HistoryModel result;

  ResultView({super.key, required this.result});

  final GlobalKey repaintKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QrCubit, QrState>(
      listenWhen: (_, state) => state is QrResultActionState,
      listener: (context, state) {
        if (state is QrSaveSuccessState) {
          showToast('${LocaleKeys.result_saved_to.tr()} ${state.path}');
        } else if (state is QrActionErrorState) {
          showToast(
            '${LocaleKeys.result_error.tr()} ${state.message}',
            isError: true,
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is QrActionLoadingState;
        final bool hasUrls = hasURLs(result.data);
        final isArabic = context.locale.languageCode == 'ar';
        return SystemWrapper(
          child: SafeArea(
            bottom: false,
            left: false,
            right: false,
            top: true,
            child: LoadingScaffold(
              loading: isLoading,
              child: Scaffold(
                backgroundColor: appColors.background,
                appBar: MainAppBar(
                  title: LocaleKeys.result_qr_code.tr(),
                  hasBack: true,
                  backstyle: 1,
                ),
                body: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 29.h, right: 46.w, left: 46.w),
                  child: Column(
                    children: [
                      Container(
                        width: 336.w,
                        padding: EdgeInsets.symmetric(
                          vertical: 14.h,
                          horizontal: 14.w,
                        ),
                        decoration: BoxDecoration(
                          color: appColors.primaryTextColor.withValues(
                            alpha: 0.3,
                          ),
                          borderRadius: BorderRadius.circular(6.sp),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText.x20
                                .medium(
                                  isArabic ? result.arlabel : result.enlabel,
                                )
                                .start
                                .primaryTextColor,
                            SizedBox(height: 9.h),
                            SizedBox(
                              width: 336.w - 28.w,
                              child: hasUrls
                                  ? UrlMessage(
                                      textContent: result.data,
                                      textColor: appColors.primary,
                                      isMyMessage: true,
                                    )
                                  : CustomText.x14
                                        .medium(parseQrData(result.data))
                                        .primaryTextColor,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 57.h),

                      QRCodeBox(
                        imgurl: result.img,
                        data: result.data,
                        size: 181,
                        repaintKey: repaintKey,
                      ),

                      SizedBox(height: 40.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ActionButton(
                            icon: Icons.share,
                            onTap: isLoading
                                ? null
                                : () => context.read<QrCubit>().shareQrCode(
                                    repaintKey: repaintKey,
                                    qrData: result.data,
                                  ),
                          ),
                          SizedBox(width: 23.w),
                          ActionButton(
                            icon: Icons.save,
                            onTap: isLoading
                                ? null
                                : () => context.read<QrCubit>().saveQrCode(
                                    repaintKey: repaintKey,
                                  ),
                          ),
                        ],
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
}
