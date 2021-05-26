/// Input field must be filled out before submitting the form.
class Required {
  /// Mandatory field with [blank] error message.
  const Required({String blank = 'Required field'}) : _blank = blank;

  /// Error message.
  final String _blank;

  /// Null if [value] is not blank - filled in; the error message otherwise.
  String? call(String? value) {
    return value == null || value.isEmpty ? _blank : null;
  }
}
