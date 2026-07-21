import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Logic/Methods.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Cubit/qr_cubit.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/screens/result_view/result_screen.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/history/delete_dialog.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/Methods/app_Navigation.dart';
import 'package:qr_scanner_and_generator/core/cache/Models/HistoryModel.dart';
import 'package:qr_scanner_and_generator/core/components/global/qr_code.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/CustomText.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    super.key,
    required this.item,
    required this.index,
    required this.isScan,
  });

  final HistoryModel item;
  final int index;
  final bool isScan;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QrCubit>();

    return InkWell(
      onTap: () {
        AppNavigator.toPageWithCubit(
          context: context,
          cubit: cubit,
          screen: ResultScreen(result: item),
        );
      },
      child: Container(
        width: 336.w,
        height: 105.h,
        padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 9.w),
        decoration: BoxDecoration(
          color: appColors.textfield.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(6.sp),
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              QRCodeBox(imgurl: item.img, data: item.data, size: 60),
              SizedBox(width: 15.w),
              _buildItemDetails(context, cubit),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemDetails(BuildContext context, QrCubit cubit) {
    return SizedBox(
      height: 95.sp,
      width: (303.w) - (60.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText.x20
                  .medium(item.data)
                  .start
                  .lines(2)
                  .width(125.w)
                  .primary,
              _buildDeleteButton(context, cubit),
            ],
          ),
          SizedBox(height: 8.h),
          _buildMetadataRow(),
        ],
      ),
    );
  }

  Widget _buildDeleteButton(BuildContext context, QrCubit cubit) {
    return InkWell(
      onTap: () async {
        await showDialog(
          context: context,
          builder: (_) => DeleteDialog(
            onDelete: () async {
              await cubit.deleteHistoryItem(index: index, isScan: isScan);
            },
          ),
        );
      },
      child: Icon(
        Icons.delete_forever,
        size: 24.sp,
        color: CupertinoColors.destructiveRed,
      ),
    );
  }

  Widget _buildMetadataRow() {
    return SizedBox(
      width: (303.w) - (60.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText.x12.medium(item.type).start.primary,
          CustomText.x12.medium(formatDate(item.datesubmitted)).start.primary,
        ],
      ),
    );
  }
}
