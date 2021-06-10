/// Equality rule - checks whether A == B.
class Equal {
  /// Validates the equality between two values.
  ///
  /// [origin] the original value to be compared to.
  /// [diff] the error message in case of different values.
  const Equal(String origin, {required String diff})
      : _origin = origin,
        _diff = diff;

  final String _origin;
  final String _diff;

  /// Forwards to [call] method.
  String? to(String? value) => this(value);

  /// Valid - returns null - if [to] has the expected value.
  ///
  /// the [==] operator is used for comparison.
  String? call(String? to) => to == _origin ? null : _diff;
}
