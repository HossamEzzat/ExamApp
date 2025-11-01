// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_signup_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthSignupRequest _$AuthSignupRequestFromJson(Map<String, dynamic> json) =>
    AuthSignupRequest(
      username: json['username'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      rePassword: json['rePassword'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$AuthSignupRequestToJson(AuthSignupRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'rePassword': instance.rePassword,
      'phone': instance.phone,
    };
