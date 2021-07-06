/// Equality rule - checks whether A == B.
class Equal {
  /// Validates the equality between two values.
  ///
  /// [to] the value to be compared to.
  /// [diff] the error message in case of different values; defaults to 'does
  /// not match'.
  const Equal(Object? Function() to, {String? diff})
      : _to = to,
        _diff = diff ?? 'does not match';

  final Object? Function() _to;
  final String _diff;

  /// Forwards to [call] method.
  String? to(String? value) => this(value);

  /// Valid - returns null - if [value] is equal.
  ///
  /// the [==] operator is used for comparison.
  String? call(Object? value) => value == _to() ? null : _diff;
}
