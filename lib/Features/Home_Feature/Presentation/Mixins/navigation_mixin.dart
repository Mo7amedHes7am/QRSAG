import 'package:qr_scanner_and_generator/Features/Home_Feature/Presentation/Cubit/home_cubit_base.dart';

mixin NavigationMixin on HomeCubitBase {
  void changeTab(int index) {
    selected = index;
    if (!isClosed) emit(TabChangedState());
  }
}
