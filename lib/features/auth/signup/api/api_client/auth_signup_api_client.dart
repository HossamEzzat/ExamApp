import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/request/auth_signup_request.dart';
import '../model/response/auth_signup_response.dart';

part 'auth_signup_api_client.g.dart';

@RestApi(baseUrl: 'https://exam.elevateegy.com/api/v1/')
abstract class AuthSignupApiClient {
  factory AuthSignupApiClient(Dio dio, {String baseUrl}) = _AuthSignupApiClient;

  @POST('auth/signup')
  Future<AuthSignupResponse> signup(@Body() AuthSignupRequest request);
}