import 'required.dart';
import 'type.dart';

/// Represents multiple rules applied to an text field.
class Rules {
  /// Rules with the given rules to apply.
  const Rules(this._rules);

  ///Special case constructor.
  ///It is useful when two rules must be applied and the first one
  ///is the required filled. (a field that cannot be null or blank)
  ///[blank] is the error message for a not filled in field.
  ///[val] is the second validator.
  Rules.req(String blank, Val val) : this([Required(blank: blank), val]);

  final List<Val> _rules;

  /// Null if [value] is valid for all rules; the erro message otherwise.
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
