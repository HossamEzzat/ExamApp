import '../../../api/model/request/auth_signup_request.dart';
import '../../../api/model/response/auth_signup_response.dart';

abstract class AuthSignupRemoteDatasourceContract {
  Future<AuthSignupResponse> signup(AuthSignupRequest request);
}