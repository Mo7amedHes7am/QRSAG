import 'package:hive/hive.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Cubit/qr_cubit_base.dart';
import 'package:qr_scanner_and_generator/core/cache/Models/HistoryModel.dart';
import 'package:qr_scanner_and_generator/core/cache/cache_manager.dart';

mixin HistoryMixin on QrCubitBase {
  List<HistoryModel> scanHistory = [];
  List<HistoryModel> generateHistory = [];

  void loadHistory() {
    scanHistory = CacheManager.getScanHistory();
    generateHistory = CacheManager.getGenerateHistory();

    _sortHistory();
    emit(QrHistoryLoaded());
  }

  void _sortHistory() {
    scanHistory.sort((a, b) => b.datesubmitted.compareTo(a.datesubmitted));
    generateHistory.sort((a, b) => b.datesubmitted.compareTo(a.datesubmitted));
  }

  Future<void> deleteHistoryItem({
    required int index,
    required bool isScan,
  }) async {
    final box = Hive.box<HistoryModel>(
      isScan ? 'historyCache' : 'generateCache',
    );

    final list = isScan ? scanHistory : generateHistory;

    await box.deleteAt(list.length - index - 1);

    loadHistory();
  }
}
