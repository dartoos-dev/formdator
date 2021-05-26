import 'numeric.dart';
import 'required.dart';
import 'rules.dart';

/// Validator for not blank and digits-only numeric field.

/// It combines the functionality of the [Required] and [Numeric]
/// validators.
class ReqNum {
  /// Convenience constructor.
  /// [blank] is the error message for a not filled in numeric field.
  /// [invalid] is the error message for a invalid numeric value.
  ReqNum(
      {String blank = 'required value',
      String nonNumeric = 'non-numeric value'})
      : this.custom(Rules.req(blank, Numeric(nonNumeric: nonNumeric)));

  /// Fully customable constructor.
  ReqNum.custom(this._rules);

  // The not blank and valid email rules to be applied to.
  final Rules _rules;

  /// Checks whether the value is a non-blank and valid numeric value.
  String? call(String? value) => _rules(value);
}
