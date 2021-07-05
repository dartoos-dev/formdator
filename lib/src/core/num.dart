import 'package:formdator/formdator.dart';

/// Numeric constraints — limits input to numeric values.
///
/// Examples:
/// - valid input: "1", "123", "-1", "-9.99"
/// - invalid input: "A", "12A", "12.A3"
class Num {
  /// Constrains data to numeric values.
  ///
  /// [nan] "not-a-number", the error message in case of non-numeric input.
  Num({String? nan}) : _numVal = _InputAsNum(nan, const Ok());

  /// Constrains data to numeric values larger than or equal to [min].
  ///
  /// [min] the smallest valid input value.
  /// [nan] "not-a-number", the error message if input is not numeric.
  /// [small] the error message if input is too small.
  Num.min(num min, {String? nan, String? small})
      : _numVal = _InputAsNum(nan, (num input) => input < min ? small : null);

  /// Constrains data to numeric values lesser than or equal to [max].
  ///
  /// [max] the largest valid value.
  /// [nan] "not-a-number", the error message if input is not numeric.
  /// [large] the error message if input is too large.
  Num.max(num max, {String? nan, String? large})
      : _numVal = _InputAsNum(nan, (num input) => input > max ? large : null);

  /// Constrains data to numeric values within the range [min] and [max].
  ///
  /// [min] the smallest valid input value; must be <= [max].
  /// [max] the largest valid input value; must be >= [min].
  /// [nan] "not-a-number", the error message if input is not numeric.
  /// [small] the error message if input is too small.
  /// [large] the error message if input is too large.
  Num.range(num min, num max, {String? nan, String? small, String? large})
      : assert(min <= max),
        _numVal = _InputAsNum(
          nan,
          (num input) => input < min
              ? small
              : input > max
                  ? large
                  : null,
        );

  // the number validator.
  final _InputAsNum _numVal;

  /// Valid — returns null – if [input] is either numeric or null.
  String? call(String? input) => _numVal(input);
}

class _InputAsNum {
  /// [nan] The "Not-a-Number" error message; defaults to 'not a number'.
  /// [logic] the logic to be applied to a numeric input.
  _InputAsNum(String? nan, this._logic) : _nan = nan ?? 'not a number';

  /// Logic code related to numeric values.
  final String? Function(num) _logic;

  /// The error message in case of NaN input.
  final String _nan;

  /// Invokes [_logic] if [input] is num.
  String? call(String? input) {
    if (input == null) return null;

    final asNum = num.tryParse(input);
    return asNum == null ? _nan : _logic(asNum);
  }
}
