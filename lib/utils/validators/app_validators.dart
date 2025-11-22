class Validators {
  /// Email validation
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return "Email is required";
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );
    if (!emailRegex.hasMatch(value.trim())) return "Enter a valid email";
    return null;
  }

  /// Password validation
  /// Minimum 8 characters, at least 1 uppercase, 1 lowercase, 1 number, 1 special char
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return "Password is required";
    final passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );
    if (!passwordRegex.hasMatch(value)) {
      return "Password must be at least 8 characters, include uppercase, lowercase, number, and special character";
    }
    return null;
  }

  /// Confirm password validation
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) return "Confirm password is required";
    if (value != password) return "Passwords do not match";
    return null;
  }

  /// PIN code validation (optional)
  static String? validatePin(String? value, {int length = 4}) {
    if (value == null || value.isEmpty) return "PIN code is required";
    if (value.length != length) return "PIN must be $length digits";
    if (!RegExp(r'^\d+$').hasMatch(value)) return "PIN must be numeric";
    return null;
  }
}
