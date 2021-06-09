/// Digits-only field.
///
/// Ex: '1', '123' are valid inputs; 'A', '12A', '123.34', '9,99' are invalid
/// ones;
///
/// Blank field - null value - is a valid input.
///
/// If the field is mandatory, see [Req].
class Digit {
  /// Validates an optional digit-only field.
  ///
  /// [nonDigit] is the error message in case of a non-numeric digit.
  const Digit({required String nonDigit}) : _nonDigit = nonDigit;

  final String _nonDigit;

  /// Valid - returns null - if [digits] has only digits or is null.
  String? call(String? digits) =>
      (digits == null || _isNumeric(digits)) ? null : _nonDigit;

  /// Checks whether [value] is numeric.
  ///
  /// Algorithm equivalent to the regular expression r'^[0-9]+$'.
  bool _isNumeric(String value) {
    const digits = <String>{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
    bool numeric = value.isNotEmpty;
    for (int i = 0; (i < value.length) && numeric; ++i) {
      numeric = digits.contains(value[i]);
    }
    return numeric;
  }
}
