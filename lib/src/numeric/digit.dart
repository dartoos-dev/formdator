import 'package:formdator/formdator.dart';

/// Digit - any one of the ten numbers 0 to 9.
///
/// For example, the values "1" and "123" are valid; whereas the values "A",
/// "12A", "123.34", "9.99" are invalid.
///
/// Blank field — null or empty — is a valid input.
///
/// If the field is mandatory, see [ReqDigit] or [Req].
class Digit {
  /// Constrains the input data to the digits [0-9].
  ///
  /// [non] the error message if a non-digit character is found; the default
  /// value is 'non-digit character'.
  Digit({String? non}) : _valDig = _DigitImpl(non, const Ok());

  /// Constrains the input data to the digits [0-9] and its length (number of
  /// digits) to [len] digits.
  ///
  /// [len] the number of digits; it must be > 0.
  /// [non] the error message if a non-digit character is found.
  /// [diff] the error message if the number of digits is different from [len].
  Digit.len(int len, {String? non, String? diff})
      : assert(len > 0),
        _valDig = _DigitImpl(non, Len(len, diff: diff));

  /// Constrains the input data to the digits [0-9] and its length (number of
  /// digits) to a minimum of [min] digits.
  ///
  /// [min] the minimum number of digits; it must be > 0.
  /// [non] the error message if a non-digit character is found.
  /// [less] the error message if the number of digits is less than [min].
  Digit.min(int min, {String? non, String? less})
      : assert(min > 0),
        _valDig = _DigitImpl(non, Len.min(min, less: less));

  /// Constrains the input data to the digits [0-9] and its length (number of
  /// digits) to a maximum of [min] digits.
  ///
  /// [max] the maximum number of digits; it must be > 0.
  /// [non] the error message if a non-digit character is found.
  /// [great] the error message if the number of digits is greater than [max].
  Digit.max(int max, {String? non, String? great})
      : assert(max > 0),
        _valDig = _DigitImpl(non, Len.max(max, great: great));

  /// Constrains the input data to the digits [0-9] and its length (number of
  /// digits) within the range [min–max].
  ///
  /// [min] the minimum number of digits; it must be > 0 and < [max].
  /// [max] the maximum number of digits; it must be > 0 and > [min].
  /// [non] the error message if a non-digit character is found.
  /// [less] the error message if the number of digits is less than [min].
  /// [great] the error message if the number of digits is greater than [max].
  Digit.range(int min, int max, {String? non, String? less, String? great})
      : assert(min > 0),
        assert(max > 0),
        assert(max > min),
        _valDig = _DigitImpl(
          non,
          Len.range(min, max, less: less, great: great),
        );

  // the digit-only validation logic.
  final ValStr _valDig;

  /// Valid - returns null - if [digits] has only digits or is null.
  String? call(String? digits) => _valDig(digits);
}

class _DigitImpl {
  /// Ctor. [non] non-digit error message; [extra] additional validation step.
  _DigitImpl(String? non, ValObj extra)
      : _nonDigit = non ?? 'non-digit character',
        _extra = extra;

  final String _nonDigit;
  // extra validation step.
  final ValObj _extra;

  static final _digitsOnly = RegExp(r'^\d+$');

  String? call(String? input) {
    return (input != null && !_digitsOnly.hasMatch(input))
        ? _nonDigit
        : _extra(input);
  }
}
