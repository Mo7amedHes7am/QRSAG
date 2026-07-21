import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Cubit/qr_cubit.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/screens/result_view/result_view.dart';
import 'package:qr_scanner_and_generator/core/cache/Models/HistoryModel.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.result});

  final HistoryModel result;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<QrCubit>(),
      child: ResultView(result: result),
    );
  }
}
