import 'package:injectable/injectable.dart' show factoryMethod, lazySingleton;
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/Mixins/language_mixin.dart';
import 'splash_cubit_base.dart';
export 'splash_cubit_base.dart';

@lazySingleton
class SplashCubit extends SplashCubitBase with LanguageMixin {
  @factoryMethod
  SplashCubit() : super();
}
