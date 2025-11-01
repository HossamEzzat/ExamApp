import 'package:json_annotation/json_annotation.dart';

part 'auth_signup_request.g.dart';

@JsonSerializable()
class AuthSignupRequest {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String rePassword;
  final String phone;

  AuthSignupRequest({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
  });

  Map<String, dynamic> toJson() => _$AuthSignupRequestToJson(this);
}