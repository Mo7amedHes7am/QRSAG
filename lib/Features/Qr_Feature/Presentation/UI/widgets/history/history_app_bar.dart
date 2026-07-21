import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/CustomText.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:qr_scanner_and_generator/generated/locale_keys.g.dart';

class HistoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HistoryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      foregroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      title: CustomText.x28
          .medium(LocaleKeys.navbar_history.tr())
          .primaryTextColor,
      actions: [
        InkWell(
          onTap: () {
            //Settings in Next Update
          },
          child: Container(
            width: 40.sp,
            height: 40.sp,
            decoration: BoxDecoration(
              color: appColors.background,
              borderRadius: BorderRadius.circular(8.sp),
              boxShadow: [
                BoxShadow(
                  color: appColors.primary.withValues(alpha: 0.3),
                  spreadRadius: 5.sp,
                  blurRadius: 7.sp,
                  offset: const Offset(3, 3),
                ),
              ],
            ),
            child: Center(
              child: Icon(
                Icons.settings_outlined,
                color: appColors.primaryTextColor,
                size: 24.sp,
              ),
            ),
          ),
        ),
        SizedBox(width: 20.w),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
