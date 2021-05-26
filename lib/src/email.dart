import 'package:validators/validators.dart';

/// Well formed email rule.
class Email {
  /// Email validator with [invalid] as the error message.
  const Email({String invalid = 'Invalid email'}) : _invalid = invalid;

  // The error message.
  final String _invalid;

  /// Returns null if [email] is valid; the error message otherwise.
  String? call(String? email) =>
      (email == null || isEmail(email)) ? null : _invalid;
}
