import 'package:formdator/formdator.dart';

/// Convenient validator for required, integer fields.
///
/// Examples:
/// - valid input: "1", "+123", "-1", "-9".
/// - invalid input:"-9.99", "9.99", "A", "12A", "12.A3".
class ReqInt {
  /// Constrains data to integer numbers.
  ///
  /// [blank] the error message in case of a null or empty input value.
  /// [mal] "malformed", the error message for non-integer input values.
  ReqInt({String? blank, String? mal}) : this._int(Int(mal: mal), blank);

  /// Constrains data to integer numbers greater than or equal to [min].
  ///
  /// [min] the smallest valid integer number.
  /// [blank] the error message in case of a null or empty input value.
  /// [mal] "malformed", the error message for non-integer input values.
  /// [small] the error message if an input is too small.
  ReqInt.min(int min, {String? blank, String? mal, String? small})
      : this._int(Int.min(min, mal: mal, small: small), blank);

  /// Constrains data to positive integer numbers (zero included).
  ///
  /// [blank] the error message in case of a null or empty input value.
  /// [mal] "malformed", the error message for non-integer input values.
  /// [neg] the error message if an input is negative.
  ReqInt.pos({String? blank, String? mal, String? neg})
      : this._int(Int.pos(mal: mal, neg: neg), blank);

  /// Constrains data to integer numbers that are less than or equal to [max].
  ///
  /// [max] the greatest valid integer number.
  /// [blank] the error message in case of a null or empty input value.
  /// [mal] "malformed", the error message for non-integer input values.
  /// [large] the error message if an input is too large.
  ReqInt.max(int max, {String? blank, String? mal, String? large})
      : this._int(Int.max(max, mal: mal, large: large), blank);

  /// Constrains data to negative integer numbers (zero excluded).
  ///
  /// [mal] "malformed", the error message for non-integer input values.
  /// [pos] the error message if an input value is positive.
  ReqInt.neg({String? blank, String? mal, String? pos})
      : this._int(Int.neg(mal: mal, pos: pos), blank);

  /// Constrains data to integer numbers within the range [min–max].
  ///
  /// [min] the smallest valid number; it must be < [max].
  /// [max] the largest valid number; it must be > [min].
  /// [mal] "malformed", the error message for non-integer input values.
  /// [small] the error message if an input value is too small.
  /// [large] the error message if an input value is too large.
  ReqInt.range(
    int min,
    int max, {
    String? blank,
    String? mal,
    String? small,
    String? large,
  }) : this._int(
            Int.range(min, max, mal: mal, small: small, large: large), blank);

  /// Helper ctor.
  ReqInt._int(Int intVal, String? blank)
      : _reqInt = Pair.str2(Req(blank: blank), intVal);

  // the intber validator.
  final Pair _reqInt;

  /// Valid — returns null – if [input] is either interic or null.
  String? call(String? input) => _reqInt(input);
}
