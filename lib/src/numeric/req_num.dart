import 'package:formdator/formdator.dart';

/// Convenient validator for required, numeric fields.
///
/// Examples:
/// - valid input: "1", "123", "-1", "-9.99"
/// - invalid input: "A", "12A", "12.A3"
class ReqNum {
  /// Constrains data to numeric values.
  ///
  /// [blank] the error message in case of a null or empty input value.
  /// [non] "non-numeric", the error message in case of a non-numeric input.
  ReqNum({String? blank, String? non}) : this._num(Num(non: non), blank);

  /// Constrains data to numeric values greater than or equal to [min].
  ///
  /// [min] the smallest valid number.
  /// [blank] the error message in case of a null or empty input value.
  /// [non] "non-numeric", the error message if an input is not numeric.
  /// [small] the error message if an input is too small.
  ReqNum.min(num min, {String? blank, String? non, String? small})
      : this._num(Num.min(min, non: non, small: small), blank);

  /// Constrains data to positive numbers (zero included).
  ///
  /// [blank] the error message in case of a null or empty input value.
  /// [non] "non-numeric", the error message if an input is not numeric.
  /// [neg] the error message if an input value is negative.
  ReqNum.pos({String? blank, String? non, String? neg})
      : this._num(Num.pos(non: non, neg: neg), blank);

  /// Constrains data to numeric values that are less than or equal to [max].
  ///
  /// [max] the greatest valid number.
  /// [blank] the error message in case of a null or empty input value.
  /// [non] "non-numeric", the error message if an input is not numeric.
  /// [large] the error message if an input is too large.
  ReqNum.max(num max, {String? blank, String? non, String? large})
      : this._num(Num.max(max, non: non, large: large), blank);

  /// Constrains data to negative numbers (zero excluded).
  ///
  /// [blank] the error message in case of a null or empty input value.
  /// [non] "non-numeric", the error message if an input is not numeric.
  /// [pos] the error message if an input value is positive; the default value
  /// is 'it cannot be positive'.
  ReqNum.neg({String? blank, String? non, String? pos})
      : this._num(Num.neg(non: non, pos: pos), blank);

  /// Constrains data to numeric values within the range [min–max].
  ///
  /// [min] the smallest valid number; it must be < [max].
  /// [max] the largest valid number; it must be > [min].
  /// [blank] the error message in case of a null or empty input value.
  /// [non] "non-numeric", the error message if an input is not numeric.
  /// [small] the error message if an input is too small.
  /// [large] the error message if an input is too large.
  ReqNum.range(
    num min,
    num max, {
    String? blank,
    String? non,
    String? small,
    String? large,
  }) : this._num(
            Num.range(min, max, non: non, small: small, large: large), blank);

  /// Helper ctor.
  ReqNum._num(Num numVal, String? blank)
      : _reqNum = Pair.str2(Req(blank: blank), numVal);

  // the number validator.
  final Pair _reqNum;

  /// Valid — returns null – if [input] is either numeric or null.
  String? call(String? input) => _reqNum(input);
}
