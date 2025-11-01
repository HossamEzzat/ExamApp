import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/di/di.dart';
import '../../../../../core/widgets/auth/custom_spacer.dart';
import '../../../../../core/widgets/auth/custom_elevated_button_widget.dart';
import '../../../../../core/widgets/auth/custom_rich_text_widget.dart';
import '../../../../../core/widgets/auth/custom_text_field_widget.dart';
import '../../../../../core/values/app_colors.dart';
import '../../utils/signup_validation.dart';
import '../signup_viewmodel/signup_state.dart';
import '../signup_viewmodel/signup_view_model.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SignupViewModel>(),
      child: const SignupView(),
    );
  }
}

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SignupViewModel>();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Sign up',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: BlocListener<SignupViewModel, SignupState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loading: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => const Center(
                  child: CircularProgressIndicator(color: AppColors.blue),
                ),
              );
            },
            success: (response) {
              Navigator.pop(context); // Close loading dialog
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(response.message),
                  backgroundColor: Colors.green,
                ),
              );
              // Navigate to login or home screen
              Navigator.pop(context); // Go back to login
            },
            error: (message) {
              Navigator.pop(context); // Close loading dialog
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: AppColors.error,
                ),
              );
            },
          );
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Form(
            key: viewModel.formKey,
            child: Column(
              children: [
                // Username
                CustomEditTextFieldWidget(
                  hintText: 'Enter your user name',
                  labelText: 'User name',
                  controller: viewModel.usernameController,
                  validator: SignupValidation.usernameValidation,
                ),
                CustomHeightSpace(height: 16.h),

                // First name and Last name row
                Row(
                  children: [
                    Expanded(
                      child: CustomEditTextFieldWidget(
                        hintText: 'Enter first name',
                        labelText: 'First name',
                        width: double.infinity,
                        controller: viewModel.firstNameController,
                        validator: (value) =>
                            SignupValidation.nameValidation(value, 'First name'),
                      ),
                    ),
                    CustomWidthSpace(width: 16.w),
                    Expanded(
                      child: CustomEditTextFieldWidget(
                        hintText: 'Enter last name',
                        labelText: 'Last name',
                        width: double.infinity,
                        controller: viewModel.lastNameController,
                        validator: (value) =>
                            SignupValidation.nameValidation(value, 'Last name'),
                      ),
                    ),
                  ],
                ),
                CustomHeightSpace(height: 16.h),

                // Email
                CustomEditTextFieldWidget(
                  hintText: 'Enter your email',
                  labelText: 'Email',
                  controller: viewModel.emailController,
                  validator: SignupValidation.emailValidation,
                ),
                CustomHeightSpace(height: 16.h),

                // Password and Confirm Password row
                Row(
                  children: [
                    Expanded(
                      child: BlocBuilder<SignupViewModel, SignupState>(
                        builder: (context, state) {
                          return CustomEditTextFieldWidget(
                            hintText: 'Enter password',
                            labelText: 'Password',
                            width: double.infinity,
                            controller: viewModel.passwordController,
                            isPasswordField: !viewModel.isPasswordVisible,
                            validator: SignupValidation.passwordValidation,
                            suffixIcon: IconButton(
                              icon: Icon(
                                viewModel.isPasswordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: AppColors.gray,
                              ),
                              onPressed: viewModel.togglePasswordVisibility,
                            ),
                          );
                        },
                      ),
                    ),
                    CustomWidthSpace(width: 16.w),
                    Expanded(
                      child: BlocBuilder<SignupViewModel, SignupState>(
                        builder: (context, state) {
                          return CustomEditTextFieldWidget(
                            hintText: 'Confirm password',
                            labelText: 'Confirm password',
                            width: double.infinity,
                            controller: viewModel.confirmPasswordController,
                            isPasswordField: !viewModel.isConfirmPasswordVisible,
                            validator: (value) =>
                                SignupValidation.confirmPasswordValidation(
                                  value,
                                  viewModel.passwordController.text,
                                ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                viewModel.isConfirmPasswordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: AppColors.gray,
                              ),
                              onPressed: viewModel.toggleConfirmPasswordVisibility,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                CustomHeightSpace(height: 16.h),

                // Phone number
                CustomEditTextFieldWidget(
                  hintText: 'Enter phone number',
                  labelText: 'Phone number',
                  controller: viewModel.phoneController,
                  validator: SignupValidation.phoneValidation,
                ),
                CustomHeightSpace(height: 32.h),

                // Signup button
                CustomElevatedButtonWidget(
                  buttonText: 'Signup',
                  onPressed: viewModel.signup,
                ),
                CustomHeightSpace(height: 16.h),

                // Login link
                CustomRichTextWidget(
                  firstText: 'Already have an account? ',
                  secondText: 'Login',
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}