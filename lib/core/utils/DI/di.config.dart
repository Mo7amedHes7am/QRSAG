// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../Features/Home_Feature/Presentation/Cubit/home_cubit.dart'
    as _i631;
import '../../../Features/More_Feature/Presentation/Cubit/more_cubit.dart'
    as _i536;
import '../../../Features/Qr_Feature/Presentation/Cubit/qr_cubit.dart' as _i304;
import '../../../Features/Splash_Feature/Presentation/Cubit/splash_cubit.dart'
    as _i884;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i631.HomeCubit>(() => _i631.HomeCubit());
    gh.lazySingleton<_i536.MoreCubit>(() => _i536.MoreCubit());
    gh.lazySingleton<_i304.QrCubit>(() => _i304.QrCubit());
    gh.lazySingleton<_i884.SplashCubit>(() => _i884.SplashCubit());
    return this;
  }
}
