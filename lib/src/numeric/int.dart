import 'package:formdator/logic.dart';

/// Integer constraints — limits input data to integer values.
///
/// Examples:
/// - valid input: "1", "+555", "123", "-1".
/// - invalid input: "9.99", "-1.1", "A", "12A", "12.A3".
class Int {
  /// Constrains data to integer numbers.
  ///
  /// [mal] "malformed", the error message for non-integer input values; the
  /// default value is 'non-integer input value'.
  Int({String? mal}) : _val = _AsInt(mal, const Ok().call);

  /// Constrains data to integer numbers greater than or equal to [min].
  ///
  /// [min] the smallest valid integer number.
  /// [mal] "malformed", the error message for non-integer input values; the
  /// default value is 'non-integer input value'.
  /// [small] the error message if an input value is too small; the default
  /// value is 'it cannot be < [min]'.
  Int.min(int min, {String? mal, String? small})
      : _val = _AsInt(mal, _Logic(min: min, s: small).call);

  /// Constrains data to positive integer numbers (zero included).
  ///
  /// [mal] "malformed", the error message for non-integer input values; the
  /// default value is 'non-integer input value'.
  /// [neg] the error message if an input value is negative; the default value
  /// is 'it cannot be negative'.
  Int.pos({String? mal, String? neg})
      : this.min(0, mal: mal, small: neg ?? 'it cannot be negative');

  /// Constrains data to integer values that are less than or equal to [max].
  ///
  /// [max] the greatest valid integer number.
  /// [mal] "malformed", the error message for non-integer input values; the
  /// default value is 'non-integer input value'.
  /// character(s)'.
  /// [large] the error message if an input value is too large; the default
  /// value is 'it cannot be > [max]'.
  Int.max(int max, {String? mal, String? large})
      : _val = _AsInt(mal, _Logic(max: max, l: large).call);

  /// Constrains data to negative integer numbers (zero excluded).
  ///
  /// [mal] "malformed", the error message for non-integer input values; the
  /// default value is 'non-integer input value'.
  /// [pos] the error message if an input value is positive; the default value
  /// is 'it cannot be positive'.
  Int.neg({String? mal, String? pos})
      : this.max(-1, mal: mal, large: pos ?? 'it cannot be positive');

  /// Constrains data to integer values within the range [min–max].
  ///
  /// [min] the smallest valid number; it must be < [max].
  /// [max] the largest valid number; it must be > [min].
  /// [mal] "malformed", the error message for non-integer input values; the
  /// default value is 'non-integer input value'.
  /// [small] the error message if an input value is too small; the default
  /// value is 'it cannot be < [min]'.
  /// [large] the error message if an input value is too large; the default
  /// value is 'it cannot be > [max]'.
  Int.range(int min, int max, {String? mal, String? small, String? large})
      : assert(min < max),
        _val = _AsInt(mal, _Logic(min: min, max: max, s: small, l: large).call);

  final _AsInt _val;

  /// Valid — returns null – if [input] is either integer or null.
  String? call(String? input) => _val(input);
}

class _AsInt {
  /// [mal] "malformed", the error message for non-integer input values; the
  /// default value is 'non-integer input value'.
  /// [logic] the logic to be applied to a integer input.
  _AsInt(String? mal, this._logic) : _mal = mal ?? 'non-integer input value';

  /// Logic code related to integer values.
  final String? Function(int) _logic;

  /// The error message in case of NaN input.
  final String _mal;

  /// Invokes [_logic] if [input] is num.
  String? call(String? input) {
    if (input == null) return null;

    final asInt = int.tryParse(input);
    return asInt == null ? _mal : _logic(asInt);
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
