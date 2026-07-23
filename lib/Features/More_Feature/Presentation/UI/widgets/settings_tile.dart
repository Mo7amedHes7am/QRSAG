import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/CustomText.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';

class SettingsTile extends StatelessWidget {
  final String? iconPath;
  final IconData? icon;
  final String title;
  final String subtitle;
  final bool showSwitch;
  final bool switchValue;
  final VoidCallback? onSwitchChanged;
  final VoidCallback? onTap;
  final bool showDivider;

  const SettingsTile({
    super.key,
    this.iconPath,
    required this.title,
    required this.subtitle,
    this.showSwitch = false,
    this.switchValue = false,
    this.onSwitchChanged,
    this.onTap,
    this.showDivider = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? onSwitchChanged,
      child: Container(
        width: 378.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: appColors.textfield,
          border: showDivider
              ? Border(bottom: BorderSide(color: appColors.primary))
              : null,
          borderRadius: showDivider
              ? null
              : BorderRadius.only(
                  bottomRight: Radius.circular(10.sp),
                  bottomLeft: Radius.circular(10.sp),
                ),
        ),
        child: Center(
          child: Row(
            children: [
              icon == null
                  ? SvgPicture.asset(
                      width: 24.sp,
                      height: 24.sp,
                      iconPath!,
                      color: appColors.primary,
                      fit: BoxFit.cover,
                    )
                  : Icon(icon, size: 24.sp, color: appColors.primary),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.x16.medium(title).start.primaryTextColor,
                    CustomText.x14.medium(subtitle).width(260.w).start.grey,
                  ],
                ),
              ),
              if (showSwitch)
                SizedBox(
                  width: 40.sp,
                  height: 40.sp,
                  child: Switch(
                    value: switchValue,
                    thumbColor: WidgetStatePropertyAll(appColors.background),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    inactiveTrackColor: appColors.grey,
                    activeTrackColor: appColors.primary,
                    onChanged: (_) => onSwitchChanged?.call(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
