import 'type.dart';
import 'required.dart';

/// Represents multiple rules applied to an text field.
class Rules {
  final List<Val> _rules;

  ///Special case constructor.
  ///It is useful when two rules must be applied and the first one
  ///is the required filled. (a field that cannot be null or blank)
  ///[blank] is the error message for a not filled in field.
  ///[val] is the second validator.
  Rules.req(String blank, Val val) : this([Required(msg: blank), val]);

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
