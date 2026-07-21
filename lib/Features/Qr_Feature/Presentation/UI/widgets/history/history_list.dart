import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/core/cache/Models/HistoryModel.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:qr_scanner_and_generator/generated/locale_keys.g.dart';

import 'history_item.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({
    super.key,
    required this.historyList,
    required this.isScan,
  });

  final List<HistoryModel> historyList;
  final bool isScan;

  @override
  Widget build(BuildContext context) {
    if (historyList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.history, size: 80.sp, color: Colors.grey[400]),
            SizedBox(height: 16.h),
            Text(
              isScan
                  ? LocaleKeys.history_no_scan_history.tr()
                  : LocaleKeys.history_no_generate_history.tr(),
              style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      itemCount: historyList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemBuilder: (context, index) {
        final item = historyList[index];
        return Center(
          child: HistoryItem(item: item, index: index, isScan: isScan),
        );
      },
    );
  }
}
