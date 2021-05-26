import 'package:validators/validators.dart';

/// Numeric only rule.
class Numeric {
  /// Non-numeric validation with [nonNumeric] error message.
  const Numeric({String nonNumeric = 'Non-numeric value'})
      : _nonNumeric = nonNumeric;

  // Error message
  final String _nonNumeric;

  /// Null if [number] is a numeric value; the error message otherwise.
  String? call(String? number) =>
      (number == null || isNumeric(number)) ? null : _nonNumeric;
}
