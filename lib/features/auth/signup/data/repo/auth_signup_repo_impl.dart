import 'package:injectable/injectable.dart';

import '../../api/model/request/auth_signup_request.dart';
import '../../api/model/response/auth_signup_response.dart';
import '../../domain/repo/auth_signup_repo_contract.dart';
import '../datasource/remote/auth_signup_remote_datasource_contract.dart';

@Injectable(as: AuthSignupRepoContract)
class AuthSignupRepoImpl implements AuthSignupRepoContract {
  final AuthSignupRemoteDatasourceContract _remoteDatasource;

  AuthSignupRepoImpl(this._remoteDatasource);

  @override
  Future<AuthSignupResponse> signup(AuthSignupRequest request) async {
    return await _remoteDatasource.signup(request);
  }
}