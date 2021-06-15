/// Mandatory field.
///
/// **Note:** both the **null** value and empty are **invalid inputs**.
class Req {
  /// Non-blank field.
  ///
  /// [blank] is the error message in case of a null or empty input.
  const Req({String blank = 'required'}) : _blank = blank;

  final String _blank;

  /// Valid - returns null - if [value] is neither null nor empty.
  String? call(Object? value) =>
      (value == null || _isEmpty(value)) ? _blank : null;

  bool _isEmpty(Object value) {
    return (value is String && value.isEmpty) ||
        (value is Iterable && value.isEmpty) ||
        (value is Map && value.isEmpty);
  }
}
