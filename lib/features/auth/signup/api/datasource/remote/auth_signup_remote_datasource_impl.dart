import 'package:injectable/injectable.dart';

import '../../../data/datasource/remote/auth_signup_remote_datasource_contract.dart';
import '../../api_client/auth_signup_api_client.dart';
import '../../model/request/auth_signup_request.dart';
import '../../model/response/auth_signup_response.dart';


@Injectable(as: AuthSignupRemoteDatasourceContract)
class AuthSignupRemoteDatasourceImpl implements AuthSignupRemoteDatasourceContract {
  final AuthSignupApiClient _apiClient;

  AuthSignupRemoteDatasourceImpl(this._apiClient);

  @override
  Future<AuthSignupResponse> signup(AuthSignupRequest request) async {
    return await _apiClient.signup(request);
  }
}