/// Maximum length rule.
class MaxLength {
  // The maximum length value.
  final int _len;
  // Error message.
  final String _msg;

  const MaxLength(int length, {msg = 'Maximum length exceeded.'})
      : _len = length,
        _msg = msg;

  /// Checks whether the given value has not exceeded the maximun
  /// number of characteres.
  String? call(String? value) {
    return (value != null && value.length > _len) ? _msg : null;
  }
}
