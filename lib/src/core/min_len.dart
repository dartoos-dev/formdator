/// Optional not too short value.
class MinLen {
  /// Validates an optional field with minimum length constraint.
  ///
  /// [length] is the minimum length.
  /// [short] is the error message in case of a too short value.
  const MinLen(int length, {required String short})
      : _len = length,
        _tooShort = short;

  final int _len;
  final String _tooShort;

  /// Valid - returns null - if [notTooShort] is either long enough or null.
  String? call(String? notTooShort) =>
      (notTooShort != null && notTooShort.length < _len) ? _tooShort : null;
}
