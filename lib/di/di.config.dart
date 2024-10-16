// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/contracts/auth/AuthOfflineDataSource.dart' as _i123;
import '../data/contracts/auth/AuthOnlineDataSource.dart' as _i7;
import '../data/contracts/core/ApiManager.dart' as _i345;
import '../data/datasource/auth/authdatasource.dart' as _i133;
import '../data/datasource/auth/AuthOfflineDatasourceImpl.dart' as _i655;
import '../data/datasource/auth/AuthOnlineDatasourceImpl.dart' as _i133;
import '../data/repsitory/auth/AuthRepoImpl.dart' as _i931;
import '../domain/repository/AuthRepository.dart' as _i722;
import '../domain/usecase/authusecase.dart' as _i109;
import '../presentation/cubit/cubit/auth_cubit.dart' as _i765;

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
    gh.lazySingleton<_i345.ApiManager>(() => _i345.ApiManager());
    gh.factory<_i765.AuthCubit>(() => _i765.AuthCubit(gh<_i109.AuthUsecase>()));
    gh.factory<_i123.AuthOfflineDatasource>(
        () => _i655.AuthOfflineDatasourceImpl());
    gh.factory<_i7.AuthOnlineDatasource>(
        () => _i133.AuthOnlineDatasourceImpl(gh<_i345.ApiManager>()));
    gh.factory<_i722.AuthRepository>(
        () => _i931.AuthRepositoryImpl(gh<_i133.AuthDataSource>()));
    gh.factory<_i109.AuthUsecase>(
        () => _i109.AuthUsecase(authRepo: gh<_i722.AuthRepository>()));
    return this;
  }
}
