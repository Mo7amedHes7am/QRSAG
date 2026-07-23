import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/settings_button.dart';
import 'package:qr_scanner_and_generator/core/components/global/back_button.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/CustomText.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasBack;
  final BuildContext context;
  final int? backstyle;
  final int? pageIndex;
  final VoidCallback? customback;
  const MainAppBar({
    super.key,
    required this.title,
    required this.hasBack,
    required this.context,
    this.backstyle,
    this.pageIndex,
    this.customback,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      foregroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      title: CustomText.x28.medium(title).primaryTextColor,
      leadingWidth: hasBack ? 100.w : null,
      leading: hasBack
          ? Row(
              children: [
                SizedBox(width: 46.w),
                Center(
                  child: Back_Button(
                    onTap: customback,
                    context: context,
                    style: backstyle!,
                    size: 40,
                  ),
                ),
              ],
            )
          : null,
      actions: hasBack
          ? null
          : [
              SettingsButton(context: context, pageIndex: pageIndex),
              SizedBox(width: 20.w),
            ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
