import 'package:injectable/injectable.dart';
import 'package:qr_scanner_and_generator/Features/Home_Feature/Presentation/Cubit/home_cubit_base.dart';
import 'package:qr_scanner_and_generator/Features/Home_Feature/Presentation/Mixins/navigation_mixin.dart';
export 'home_cubit_base.dart';

@injectable
class HomeCubit extends HomeCubitBase with NavigationMixin {
  @factoryMethod
  HomeCubit() : super();
}
