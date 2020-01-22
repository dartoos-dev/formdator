/// Equality rule.
class Equal {
  // The original value to be compared to.
  final String _origin;
  // Error message.
  final String _msg;

  /// Main constructor.
  const Equal(String origin, {String diff = 'Does not match.'})
    : _origin = origin,
      _msg = diff;

  ///Checks whether the given value is equal to the original one.
  String call(String value) => value == _origin? null : _msg;
}

