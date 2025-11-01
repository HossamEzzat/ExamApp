import 'package:injectable/injectable.dart';

import '../../api/model/request/auth_signup_request.dart';
import '../../api/model/response/auth_signup_response.dart';
import '../repo/auth_signup_repo_contract.dart';

@lazySingleton
class AuthSignupUseCase {
  final AuthSignupRepoContract _repo;

  AuthSignupUseCase(this._repo);

  Future<AuthSignupResponse> call(AuthSignupRequest request) async {
    return await _repo.signup(request);
  }
}