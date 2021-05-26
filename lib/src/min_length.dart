/// Minimum length rule.
class MinLength {
  /// Minimum length validation with [tooShort] as the error message.
  const MinLength(int length, {String tooShort = 'Minimum length required.'})
      : _len = length,
        _tooShort = tooShort;

  // The minimum length value.
  final int _len;
  // Error message.
  final String _tooShort;

  /// Null if [notTooShort] is not long enough; the error message otherwise.
  String? call(String? notTooShort) =>
      (notTooShort != null && notTooShort.length < _len) ? _tooShort : null;
}
