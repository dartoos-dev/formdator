/// Validates an optional not too long String value.
class MaxLen {
  /// Validates an optional field with maximum length constraint.
  ///
  /// If the field is mandatory, see [Req].
  ///
  /// [length] is the maximum length; must be >= 0.
  /// [long] is the error message in case of a too long value.
  const MaxLen(int length, {String long = 'too long'})
      : assert(length >= 0),
        _len = length,
        _tooLong = long;

  final int _len;
  final String _tooLong;

  /// Valid - returns null - if [value] is either short enough or null.
  String? call(String? value) =>
      (value != null && value.length > _len) ? _tooLong : null;
}
