import 'email.dart';
import 'rules.dart';

/// Mandatory and well-formed email.
class ReqEmail {
  /// Mandatory email validator having [blank] as the message for blank fields
  /// and [invalid] for malformed ones.
  ReqEmail({String blank = 'required email', String invalid = 'invalid email'})
      : this.custom(Rules.req(blank, Email(invalid: invalid)));

  /// Fully customable constructor.
  ReqEmail.custom(this._rules);
  // The not blank and valid email rules to be applied to.
  final Rules _rules;

  /// Null if [email] is valid; the error message if blank or invalid.
  String? call(String? email) => _rules(email);
}
