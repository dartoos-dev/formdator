/// Validates an optional not too short String value.
class MinLen {
  /// Validates an optional field with minimum length constraint.
  ///
  /// [length] is the minimum length; must be >= 0.
  /// [short] is the error message in case of a too short value.
  const MinLen(int length, {String short = 'too short'})
      : assert(length >= 0),
        _len = length,
        _tooShort = short;

  final int _len;
  final String _tooShort;

  /// Valid - returns null - if [notTooShort] is either long enough or null.
  String? call(String? value) =>
      (value != null && value.length < _len) ? _tooShort : null;
}
