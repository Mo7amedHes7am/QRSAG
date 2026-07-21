import 'package:injectable/injectable.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Cubit/qr_cubit_base.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Mixins/generate_mixin.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Mixins/history_mixin.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Mixins/scan_mixin.dart';
export 'qr_cubit_base.dart';

@injectable
class QrCubit extends QrCubitBase with GenerateMixin, HistoryMixin, ScanMixin {
  @factoryMethod
  QrCubit() : super();
}
