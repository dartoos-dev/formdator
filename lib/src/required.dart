/// Input field must be filled out before submitting the form.
class Required {
  // Error message.
  final String _msg;

  const Required({String msg = 'Required field.'}) : _msg = msg;

  /// Checks whether the given value is neither null nor empty.

  /// Returns null if value is valid; null otherwise.
  String? call(String? value) {
    return value == null || value.isEmpty ? _msg : null;
  }
}
