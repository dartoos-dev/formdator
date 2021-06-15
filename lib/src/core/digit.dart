/// Digit - any one of the ten numbers 0 to 9.
///
/// For example, the input values "1" and "123" are valid; whereas the values
/// "A", "12A", "123.34", "9.99" are invalid.
///
/// Blank field - null value - is a valid input.
///
/// If the field is mandatory, see [Req].
class Digit {
  /// Validates an optional digit-only field.
  ///
  /// [non] is the error message in case of a non-digit value.
  const Digit({required String non}) : _nonDigit = non;

  final String _nonDigit;

  static late final _digitsOnly = RegExp(r'^[0-9]+$');

  /// Valid - returns null - if [digits] has only digits or is null.
  String? call(String? digits) =>
      (digits == null || _isNumeric(digits)) ? null : _nonDigit;

  /// Checks whether [value] contains only digits.
  bool _isNumeric(String value) => _digitsOnly.hasMatch(value);
}
