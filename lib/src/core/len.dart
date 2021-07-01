import '../type.dart';
import 'rules.dart';

/// Length-related constraints.
///
/// Valid input types: String, num, Iterable, and Map.
class Len {
  /// Defines the (exact) length of data a user can enter into a field.
  ///
  /// [len] the length of an input; it must be >= 0.
  Len(int len, {String error = "length error"})
      : assert(len >= 0),
        _lenVal = _InputLen((int length) => length != len ? error : null);

  /// Defines the minimum length of data a user can enter into a field.
  ///
  /// [min] the minimum length of an input; it must be >= 0.
  /// [short] the error message.
  Len.min(int min, {String short = 'too short'})
      : assert(min >= 0),
        _lenVal = _InputLen((int length) => length < min ? short : null);

  /// Defines the maximum length of data a user can enter into a field.
  ///
  /// [max] the maximum length of an input; it must be >= 0.
  /// [long] the error message.
  Len.max(int max, {String long = 'too long'})
      : assert(max >= 0),
        _lenVal = _InputLen((int length) => length > max ? long : null);

  /// Defines both the minimum and maximum length of data a user can enter into
  /// a field.
  ///
  /// [min] the minimum length of an input; it must be >= 0 and <= [max].
  /// [short] the error message if an input is too short.
  /// [max] the maximum length of an input; it must be >= 0 and >= [min].
  /// [long] the error message if an input is too long.
  Len.range({
    required int min,
    String short = 'too short',
    required int max,
    String long = 'too long',
  })  : assert(min <= max),
        _lenVal = Rules<Object>([
          Len.min(min, short: short),
          Len.max(max, long: long),
        ]);

  /// Performs length-related validation.
  final ObjVal _lenVal;

  /// Valid - returns null - if the length of [input] satifies the length
  /// requirement.
  ///
  /// **Note:** the type of [input] must be [String], [Iterable] or [Map].
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
