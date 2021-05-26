import 'package:validators/validators.dart';

/// Numeric only rule.
class Numeric {
  // Error message
  final String _msg;

  const Numeric({String msg = 'Non-numeric value'}) : _msg = msg;

  ///Checks whether the given value is numeric.
  String? call(String? value) {
    return (value == null || isNumeric(value)) ? null : _msg;
  }
}
