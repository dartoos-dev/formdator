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
  /// [non] "non-integer", the error message in case of input containing at
  /// least one non-integer character.
  ReqInt({String? blank, String? non}) : this._int(Int(non: non), blank);

  /// Constrains data to integer numbers greater than or equal to [min].
  ///
  /// [min] the smallest valid integer number.
  /// [blank] the error message in case of a null or empty input value.
  /// [non] "non-integer", the error message in case of input containing at
  /// least one non-integer character.
  /// [small] the error message if an input is too small.
  ReqInt.min(int min, {String? blank, String? non, String? small})
      : this._int(Int.min(min, non: non, small: small), blank);

  /// Constrains data to positive integer numbers (zero included).
  ///
  /// [blank] the error message in case of a null or empty input value.
  /// [non] "non-integer", the error message in case of input containing at
  /// least one non-integer character.
  /// [neg] the error message if an input is negative.
  ReqInt.pos({String? blank, String? non, String? neg})
      : this._int(Int.pos(non: non, neg: neg), blank);

  /// Constrains data to integer numbers that are less than or equal to [max].
  ///
  /// [max] the greatest valid integer number.
  /// [blank] the error message in case of a null or empty input value.
  /// [non] "non-integer", the error message in case of input containing at
  /// least one non-integer character.
  /// [large] the error message if an input is too large.
  ReqInt.max(int max, {String? blank, String? non, String? large})
      : this._int(Int.max(max, non: non, large: large), blank);

  /// Constrains data to negative integer numbers (zero excluded).
  ///
  /// [non] "non-integer", the error message in case of input containing at
  /// least one non-integer character; the default value is 'non-integer
  /// character(s)'.
  /// [pos] the error message if an input value is positive; the default value
  /// is 'it cannot be positive'.
  ReqInt.neg({String? blank, String? non, String? pos})
      : this._int(Int.neg(non: non, pos: pos), blank);

  /// Constrains data to integer numbers within the range [min–max].
  ///
  /// [min] the smallest valid number; it must be < [max].
  /// [max] the largest valid number; it must be > [min].
  /// [non] "non-integer", the error message in case of input containing at
  /// least one non-integer character; the default value is 'non-integer
  /// character(s)'.
  /// [small] the error message if an input value is too small; the default
  /// value is 'it cannot be < [min]'.
  /// [large] the error message if an input value is too large; the default
  /// value is 'it cannot be > [max]'.
  ReqInt.range(
    int min,
    int max, {
    String? blank,
    String? non,
    String? small,
    String? large,
  }) : this._int(
            Int.range(min, max, non: non, small: small, large: large), blank);

  /// Helper ctor.
  ReqInt._int(Int intVal, String? blank)
      : _reqInt = Pair.str2(Req(blank: blank), intVal);

  // the intber validator.
  final Pair _reqInt;

  /// Valid — returns null – if [input] is either interic or null.
  String? call(String? input) => _reqInt(input);
}
