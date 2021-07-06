/// Mandatory input data.
///
/// It will reject null or empty input data.
class Req {
  /// Non-blank field.
  ///
  /// [blank] the error message in case of null or empty input data; defaults to
  /// 'required'.
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
