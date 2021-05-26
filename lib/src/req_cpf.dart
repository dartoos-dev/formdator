import 'cpf.dart';
import 'rules.dart';

/// Validator for not blank and well formed cpf field.

/// It combines the functionality of the [Required] and [Cpf]
/// validators.
class ReqCpf {
  /// Convenience constructor.
  /// [blank] is the error message for a not filled in cpf.
  /// [invalid] is the error message for a invalid cpf.
  ReqCpf({String blank = 'required field', String invalid = 'invalid cpf'})
      : this.custom(Rules.req(blank, Cpf(invalid: invalid)));

  /// Fully customable constructor.
  const ReqCpf.custom(this._rules);

  // The not blank and valid cpf rules to be applied to.
  final Rules _rules;

  /// Checks whether the given value represents a filled in well
  /// formed cpf.
  String? call(String? cpf) => _rules(cpf);
}
