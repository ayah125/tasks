// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../features/authFeature/data/contracts/core/ApiManager.dart' as _i915;
import '../features/authFeature/data/datasource/auth/authdatasource.dart'
    as _i354;
import '../features/authFeature/data/datasource/auth/authDataSourceImpl.dart'
    as _i198;
import '../features/authFeature/data/repsitory/auth/AuthRepoImpl.dart' as _i2;
import '../features/authFeature/domain/repository/AuthRepository.dart' as _i638;
import '../features/authFeature/domain/usecase/authusecase.dart' as _i960;
import '../features/authFeature/presentation/cubit/cubit/auth_cubit.dart'
    as _i840;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i915.ApiManager>(() => _i915.ApiManager());
    gh.factory<_i354.AuthDataSource>(
        () => _i198.AuthDataSourceImpl(gh<_i915.ApiManager>()));
    gh.factory<_i638.AuthRepository>(
        () => _i2.AuthRepositoryImpl(gh<_i354.AuthDataSource>()));
    gh.factory<_i960.AuthUsecase>(
        () => _i960.AuthUsecase(authRepo: gh<_i638.AuthRepository>()));
    gh.factory<_i840.AuthCubit>(() => _i840.AuthCubit(gh<_i960.AuthUsecase>()));
    return this;
  }
}
