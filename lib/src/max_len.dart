/// Optional, not too long value.
class MaxLen {
  /// Validates an optional field with maximum length constraint.
  ///
  /// If the field is mandatory, see [Req].
  ///
  /// [length] is the maximum length.
  /// [tooLong] is the error message in case of a too long value.
  const MaxLen(int length, {required String tooLong})
      : _len = length,
        _tooLong = tooLong;

  final int _len;
  final String _tooLong;

  /// Valid - returns null - if [notTooLong] is either short enough or null.
  String? call(String? notTooLong) =>
      (notTooLong != null && notTooLong.length > _len) ? _tooLong : null;
}
