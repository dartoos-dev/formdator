import 'package:formdator/core.dart';
import 'package:formdator/logic.dart';
import 'package:formdator/numeric.dart';
import 'package:formdator/type.dart';

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
  /// [mal] "malformed", the error message if non-digit characters are found;
  /// the default value is 'non-digit character(s) found'.
  Digit({String? mal}) : _valDig = _DigitImpl(mal, const Ok().call).call;

  /// Constrains the input data to the digits [0-9] and its length (number of
  /// digits) to [len] digits.
  ///
  /// [len] the number of digits; it must be > 0.
  /// [mal] "malformed", the error message if non-digit characters are found;
  /// the default value is 'non-digit character(s) found'.
  /// [diff] the error message if the number of digits is different from [len].
  Digit.len(int len, {String? mal, String? diff})
      : assert(len > 0),
        _valDig = _DigitImpl(mal, Len(len, diff: diff).call).call;

  /// Constrains the input data to the digits [0-9] and its length (number of
  /// digits) to a minimum of [min] digits.
  ///
  /// [min] the minimum number of digits; it must be > 0.
  /// [mal] "malformed", the error message if non-digit characters are found;
  /// the default value is 'non-digit character(s) found'.
  /// [short] the error message if the input length is shorter than [min]
  /// digits.
  Digit.min(int min, {String? mal, String? short})
      : assert(min > 0),
        _valDig = _DigitImpl(mal, Len.min(min, short: short).call).call;

  /// Constrains the input data to the digits [0-9] and its length (number of
  /// digits) to a maximum of [max] digits.
  ///
  /// [max] the maximum number of digits; it must be > 0.
  /// [mal] "malformed", the error message if non-digit characters are found;
  /// the default value is 'non-digit character(s) found'.
  /// [long] the error message if the input length is longer than [max] digits.
  Digit.max(int max, {String? mal, String? long})
      : assert(max > 0),
        _valDig = _DigitImpl(mal, Len.max(max, long: long).call).call;

  /// Constrains the input data to the digits [0-9] and its length (number of
  /// digits) within the range [min–max].
  ///
  /// [min] the minimum number of digits; it must be > 0 and < [max].
  /// [max] the maximum number of digits; it must be > 0 and > [min].
  /// [mal] "malformed", the error message if non-digit characters are found;
  /// the default value is 'non-digit character(s) found'.
  /// [short] the error message if the input length is shorter than [min]
  /// digits.
  /// [long] the error message if the input length is longer than [max] digits.
  Digit.range(int min, int max, {String? mal, String? short, String? long})
      : assert(min > 0),
        assert(max > 0),
        assert(max > min),
        _valDig = _DigitImpl(
          mal,
          Len.range(min, max, short: short, long: long).call,
        ).call;

  // the digit-only validation logic.
  final ValStr _valDig;

  /// Valid - returns null - if [digits] has only digits or is null.
  String? call(String? digits) => _valDig(digits);
}

class _DigitImpl {
  /// Ctor. [mal] non-digit error message; [extra] additional validation step.
  _DigitImpl(String? mal, ValObj extra)
      : _nonDigit = mal ?? 'non-digit character(s) found',
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
