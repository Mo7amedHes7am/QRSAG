import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/CustomText.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:qr_scanner_and_generator/generated/locale_keys.g.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({super.key, required this.onDelete});

  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: appColors.background,
      title: CustomText.x24
          .medium(LocaleKeys.history_delete_confirm.tr())
          .primary,
      content: CustomText.x18
          .medium(LocaleKeys.history_delete_warning.tr())
          .primaryTextColor,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDeleteButton(context),
            SizedBox(width: 23.w),
            _buildCancelButton(context),
          ],
        ),
      ],
    );
  }

  Widget _buildDeleteButton(BuildContext context) {
    return InkWell(
      onTap: () {
        onDelete();
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.all(14.sp),
        decoration: BoxDecoration(
          color: CupertinoColors.destructiveRed,
          borderRadius: BorderRadius.circular(6.sp),
        ),
        child: Center(
          child: CustomText.x20
              .medium(LocaleKeys.common_remove.tr())
              .background,
        ),
      ),
    );
  }

  Widget _buildCancelButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.all(14.sp),
        decoration: BoxDecoration(
          border: Border.all(color: appColors.primary),
          color: appColors.background,
          borderRadius: BorderRadius.circular(6.sp),
        ),
        child: Center(
          child: CustomText.x20
              .medium(LocaleKeys.common_cancel.tr())
              .primaryTextColor,
        ),
      ),
    );
  }
}
