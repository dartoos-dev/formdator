import '../type.dart';
import 'rules.dart';

/// Length-related constraints.
///
/// Valid input types: [String], [num], [Iterable], and [Map].
class Len {
  /// Defines the (exact) length of input data.
  ///
  /// [len] the length of input data; it must be >= 0.
  /// [error] the error message if input data length != [len]; defaults to
  /// 'length error'.
  Len(int len, {String? error})
      : assert(len >= 0),
        _lenVal =
            _InputLen((int l) => l != len ? error ?? 'length error' : null);

  /// Defines the shortest length of input data.
  ///
  /// [min] the shortest length of input data; it must be >= 0.
  /// [short] the error message if input data length < [min]; defaults to 'too
  /// short'.
  Len.min(int min, {String? short})
      : assert(min >= 0),
        _lenVal = _InputLen((int l) => l < min ? short ?? 'too short' : null);

  /// Defines the longest length of input data.
  ///
  /// [max] the longest length of input data; it must be >= 0.
  /// [long] the error message if input data length > [max]; defaults to 'too
  /// large'.
  Len.max(int max, {String? long})
      : assert(max >= 0),
        _lenVal = _InputLen((int l) => l > max ? long ?? 'too long' : null);

  /// Defines a range for the length of input data.
  ///
  /// [min] the shortest length of input data; it must be >= 0.
  /// [max] the longest length of input data; it must be >= 0.
  /// [short] the error message if input data length < [min]; defaults to 'too
  /// short'.
  /// [long] the error message if input data length > [max]; defaults to 'too
  /// large'.
  Len.range(int min, int max, {String? short, String? long})
      : assert(min <= max),
        _lenVal = Rules<Object>([
          Len.min(min, short: short),
          Len.max(max, long: long),
        ]);

  /// Performs length-related validation.
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
