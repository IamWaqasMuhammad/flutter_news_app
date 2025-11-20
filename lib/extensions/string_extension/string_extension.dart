extension StringExtension on String {
  /// Check if string is null or empty
  bool get isNullOrEmpty => isEmpty;

  /// Check if string is not empty
  bool get isNotEmptyString => isNotEmpty;

  /// Capitalize first letter
  String capitalize() =>
      isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : '';

  /// Convert to title case (capitalize first letter of each word)
  String toTitleCase() => split(' ')
      .map((word) => word.isNotEmpty
      ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}'
      : '')
      .join(' ');

  /// Convert string to lowercase
  String toLower() => toLowerCase();

  /// Convert string to uppercase
  String toUpper() => toUpperCase();

  /// Trim whitespace from both ends
  String get trimmed => trim();

  /// Trim and replace multiple spaces with single space
  String get clean => trim().replaceAll(RegExp(r'\s+'), ' ');

  /// Check if string contains only digits
  bool get isNumeric => double.tryParse(this) != null;

  /// Check if string is a valid email
  bool get isValidEmail => RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(this);

  /// Check if string is a valid URL
  bool get isValidUrl =>
      Uri.tryParse(this)?.hasAbsolutePath ?? false;

  /// Convert to int (returns null if fails)
  int? get toInt => int.tryParse(this);

  /// Convert to double (returns null if fails)
  double? get toDouble => double.tryParse(this);

  /// Check if string starts with uppercase
  bool get startsWithUpperCase =>
      isNotEmpty && this[0].toUpperCase() == this[0];

  /// Check if string starts with lowercase
  bool get startsWithLowerCase =>
      isNotEmpty && this[0].toLowerCase() == this[0];

  /// Repeat string n times
  String repeat(int times) => List.filled(times, this).join();

  /// Remove all non-alphanumeric characters
  String get alphaNumericOnly => replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');

  /// Remove all digits
  String get removeDigits => replaceAll(RegExp(r'[0-9]'), '');

  /// Remove all special characters
  String get removeSpecialChars => replaceAll(RegExp(r'[!@#$%^&*(),.?":{}|<>]'), '');
}
