import 'package:formdator/formdator.dart';

/// Length-related constraints.
///
/// Valid input types: [String], [num], [Iterable], and [Map].
class Len {
  /// Constrains the length or quantity of data items.
  ///
  /// [len] the length or number of items; it must be >= 0.
  /// [diff] the error message if the length or number of data items is
  /// different from [len]; the default value is 'the length or qty. must be
  /// $len'.
  Len(int len, {String? diff})
      : assert(len >= 0),
        _lenVal = _InputLen(
          (int l) =>
              l != len ? diff ?? 'the length or qty. must be $len' : null,
        );

  /// Constrains the length or number of data items to a minimum amount.
  ///
  /// [min] the minimum number of items; it must be > 0.
  /// [less] the error message if the length or number of items is < [min]; the
  /// default value is 'the length or qty. cannot be < $min'
  Len.min(int min, {String? less})
      : assert(min > 0),
        _lenVal = _InputLen(
          (int len) =>
              len < min ? less ?? 'the length or qty. cannot be < $min' : null,
        );

  /// Constrains the length or number of data items to a maximum amount.
  ///
  /// [max] the maximum number of items; it must be > 0.
  /// [great] the error message if the length or number of items is > [max]; the
  /// default value is 'the length or qty. cannot be > [max]'.
  Len.max(int max, {String? great})
      : assert(max > 0),
        _lenVal = _InputLen(
          (int len) =>
              len > max ? great ?? 'the length or qty. cannot be > $max' : null,
        );

  /// Constrains the length or number of data items within the range [min–max].
  ///
  /// [min] the lower limit; it must be > 0 and < [max].
  /// [max] the upper limit; it must be > 0 and > [min].
  /// [less] the error message if the length or number of items is < [min]; the
  /// default value is 'the length or qty. cannot be < [min]'
  /// [great] the error message if the length or number of items is > [max]; the
  /// default value is 'the length or qty. cannot be > [max]'.
  Len.range(int min, int max, {String? less, String? great})
      : assert(min < max),
        _lenVal = Pair(
          Len.min(min, less: less),
          Len.max(max, great: great),
        );

  // Performs length-related validation.
  final ValObj _lenVal;

  /// Valid - returns null - if the length of [input] satisfies the length
  /// requirement.
  ///
  /// **Note:** the type of [input] must be [String], [num], [Iterable] or
  /// [Map].
  String? call(Object? input) => _lenVal(input);
}

/// Input Length.
class _InputLen {
  /// encapsulates a length-related logic function.
  _InputLen(this._logic);

  /// Logic code related to input length.
  final String? Function(int) _logic;

  /// Invokes [_logic] if [input] is String, num, Iterable or Map; throws
  /// [ArgumentError] otherwise.
  String? call(Object? input) {
    if (input == null) return null;

    if (input is String) {
      return _logic(input.length);
    } else if (input is num) {
      return _logic(input.toString().length);
    } else if (input is Iterable) {
      return _logic(input.length);
    } else if (input is Map) {
      return _logic(input.length);
    }
    throw ArgumentError.value(
      input,
      'input',
      'input type other than String, num, Iterable, or Map',
    );
  }
}
