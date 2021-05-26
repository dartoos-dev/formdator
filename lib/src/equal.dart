/// Equality rule
class Equal {
  /// Equality having [origin] as the value to be compared to and [diff] as the
  /// error message.
  const Equal(String origin, {String diff = 'Does not match'})
      : _origin = origin,
        _diff = diff;

  // The original value to be compared to.
  final String _origin;
  // Error message.
  final String _diff;

  /// Forwards to [call] method.
  String? to(String? value) => this(value);

  /// Null if the values are equal; the error message otherwise.
  ///
  /// It uses the [==] operator for comparison.
  String? call(String? value) => value == _origin ? null : _diff;
}
