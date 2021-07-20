/// Validator for mandatory input data.
///
/// It will reject null or empty input values.
///
/// **Note:** the accepted input types are String, Iterable, and Map.
class Req {
  /// Checks whether an input value is blank — that is, whether the input value
  /// is either null or empty.
  ///
  /// [blank] the error message in case of a null or empty input value; the
  /// default value is 'required'.
  const Req({String? blank}) : _blank = blank ?? 'required';

  final String _blank;

  /// Valid - returns null - if [input] is neither null nor empty.
  String? call(Object? input) =>
      (input == null || _isEmpty(input)) ? _blank : null;

  bool _isEmpty(Object input) {
    return (input is String && input.isEmpty) ||
        (input is Iterable && input.isEmpty) ||
        (input is Map && input.isEmpty);
  }
}
