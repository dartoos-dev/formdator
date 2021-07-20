import 'package:formdator/formdator.dart';

/// Convenient validator for required, digit-only fields.
///
/// It is the composition between the [Req] and [Digit] validators.
class ReqDigit {
  /// Constrains the input data to the digits [0-9].
  ///
  /// [blank] the error message in case of a null or empty input value.
  /// [non] the error message if a non-digit character is found.
  ReqDigit({String? blank, String? non}) : this._dig(Digit(non: non), blank);

  /// Constrains the input data to the digits [0-9] and its length (number of
  /// digits) to [len] digits.
  ///
  /// [len] the number of digits; it must be > 0.
  /// [blank] the error message in case of a null or empty input value.
  /// [non] the error message if a non-digit character is found.
  /// [diff] the error message if the number of digits is different from [len].
  ReqDigit.len(int len, {String? blank, String? non, String? diff})
      : this._dig(Digit.len(len, non: non, diff: diff), blank);

  /// Constrains the input data to the digits [0-9] and its length (number of
  /// digits) to a minimum of [min] digits.
  ///
  /// [min] the minimum number of digits; it must be > 0.
  /// [blank] the error message in case of a null or empty input value.
  /// [non] the error message if a non-digit character is found.
  /// [less] the error message if the number of digits is less than [min].
  ReqDigit.min(int min, {String? blank, String? non, String? less})
      : this._dig(Digit.min(min, non: non, less: less), blank);

  /// Constrains the input data to the digits [0-9] and its length (number of
  /// digits) to a maximum of [min] digits.
  ///
  /// [max] the maximum number of digits; it must be > 0.
  /// [blank] the error message in case of a null or empty input value.
  /// [non] the error message if a non-digit character is found.
  /// [great] the error message if the number of digits is greater than [max].
  ReqDigit.max(int max, {String? blank, String? non, String? great})
      : this._dig(Digit.max(max, non: non, great: great), blank);

  /// Constrains the input data to the digits [0-9] and its length (number of
  /// digits) within the range [min–max].
  ///
  /// [min] the minimum number of digits; it must be > 0 and < [max].
  /// [max] the maximum number of digits; it must be > 0 and > [min].
  /// [blank] the error message in case of a null or empty input value.
  /// [non] the error message if a non-digit character is found.
  /// [less] the error message if the number of digits is less than [min].
  /// [great] the error message if the number of digits is greater than [max].
  ReqDigit.range(
    int min,
    int max, {
    String? blank,
    String? non,
    String? less,
    String? great,
  }) : this._dig(
          Digit.range(min, max, non: non, less: less, great: great),
          blank,
        );

  /// Helper ctor.
  ReqDigit._dig(Digit digit, String? blank)
      : _reqDig = Pair.str2(Req(blank: blank), digit);

  // the digit-only validation logic.
  final Pair _reqDig;

  /// Valid - returns null - if [digits] has only digits or is null.
  String? call(String? digits) => _reqDig(digits);
}
