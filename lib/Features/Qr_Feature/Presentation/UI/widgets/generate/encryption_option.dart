import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Cubit/qr_cubit.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/CustomText.dart';

Widget EncryptionOption({
  required BuildContext context,
  required int value,
  required String label,
  required int currentValue,
  required ValueChanged<int> onChanged,
  required QrCubit cubit,
}) {
  return InkWell(
    onTap: () => onChanged(value),
    child: Row(
      children: [
        Radio<int>(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          fillColor: WidgetStatePropertyAll(
            currentValue == value ? appColors.primary : Colors.grey,
          ),
          activeColor: appColors.primary,
          value: value,
          groupValue: currentValue,
          onChanged: (val) {
            if (val != null) {
              onChanged(val);
            }
          },
        ),
        CustomText.x12
            .medium(label)
            .start
            .color(
              currentValue == value
                  ? appColors.primary
                  : appColors.primaryTextColor,
            ),
      ],
    ),
  );
}
