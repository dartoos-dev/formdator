/// Constrains input data values to a certain text pattern.
class Match {
  /// Constrains input data to values that the pattern [pattern] has a match.
  ///
  /// [mis] the error message in case of a mismatch between the input data and
  /// [pattern]; the default value is 'mismatch'.
  Match(String pattern, {String? mis}) : this.regExp(RegExp(pattern), mis: mis);

  /// Constrains input data to values that the regular expression [regExp] has a
  /// match.
  ///
  /// [mis] the error message in case of a mismatch between the input data and
  /// [pattern]; the default value is 'mismatch'.
  Match.regExp(RegExp rexExp, {String? mis})
      : _pattern = rexExp,
        _mismatch = mis ?? 'mismatch';

  /// The error message.
  final String _mismatch;

  /// The text pattern.
  final RegExp _pattern;

  /// Valid - returns null - if the text pattern has a match in [input].
  String? call(String? input) {
    return (input != null && !_pattern.hasMatch(input)) ? _mismatch : null;
  }
}
