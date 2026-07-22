import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Cubit/qr_cubit.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/main_app_bar.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/history/history_list.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/components/global/system_wrapper.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/custom_tab_bar.dart';
import 'package:qr_scanner_and_generator/core/utils/DI/di.dart';
import 'package:qr_scanner_and_generator/generated/locale_keys.g.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<QrCubit>()..loadHistory(),
      child: BlocBuilder<QrCubit, QrState>(
        builder: (context, state) {
          final cubit = context.read<QrCubit>();

          return SystemWrapper(
            child: SafeArea(
              child: Scaffold(
                backgroundColor: appColors.background,
                appBar: MainAppBar(
                  title: LocaleKeys.navbar_history.tr(),
                  hasBack: false,
                ),
                body: CustomTabBar(
                  context: context,
                  Screen1: SingleChildScrollView(
                    child: HistoryList(
                      historyList: cubit.scanHistory,
                      isScan: true,
                    ),
                  ),
                  Screen2: HistoryList(
                    historyList: cubit.generateHistory,
                    isScan: false,
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
