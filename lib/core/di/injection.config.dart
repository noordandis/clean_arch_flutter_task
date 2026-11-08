// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/product/data/datasourses/product_remote_data_source.dart'
    as _i462;
import '../../features/product/data/repositories/product_repository_impl.dart'
    as _i1040;
import '../../features/product/domain/repositories/product_repositories.dart'
    as _i485;
import '../../features/product/domain/usecases/get_product_usecase.dart'
    as _i467;
import '../../features/product/presentation/cubit/product_cubit.dart' as _i388;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i462.ProductRemoteDataSource>(
      () => _i462.ProductRemoteDataSourceImpl(dio: gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i485.ProductRepositories>(
      () => _i1040.ProductRepositoryImpl(
        remoteDataSource: gh<_i462.ProductRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i467.GetProductUseCase>(
      () =>
          _i467.GetProductUseCase(repository: gh<_i485.ProductRepositories>()),
    );
    gh.factory<_i388.ProductCubit>(
      () => _i388.ProductCubit(gh<_i467.GetProductUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
