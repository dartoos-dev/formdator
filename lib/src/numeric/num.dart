import 'package:formdator/formdator.dart';

/// Numeric constraints — limits input data to numeric values.
///
/// Examples:
/// - valid input: "1", "123", "-1", "-9.99"
/// - invalid input: "A", "12A", "12.A3"
class Num {
  /// Constrains data to numeric values.
  ///
  /// [non] "non-numeric", the error message in case of a non-numeric input; the
  /// default value is 'not a number'.
  Num({String? non}) : _val = _AsNum(non, const Ok());

  /// Constrains data to numeric values greater than or equal to [min].
  ///
  /// [min] the smallest valid number.
  /// [non] "non-numeric", the error message if an input is not numeric; the
  /// default value is 'not a number'.
  /// [small] the error message if an input is too small; the default value is
  /// 'it cannot be < [min]'.
  Num.min(num min, {String? non, String? small})
      : _val = _AsNum(non, _Logic(min: min, s: small));

  /// Constrains data to positive numbers (zero included).
  ///
  /// [non] "non-numeric", the error message if an input is not numeric; the
  /// default value is 'not a number'.
  /// [neg] the error message if an input value is negative; the default value
  /// is 'it cannot be negative'.
  Num.pos({String? non, String? neg})
      : this.min(0, non: non, small: neg ?? 'it cannot be negative');

  /// Constrains data to numeric values that are less than or equal to [max].
  ///
  /// [max] the greatest valid number.
  /// [non] "non-numeric", the error message if an input is not numeric; the
  /// default value is 'not a number'.
  /// [large] the error message if an input is too large; the default value is
  /// 'it cannot be > [max]'.
  Num.max(num max, {String? non, String? large})
      : _val = _AsNum(non, _Logic(max: max, l: large));

  /// Constrains data to negative numbers (zero excluded).
  ///
  /// [non] "non-numeric", the error message if an input is not numeric; the
  /// default value is 'not a number'.
  /// [pos] the error message if an input value is positive; the default value
  /// is 'it cannot be positive'.
  Num.neg({String? non, String? pos})
      : this.max(0 - double.minPositive,
            non: non, large: pos ?? 'it cannot be positive');

  /// Constrains data to numeric values within the range [min–max].
  ///
  /// [min] the smallest valid number; it must be < [max].
  /// [max] the largest valid number; it must be > [min].
  /// [non] "non-numeric", the error message if an input is not numeric; the
  /// default value is 'not a number'.
  /// [small] the error message if an input is too small; the default value is
  /// 'it cannot be < [min]'.
  /// [large] the error message if an input is too large; the default value is
  /// 'it cannot be > [max]'.
  Num.range(num min, num max, {String? non, String? small, String? large})
      : assert(min < max),
        _val = _AsNum(non, _Logic(min: min, max: max, s: small, l: large));

  final _AsNum _val;

  /// Valid — returns null – if [input] is either numeric or null.
  String? call(String? input) => _val(input);
}

class _AsNum {
  /// [non] The "Not-a-Number" error message; defaults to 'not a number'.
  /// [logic] the logic to be applied to a numeric input.
  _AsNum(String? non, this._logic) : _non = non ?? 'not a number';

  /// Logic code related to numeric values.
  final String? Function(num) _logic;

  /// The error message in case of NaN input.
  final String _non;

  /// Invokes [_logic] if [input] is num.
  String? call(String? input) {
    if (input == null) return null;

    final asNum = num.tryParse(input);
    return asNum == null ? _non : _logic(asNum);
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
