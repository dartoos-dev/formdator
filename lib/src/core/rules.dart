import 'package:callor/callor.dart';

/// Multiple rules applied to a field.
class Rules {
  /// Validates with the given rules.
  const Rules(this._rules);

  final List<StrVal> _rules;

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
