import 'package:formdator/formdator.dart';

/// Numeric constraints — limits input data to numeric values.
///
/// Examples:
/// - valid input: "1", "123", "-1", "-9.99"
/// - invalid input: "A", "12A", "12.A3"
class Num {
  /// Constrains data to numeric values.
  ///
  /// [nan] "not-a-number", the error message in case of a non-numeric input;
  /// the default value is 'not a number'.
  Num({String? nan}) : _val = _AsNum(nan, const Ok());

  /// Constrains data to numeric values greater than or equal to [min].
  ///
  /// [min] the smallest valid number.
  /// [nan] "not-a-number", the error message if an input is not numeric; the
  /// default value is 'not a number'.
  /// [small] the error message if an input is too small; the default value is
  /// 'it cannot be < [min]'.
  Num.min(num min, {String? nan, String? small})
      : _val = _AsNum(nan, _Logic(min: min, s: small));

  /// Constrains data to numeric values that are less than or equal to [max].
  ///
  /// [max] the greatest valid number.
  /// [nan] "not-a-number", the error message if an input is not numeric; the
  /// default value is 'not a number'.
  /// [large] the error message if an input is too large; the default value is
  /// 'it cannot be > [max]'.
  Num.max(num max, {String? nan, String? large})
      : _val = _AsNum(nan, _Logic(max: max, l: large));

  /// Constrains data to numeric values within the range [min–max].
  ///
  /// [min] the smallest valid number; it must be < [max].
  /// [max] the largest valid number; it must be > [min].
  /// [nan] "not-a-number", the error message if an input is not numeric; the
  /// default value is 'not a number'.
  /// [small] the error message if an input is too small; the default value is
  /// 'it cannot be < [min]'.
  /// [large] the error message if an input is too large; the default value is
  /// 'it cannot be > [max]'.
  Num.range(num min, num max, {String? nan, String? small, String? large})
      : assert(min < max),
        _val = _AsNum(nan, _Logic(min: min, max: max, s: small, l: large));

  final _AsNum _val;

  /// Valid — returns null – if [input] is either numeric or null.
  String? call(String? input) => _val(input);
}

class _AsNum {
  /// [nan] The "Not-a-Number" error message; defaults to 'not a number'.
  /// [logic] the logic to be applied to a numeric input.
  _AsNum(String? nan, this._logic) : _nan = nan ?? 'not a number';

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

/// Default messages and logic.
class _Logic {
  /// Ctor.
  const _Logic({num? min, num? max, String? s, String? l})
      : _min = min ?? double.negativeInfinity,
        _max = max ?? double.infinity,
        _small = s ?? 'it cannot be < $min',
        _large = l ?? 'it cannot be > $max';

  final String _small;
  final String _large;
  final num _min;
  final num _max;

  String? call(num n) {
    return n < _min
        ? _small
        : n > _max
            ? _large
            : null;
  }
}