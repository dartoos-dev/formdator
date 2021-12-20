import 'package:formdator/core.dart';
import 'package:formdator/numeric.dart';

/// Convenient validator for required, digit-only fields.
///
/// It is the composition between the [Req] and [Digit] validators.
class ReqDigit {
  /// Constrains the input data to the digits [0-9].
  ///
  /// [blank] the error message in case of a null or empty input value.
  /// [mal] the error message if a non-digit character is found.
  ReqDigit({String? blank, String? mal}) : this._dig(Digit(mal: mal), blank);

  /// Constrains the input data to the digits [0-9] and its length (number of
  /// digits) to [len] digits.
  ///
  /// [len] the number of digits; it must be > 0.
  /// [blank] the error message in case of a null or empty input value.
  /// [mal] the error message if a non-digit character is found.
  /// [diff] the error message if the number of digits is different from [len].
  ReqDigit.len(int len, {String? blank, String? mal, String? diff})
      : this._dig(Digit.len(len, mal: mal, diff: diff), blank);

  /// Constrains the input data to the digits [0-9] and its length (number of
  /// digits) to a minimum of [min] digits.
  ///
  /// [min] the minimum number of digits; it must be > 0.
  /// [blank] the error message in case of a null or empty input value.
  /// [mal] the error message if a non-digit character is found.
  /// [short] the error message if the input length is shorter than [min]
  /// digits.
  ReqDigit.min(int min, {String? blank, String? mal, String? short})
      : this._dig(Digit.min(min, mal: mal, short: short), blank);

  /// Constrains the input data to the digits [0-9] and its length (number of
  /// digits) to a maximum of [max] digits.
  ///
  /// [max] the maximum number of digits; it must be > 0.
  /// [blank] the error message in case of a null or empty input value.
  /// [mal] the error message if a non-digit character is found.
  /// [long] the error message if the input length is longer than [max] digits.
  ReqDigit.max(int max, {String? blank, String? mal, String? long})
      : this._dig(Digit.max(max, mal: mal, long: long), blank);

  /// Constrains the input data to the digits [0-9] and its length (number of
  /// digits) within the range [min–max].
  ///
  /// [min] the minimum number of digits; it must be > 0 and < [max].
  /// [max] the maximum number of digits; it must be > 0 and > [min].
  /// [blank] the error message in case of a null or empty input value.
  /// [mal] the error message if a non-digit character is found.
  /// [short] the error message if the input length is shorter than [min]
  /// digits.
  /// [long] the error message if the number of digits is longer than [max].
  ReqDigit.range(
    int min,
    int max, {
    String? blank,
    String? mal,
    String? short,
    String? long,
  }) : this._dig(
          Digit.range(min, max, mal: mal, short: short, long: long),
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
