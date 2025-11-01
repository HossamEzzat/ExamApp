import 'package:freezed_annotation/freezed_annotation.dart';

import '../../api/model/response/auth_signup_response.dart';

part 'signup_state.freezed.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState.initial() = _Initial;
  const factory SignupState.loading() = _Loading;
  const factory SignupState.success(AuthSignupResponse response) = _Success;
  const factory SignupState.error(String message) = _Error;
}