import 'package:validators/validators.dart';

/// Optional digit-only.
///
/// Ex: '123' is valid; 'AB', '12AB', '123.34', '9,99' are invalid.
///
/// ** Blank field - null value - is a valid input!**.
///
/// If the field is mandatory, use [ReqDigit].
class Digit {
  /// Validates an optional digit-only field.
  ///
  /// [nonDigit] is the error message in case of a non-numeric digit.
  const Digit({required String nonDigit}) : _nonDigit = nonDigit;

  final String _nonDigit;

  /// Valid - returns null - if [digits] has only digits or is null.
  String? call(String? digits) =>
      (digits == null || isNumeric(digits)) ? null : _nonDigit;
}
