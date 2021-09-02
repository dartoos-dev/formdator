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
  /// [mal] "malformed", the error message in case of non-numeric input values.
  ReqNum({String? blank, String? mal}) : this._num(Num(mal: mal), blank);

  /// Constrains data to numeric values greater than or equal to [min].
  ///
  /// [min] the smallest valid number.
  /// [blank] the error message in case of a null or empty input value.
  /// [mal] "malformed", the error message in case of non-numeric input values.
  /// [small] the error message if an input is too small.
  ReqNum.min(num min, {String? blank, String? mal, String? small})
      : this._num(Num.min(min, mal: mal, small: small), blank);

  /// Constrains data to positive numbers (zero included).
  ///
  /// [blank] the error message in case of a null or empty input value.
  /// [mal] "malformed", the error message in case of non-numeric input values.
  /// [neg] the error message if an input value is negative.
  ReqNum.pos({String? blank, String? mal, String? neg})
      : this._num(Num.pos(mal: mal, neg: neg), blank);

  /// Constrains data to numeric values that are less than or equal to [max].
  ///
  /// [max] the greatest valid number.
  /// [blank] the error message in case of a null or empty input value.
  /// [mal] "malformed", the error message in case of non-numeric input values.
  /// [large] the error message if an input is too large.
  ReqNum.max(num max, {String? blank, String? mal, String? large})
      : this._num(Num.max(max, mal: mal, large: large), blank);

  /// Constrains data to negative numbers (zero excluded).
  ///
  /// [blank] the error message in case of a null or empty input value.
  /// [mal] "malformed", the error message in case of non-numeric input values.
  /// [pos] the error message if an input value is positive; the default value
  /// is 'it cannot be positive'.
  ReqNum.neg({String? blank, String? mal, String? pos})
      : this._num(Num.neg(mal: mal, pos: pos), blank);

  /// Constrains data to numeric values within the range [min–max].
  ///
  /// [min] the smallest valid number; it must be < [max].
  /// [max] the largest valid number; it must be > [min].
  /// [blank] the error message in case of a null or empty input value.
  /// [mal] "malformed", the error message in case of non-numeric input values.
  /// [small] the error message if an input is too small.
  /// [large] the error message if an input is too large.
  ReqNum.range(
    num min,
    num max, {
    String? blank,
    String? mal,
    String? small,
    String? large,
  }) : this._num(
          Num.range(min, max, mal: mal, small: small, large: large),
          blank,
        );

  /// Helper ctor.
  ReqNum._num(Num numVal, String? blank)
      : _reqNum = Pair.str2(Req(blank: blank), numVal);

  // the number validator.
  final Pair _reqNum;

  /// Valid — returns null – if [input] is either numeric or null.
  String? call(String? input) => _reqNum(input);
}
