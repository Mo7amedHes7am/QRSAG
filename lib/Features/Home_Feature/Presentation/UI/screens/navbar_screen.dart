import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner_and_generator/Features/Home_Feature/Presentation/UI/widgets/navbar_tab.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/components/global/system_wrapper.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:qr_scanner_and_generator/generated/locale_keys.g.dart';
import '../../Cubit/home_cubit.dart';
import 'package:qr_scanner_and_generator/core/utils/DI/di.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({super.key});

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeErrorState) {}
        },
        builder: (context, state) {
          final _cubit = context.read<HomeCubit>();
          return SystemWrapper(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  Positioned.fill(child: _cubit.Pages[_cubit.selected]),
                  Positioned(
                    left: 46.w,
                    right: 46.w,
                    bottom: 33.h,
                    child: Container(
                      height: 67.h,
                      decoration: BoxDecoration(
                        color: appColors.textfield,
                        borderRadius: BorderRadius.circular(6.sp),
                        border: Border.all(color: appColors.primary),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            NavbarTab(
                              label: LocaleKeys.navbar_generate.tr(),
                              icon: Icons.qr_code_2_rounded,
                              onSelected: () => _cubit.changeTab(0),
                              isCenter: false,
                              isSelected: _cubit.selected == 0,
                            ),
                            NavbarTab(
                              label: "",
                              icon: Icons.qr_code_scanner_rounded,
                              onSelected: () => _cubit.changeTab(1),
                              isCenter: true,
                              isSelected: _cubit.selected == 1,
                            ),
                            NavbarTab(
                              label: LocaleKeys.navbar_history.tr(),
                              icon: Icons.history,
                              onSelected: () => _cubit.changeTab(2),
                              isCenter: false,
                              isSelected: _cubit.selected == 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
