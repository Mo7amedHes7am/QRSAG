import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner_and_generator/core/utils/DI/di.dart';
import '../../Cubit/qr_cubit.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({super.key});

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<QrCubit>(),
      child: BlocConsumer<QrCubit, QrState>(
        listener: (context, state) {
          if (state is QrErrorState) {}
        },
        builder: (context, state) {
          return Placeholder();
        },
      ),
    );
  }
}
