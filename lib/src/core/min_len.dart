/// Minimum length constraint.
///
/// Valid input types: String, Iterable and Map.
class MinLen {
  /// Defines the minimum length of data a user can enter into an optional
  /// field; if the field is required, see [Req].
  ///
  /// The input will fail constraint validation if the length of the input value
  /// is less than [length].
  /// [length] is the minimum length of the input; it must be >= 0.
  /// [short] the error message.
  const MinLen(int length, {String short = 'too short'})
      : assert(length >= 0),
        _len = length,
        _tooShort = short;

  final int _len;
  final String _tooShort;

  /// Valid - returns null - if [input] is either long enough or null.
  ///
  /// **Note:** the type of [input] must be [String], [Iterable] or [Map].
  String? call(Object? input) {
    if (input == null) return null;

    if (input is String) {
      return _validate(input.length);
    } else if (input is Iterable) {
      return _validate(input.length);
    } else if (input is Map) {
      return _validate(input.length);
    }
    throw ArgumentError.value(
      input,
      'input',
      'input type other than String, Iterable, or Map',
    );
  }

  String? _validate(int length) => length < _len ? _tooShort : null;
}
