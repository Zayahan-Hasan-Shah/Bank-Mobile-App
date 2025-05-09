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

  /// Name check vaidation check
  static String? nameValidation(String? value) {
    final RegExp nameRegex = RegExp(r'^[a-zA-Z]+$');
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    } else if (!nameRegex.hasMatch(value.trim())) {
      return 'Enter a valid name (letters only)';
    }
    return null;
  }

  /// Phone number validation check
  static String? phoneNumberValidation(String? value) {
    if (value == null) return 'Phone number is required';

    if (value.startsWith('923')) {
      /// exactly 11 digits: 923 + 8 digits
      if (RegExp(r'^923\d{9}$').hasMatch(value)) return null;
    } else if (value.startsWith('03')) {
      /// exactly 11 digits: 03 + 9 digits
      if (RegExp(r'^03\d{10}$').hasMatch(value)) return null;
    }
    return 'Incorrect phone number';
  }
}
