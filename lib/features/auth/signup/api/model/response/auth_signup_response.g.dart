// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthSignupResponse _$AuthSignupResponseFromJson(Map<String, dynamic> json) =>
    AuthSignupResponse(
      message: json['message'] as String,
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthSignupResponseToJson(AuthSignupResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
  username: json['username'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  id: json['_id'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'username': instance.username,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'phone': instance.phone,
  '_id': instance.id,
};
