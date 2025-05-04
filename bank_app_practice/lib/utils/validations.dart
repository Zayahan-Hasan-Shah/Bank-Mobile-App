class AppValidations {
  /// Email validation check
  static String? emailValidation(String? value) {
    final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    } else if (!regex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }
    return null;
  }


  /// Password validation check 
  static String? passwordValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one digit';
    }
    if (!RegExp(r'[!@#\$&*~_]').hasMatch(value)) {
      return 'Password must contain at least one special character (!@#\$&*~_)';
    }
    return null;
  }

  /// Confirm Password Validation check
  static String? confirmPasswordValidation(
      String? value, String originalPassword) {
    if (value == null || value.trim().isEmpty) {
      return 'Please confirm your password';
    }
    if (value.trim() != originalPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

}
