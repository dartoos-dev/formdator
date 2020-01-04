import 'rules.dart';
import 'cpf.dart';

/// Validator for not blank and well formed cpf field.

/// It combines the functionality of the [Required] and [Cpf]
/// validators.
class ReqCpf {

  // The not blank and valid cpf rules to be applied to.
  final Rules _rules;

  /// Convenience constructor.
  /// [blank] is the error message for a not filled in cpf.
  /// [invalid] is the error message for a invalid cpf.
  ReqCpf({String blank, String invalid}) :
    this.custom(Rules.req(blank, Cpf(msg: invalid)));

  /// Fully customable constructor.
  const ReqCpf.custom(this._rules);

  /// Checks whether the given value represents a filled in well
  /// formed cpf.
  String call(String value) => _rules(value);
}
