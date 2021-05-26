/// Maximum length rule.
class MaxLength {
  /// Text values not longer than [length]; [tooLong] as the error message.
  const MaxLength(int length, {String tooLong = 'Maximum length exceeded'})
      : _len = length,
        _tooLong = tooLong;

  // Maximum length.
  final int _len;
  // Error message.
  final String _tooLong;

  /// Null if [notTooLong] is longer; the error message otherwise.
  String? call(String? notTooLong) =>
      (notTooLong != null && notTooLong.length > _len) ? _tooLong : null;
}
