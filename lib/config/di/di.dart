import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';


import '../../features/auth/signup/api/api_client/auth_signup_api_client.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() {
  getIt.init();

  // Manually register AuthSignupApiClient
  getIt.registerFactory<AuthSignupApiClient>(
        () => AuthSignupApiClient(getIt.get()),
  );
}