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

import '../../features/auth/login/api/api_client/auth_login_api_client.dart'
    as _i214;
import '../../features/auth/login/api/datasource/remote/auth_login_remote_datasource_impl.dart'
    as _i165;
import '../../features/auth/login/data/datasource/remote/auth_login_remote_datasource_contract.dart'
    as _i612;
import '../../features/auth/login/data/repo/auth_login_repo_impl.dart' as _i253;
import '../../features/auth/login/domain/repo/auth_login_repo_contract.dart'
    as _i568;
import '../../features/auth/login/domain/usecase/auth_login_usecase.dart'
    as _i122;
import '../../features/auth/login/presentation/login_viewmodel/login_view_model.dart'
    as _i688;
import '../../features/auth/signup/api/api_client/auth_signup_api_client.dart'
    as _i710;
import '../../features/auth/signup/api/datasource/remote/auth_signup_remote_datasource_impl.dart'
    as _i3;
import '../../features/auth/signup/data/datasource/remote/auth_signup_remote_datasource_contract.dart'
    as _i1072;
import '../../features/auth/signup/data/repo/auth_signup_repo_impl.dart'
    as _i679;
import '../../features/auth/signup/domain/repo/auth_signup_repo_contract.dart'
    as _i49;
import '../../features/auth/signup/domain/usecase/auth_signup_usecase.dart'
    as _i583;
import '../../features/auth/signup/presentation/signup_viewmodel/signup_view_model.dart'
    as _i385;
import '../modules/dio_module/dio_module.dart' as _i624;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.factory<_i214.AuthLoginApiClient>(
      () => _i214.AuthLoginApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i1072.AuthSignupRemoteDatasourceContract>(
      () => _i3.AuthSignupRemoteDatasourceImpl(gh<_i710.AuthSignupApiClient>()),
    );
    gh.factory<_i612.AuthLoginRemoteDatasourceContract>(
      () => _i165.AuthLoginRemoteDatasourceImpl(gh<_i214.AuthLoginApiClient>()),
    );
    gh.factory<_i568.AuthLoginRepoContract>(
      () => _i253.AuthLoginRepoImpl(
        gh<_i612.AuthLoginRemoteDatasourceContract>(),
      ),
    );
    gh.lazySingleton<_i122.AuthLoginUseCase>(
      () => _i122.AuthLoginUseCase(gh<_i568.AuthLoginRepoContract>()),
    );
    gh.factory<_i49.AuthSignupRepoContract>(
      () => _i679.AuthSignupRepoImpl(
        gh<_i1072.AuthSignupRemoteDatasourceContract>(),
      ),
    );
    gh.lazySingleton<_i583.AuthSignupUseCase>(
      () => _i583.AuthSignupUseCase(gh<_i49.AuthSignupRepoContract>()),
    );
    gh.factory<_i688.LoginViewModel>(
      () => _i688.LoginViewModel(gh<_i122.AuthLoginUseCase>()),
    );
    gh.factory<_i385.SignupViewModel>(
      () => _i385.SignupViewModel(gh<_i583.AuthSignupUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i624.DioModule {}
