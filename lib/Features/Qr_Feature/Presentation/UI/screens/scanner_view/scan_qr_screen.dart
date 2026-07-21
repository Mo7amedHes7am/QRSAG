import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Cubit/qr_cubit.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/screens/result_view/result_screen.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/screens/scanner_view/scanner_overlay.dart';
import 'package:qr_scanner_and_generator/core/Methods/Global_Methods.dart';
import 'package:qr_scanner_and_generator/core/Methods/app_Navigation.dart';
import 'package:qr_scanner_and_generator/core/components/global/system_wrapper.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/loading.dart';
import 'package:qr_scanner_and_generator/core/utils/DI/di.dart';

import 'scanner_view.dart';

class ScanQrScreen extends StatelessWidget {
  const ScanQrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<QrCubit>()..init(),
      child: BlocConsumer<QrCubit, QrState>(
        listener: (context, state) {
          if (state is QrScannedState) {
            AppNavigator.toPageWithCubit(
              context: context,
              cubit: context.read<QrCubit>(),
              screen: ResultScreen(result: state.historyData),
            );
          } else if (state is QrErrorState) {
            showToast(state.error, isError: true);
          }
        },
        builder: (context, state) {
          final cubit = context.read<QrCubit>();

          return SystemWrapper(
            child: LoadingScaffold(
              loading: state is QrLoadingState,
              child: Scaffold(
                backgroundColor: Colors.black,
                body: Stack(
                  children: [
                    ScannerView(cubit: cubit),

                    const ScannerOverlay(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
