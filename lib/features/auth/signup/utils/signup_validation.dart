class SignupValidation {
  static String? usernameValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "This user name is not valid";
    }
    if (value.trim().length < 3) {
      return "Username must be at least 3 characters";
    }
    return null;
  }

  static String? nameValidation(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName is required";
    }
    if (value.trim().length < 2) {
      return "$fieldName must be at least 2 characters";
    }
    return null;
  }

  static String? emailValidation(String? value) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');

    if (value == null || value.trim().isEmpty) {
      return "Email is required";
    }
    if (!emailRegex.hasMatch(value)) {
      return "This Email is not valid";
    }
    return null;
  }

  static String? passwordValidation(String? value) {
    final passwordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])');

    if (value == null || value.trim().isEmpty) {
      return "Password is required";
    }
    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }
    if (!passwordRegex.hasMatch(value)) {
      return "Password must contain letters and numbers";
    }
    return null;
  }

  static String? confirmPasswordValidation(String? value, String password) {
    if (value == null || value.trim().isEmpty) {
      return "Confirm password is required";
    }
    if (value != password) {
      return "Password not matched";
    }
    return null;
  }

  static String? phoneValidation(String? value) {
    final phoneRegex = RegExp(r'^[0-9]{10,15}$');

    if (value == null || value.trim().isEmpty) {
      return "Phone number is required";
    }
    if (!phoneRegex.hasMatch(value)) {
      return "Enter a valid phone number";
    }
    return null;
  }
}