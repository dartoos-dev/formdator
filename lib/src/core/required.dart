/// Validator for mandatory input data.
///
/// It will reject null or empty input values.
///
/// **Note:** the accepted input types are [String], [Iterable], and [Map].
class Required {
  /// Sets the error message for blank input.
  const Required({this.ifBlank = 'required'});

  /// The error message in case of a null or empty input value.
  final String ifBlank;

  /// Valid — returns null — if [input] is neither null nor empty.
  String? call(Object? input) =>
      (input == null || _isEmpty(input)) ? ifBlank : null;

  bool _isEmpty(Object input) {
    return (input is String && input.isEmpty) ||
        (input is Iterable && input.isEmpty) ||
        (input is Map && input.isEmpty);
  }
}
