import '../type.dart';
import 'rules.dart';

/// Length-related constraints.
///
/// Valid input types: [String], [num], [Iterable], and [Map].
class Len {
  /// Defines the (exact) length of data.
  ///
  /// [len] the length of the input data; it must be >= 0.
  /// [error] the error message if the length of the input data != [len].
  Len(int len, {String? error})
      : assert(len >= 0),
        _lenVal =
            _InputLen((int l) => l != len ? error ?? 'length error' : null);

  /// Defines the shortest length of data.
  ///
  /// [min] the shortest length of the input data; it must be >= 0.
  /// [short] the error message if the length of the input data is < [min].
  Len.min(int min, {String? short})
      : assert(min >= 0),
        _lenVal = _InputLen((int l) => l < min ? short ?? 'too short' : null);

  /// Defines the longest length of data.
  ///
  /// [max] the longest length of the input data; it must be >= 0.
  /// [long] the error message if the length of the input data is > [max].
  Len.max(int max, {String? long})
      : assert(max >= 0),
        _lenVal = _InputLen((int l) => l > max ? long ?? 'too long' : null);

  /// Defines both the shortest and longest length of the input data.
  ///
  /// [min] the minimum length of an input; it must be >= 0 and <= [max].
  /// [max] the maximum length of an input; it must be >= 0 and >= [min].
  /// [short] the error message if the length of the input data is < [min].
  /// [long] the error message if the length of the input data is > [max].
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
  /// **Note:** the type of [input] must be [String], [num],[Iterable] or [Map].
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
