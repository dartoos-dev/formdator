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
  /// [nan] "not-a-number", the error message in case of a non-numeric input.
  ReqNum({String? blank, String? nan}) : this._num(Num(nan: nan), blank);

  /// Constrains data to numeric values greater than or equal to [min].
  ///
  /// [min] the smallest valid number.
  /// [blank] the error message in case of a null or empty input value.
  /// [nan] "not-a-number", the error message if an input is not numeric.
  /// [small] the error message if an input is too small.
  ReqNum.min(num min, {String? blank, String? nan, String? small})
      : this._num(Num.min(min, nan: nan, small: small), blank);

  /// Constrains data to numeric values that are less than or equal to [max].
  ///
  /// [max] the greatest valid number.
  /// [blank] the error message in case of a null or empty input value.
  /// [nan] "not-a-number", the error message if an input is not numeric.
  /// [large] the error message if an input is too large.
  ReqNum.max(num max, {String? blank, String? nan, String? large})
      : this._num(Num.max(max, nan: nan, large: large), blank);

  /// Constrains data to numeric values within the range [min–max].
  ///
  /// [min] the smallest valid number; it must be < [max].
  /// [max] the largest valid number; it must be > [min].
  /// [blank] the error message in case of a null or empty input value.
  /// [nan] "not-a-number", the error message if an input is not numeric.
  /// [small] the error message if an input is too small.
  /// [large] the error message if an input is too large.
  ReqNum.range(
    num min,
    num max, {
    String? blank,
    String? nan,
    String? small,
    String? large,
  }) : this._num(
          Num.range(min, max, nan: nan, small: small, large: large),
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
