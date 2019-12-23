/// Minimum length rule.
class MinLength {

  // The minimum length value.
  final int _len;
  // Error message.
  final String _msg;

  const MinLength(int length, {msg='Minimum length required.'}) :
    _len = length,
    _msg =  msg; 

  /// Checks whether the given value has a minimum number of
 /// characteres.
  String call(String value) {
    return value.length < _len ? _msg : null;
  }
}
