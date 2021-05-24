import 'package:validators/validators.dart';

/// Well formed email rule.
class Email {
  final String _msg;

  const Email({String msg = 'Invalid email.'}) : _msg = msg;

  /// Checks whether the given value is a well formed email.
  String call(String value) {
    return isEmail(value) ? null : _msg;
  }
}
