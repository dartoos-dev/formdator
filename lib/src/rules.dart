import 'req.dart';
import 'type.dart';

/// Multiple rules applied to a field.
class Rules {
  /// Validates with the given rules.
  const Rules(this._rules);

  /// Required and custom validation.
  ///
  /// It is useful when two rules must be applied and the first one is the
  /// non-blank.
  ///
  /// [blank] is the error message in case of null or empty value.
  /// [val] is the second validator.
  Rules.req(String blank, Callor val) : this([Req(blank: blank), val]);

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
