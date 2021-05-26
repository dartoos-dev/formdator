import 'package:cpf_cnpj_validator/cpf_validator.dart';

/// Cpf Cadastro da Pessoa Física rule.
///
/// Kind of Brazilian SSN - Social Security Number.
class Cpf {
  /// Cpf validator with [invalid] as the error message.
  const Cpf({String invalid = 'Invalid cpf'}) : _invalid = invalid;

  // The invalid message.
  final String _invalid;

  /// Returns null if [cpf] is valid; the error message otherwise.
  String? call(String? cpf) => CPFValidator.isValid(cpf) ? null : _invalid;
}
