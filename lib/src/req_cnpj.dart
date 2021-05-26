import 'cnpj.dart';
import 'rules.dart';

/// Validator for not blank and well formed cnpj field.

/// It combines the functionality of the [Required] and [Cpf]
/// validators.
class ReqCnpj {
  /// Convenience constructor.
  /// [blank] is the error message for a not filled in cnpj.
  /// [invalid] is the error message for a invalid cnpj.
  ReqCnpj({String blank = 'required field', String invalid = 'invalid cnpj'})
      : this.custom(Rules.req(blank, Cnpj(invalid: invalid)));

  /// Fully customable constructor.
  const ReqCnpj.custom(this._rules);

  // The not blank and valid cnpj rules to be applied to.
  final Rules _rules;

  /// Checks whether the value is a non-blank and well formed cnpj.
  String? call(String? cnpj) => _rules(cnpj);
}
