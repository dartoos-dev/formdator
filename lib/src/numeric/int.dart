import 'package:formdator/formdator.dart';

/// Integer constraints — limits input data to integer values.
///
/// Examples:
/// - valid input: "1", "+555", "123", "-1".
/// - invalid input: "9.99", "-1.1", "A", "12A", "12.A3".
class Int {
  /// Constrains data to integer numbers.
  ///
  /// [non] "non-integer", the error message in case of input containing at
  /// least one non-integer character; the default value is 'non-integer
  /// character(s)'.
  Int({String? non}) : _val = _AsInt(non, const Ok());

  /// Constrains data to integer numbers greater than or equal to [min].
  ///
  /// [min] the smallest valid integer number.
  /// [non] "non-integer", the error message in case of input containing at
  /// least one non-integer character; the default value is 'non-integer
  /// character(s)'.
  /// [small] the error message if an input value is too small; the default
  /// value is 'it cannot be < [min]'.
  Int.min(int min, {String? non, String? small})
      : _val = _AsInt(non, _Logic(min: min, s: small));

  /// Constrains data to positive integer numbers (zero included).
  ///
  /// [non] "non-integer", the error message in case of input containing at
  /// least one non-integer character; the default value is 'non-integer
  /// character(s)'.
  /// [neg] the error message if an input value is negative; the default value
  /// is 'it cannot be negative'.
  Int.pos({String? non, String? neg})
      : this.min(0, non: non, small: neg ?? 'it cannot be negative');

  /// Constrains data to integer values that are less than or equal to [max].
  ///
  /// [max] the greatest valid integer number.
  /// [non] "non-integer", the error message in case of input containing at
  /// least one non-integer character; the default value is 'non-integer
  /// character(s)'.
  /// [large] the error message if an input value is too large; the default
  /// value is 'it cannot be > [max]'.
  Int.max(int max, {String? non, String? large})
      : _val = _AsInt(non, _Logic(max: max, l: large));

  /// Constrains data to negative integer numbers (zero excluded).
  ///
  /// [non] "non-integer", the error message in case of input containing at
  /// least one non-integer character; the default value is 'non-integer
  /// character(s)'.
  /// [pos] the error message if an input value is positive; the default value
  /// is 'it cannot be positive'.
  Int.neg({String? non, String? pos})
      : this.max(-1, non: non, large: pos ?? 'it cannot be positive');

  /// Constrains data to integer values within the range [min–max].
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
  Int.range(int min, int max, {String? non, String? small, String? large})
      : assert(min < max),
        _val = _AsInt(non, _Logic(min: min, max: max, s: small, l: large));

  final _AsInt _val;

  /// Valid — returns null – if [input] is either integer or null.
  String? call(String? input) => _val(input);
}

class _AsInt {
  /// [non] the "non-Integer character" error message; it defaults to
  /// 'non-integer character(s)'.
  /// [logic] the logic to be applied to a integer input.
  _AsInt(String? non, this._logic) : _non = non ?? 'non-integer character(s)';

  /// Logic code related to integer values.
  final String? Function(int) _logic;

  /// The error message in case of NaN input.
  final String _non;

  /// Invokes [_logic] if [input] is num.
  String? call(String? input) {
    if (input == null) return null;

    final asInt = int.tryParse(input);
    return asInt == null ? _non : _logic(asInt);
  }
}

/// Default messages and logic.
class _Logic {
  /// Ctor.
  const _Logic({int? min, int? max, String? s, String? l})
      : _min = min ?? double.negativeInfinity,
        _max = max ?? double.infinity,
        _small = s ?? 'it cannot be < $min',
        _large = l ?? 'it cannot be > $max';

  final String _small;
  final String _large;
  final num _min;
  final num _max;

  String? call(int n) {
    return n < _min
        ? _small
        : n > _max
            ? _large
            : null;
  }
}
