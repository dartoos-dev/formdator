import 'type.dart';

/// Represents multiple rules applied to an text field.
class Rules {

  final List<Val> _rules;

  const Rules(this._rules);

  /// Checks wether the value is valid for all rules.

  /// Returns the rule message if value is invalid; null otherwise.
  String call(String value) {
    String msg;
    for (final rule in _rules) {
      msg = rule(value);
      if (msg != null) {
        break;
      }
    }
    return msg;
  }
}
