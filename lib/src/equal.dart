/// The original String value.
typedef Original = String Function();

/// Equality rule.
class Equal {
  // Something that retrieves the original value to be compared to.
  final Original _original;
  // Error message.
  final String _msg;

  static const _defaultMsg = 'Does not match.';

  /// The original message will be retrieved by calling obj.toString
  Equal(Object obj, {msg = _defaultMsg}) :
    this.origin(obj.toString, msg: msg);

  /// Main constructor.
  Equal.origin(Original original, {msg = _defaultMsg}) :
    _original = original,
    _msg = msg;

  ///Checks whether the given value is equal to the original one.
  String call(String value) {
    return value == _original()? null : _msg;
  }
}

