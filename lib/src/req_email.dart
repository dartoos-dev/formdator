import 'required.dart';
import 'email.dart';
import 'rules.dart';
import 'type.dart';

/// Validator for not blank and well formed email field.

/// It combines the functionality of the [Required] and [Email]
/// validators.
class ReqEmail {

  // The not blank and valid email rules to be applied to.
  final Rules _rules;

  /// Convenience constructor.
  /// [blank] is the error message for a not filled in email.
  /// [invalid] is the error message for a invalid email.
  ReqEmail({String blank, String invalid}) :
    this.custom(Rules.req(blank, Email(msg: invalid)));
 
  /// Fully customable constructor.
  ReqEmail.custom(this._rules);

  /// Checks whether the value is a non-blank and well formed email.
  String call(String value) => _rules(value);
}
