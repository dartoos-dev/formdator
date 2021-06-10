import 'type.dart';

/// Multiple rules applied to a field.
class Rules {
  /// Validates with the given rules.
  Rules(this._rules);

  final List<Callor> _rules;

  /// Valid - returns null - if [value] is valid for all rules.
  String? call(String? value) {
    String? msg;
    for (final rule in _rules) {
      msg = rule(value);
      if (msg != null) {
        break;
      }
    }
    return msg;
  }
}
