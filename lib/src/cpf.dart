import 'package:cpf_cnpj_validator/cpf_validator.dart';

/// Cpf Cadastro da Pessoa Física rule.

/// Kind of Brazilian SSN - Social Security Number.
class Cpf {
  final String _msg;

  const Cpf({String msg = 'Invalid cpf.'}) : _msg = msg;

  /// Checks whether the given value represents a valid cpf.
  /// (Kind of Brazilian Social Security Number - SSN).
  String? call(String? value) {
    return CPFValidator.isValid(value) ? null : _msg;
  }
}
