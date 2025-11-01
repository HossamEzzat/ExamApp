import 'package:json_annotation/json_annotation.dart';

part 'auth_signup_response.g.dart';

@JsonSerializable()
class AuthSignupResponse {
  final String message;
  final String? token;
  final User? user;

  AuthSignupResponse({
    required this.message,
    this.token,
    this.user,
  });

  factory AuthSignupResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthSignupResponseFromJson(json);
}

@JsonSerializable()
class User {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  @JsonKey(name: '_id')
  final String? id;

  User({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}