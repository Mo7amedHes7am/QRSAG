import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner_and_generator/core/utils/DI/di.dart';
import '../../Cubit/more_cubit.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MoreCubit>(),
      child: BlocConsumer<MoreCubit, MoreState>(
        listener: (context, state) {
          if (state is MoreErrorState) {}
        },
        builder: (context, state) {
          return Placeholder();
        },
      ),
    );
  }
}
