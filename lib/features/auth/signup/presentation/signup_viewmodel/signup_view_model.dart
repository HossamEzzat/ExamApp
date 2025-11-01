import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../api/model/request/auth_signup_request.dart';
import '../../domain/usecase/auth_signup_usecase.dart';
import 'signup_state.dart';

@injectable
class SignupViewModel extends Cubit<SignupState> {
  final AuthSignupUseCase _useCase;

  SignupViewModel(this._useCase) : super(const SignupState.initial());

  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(state); // Trigger rebuild
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(state); // Trigger rebuild
  }

  Future<void> signup() async {
    if (formKey.currentState?.validate() ?? false) {
      emit(const SignupState.loading());

      try {
        final request = AuthSignupRequest(
          username: usernameController.text.trim(),
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          rePassword: confirmPasswordController.text.trim(),
          phone: phoneController.text.trim(),
        );

        final response = await _useCase(request);
        emit(SignupState.success(response));
      } catch (e) {
        emit(SignupState.error(e.toString()));
      }
    }
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    return super.close();
  }
}