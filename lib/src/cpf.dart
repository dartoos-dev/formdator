import 'package:cpf_cnpj_validator/cpf_validator.dart';

/// Optional CPF - Cadastro da Pessoa Física.
///
/// Kind of Brazilian SSN - Social Security Number.
///
/// ** Blank field - null value - is a valid input!**.
///
/// If the field is mandatory, use [ReqCpf].
class Cpf {
  /// Validates an optional cpf field.
  ///
  /// [invalid] is the error message in case of an invalid CPF.
  const Cpf({required String invalid}) : _invalid = invalid;

  final String _invalid;

  /// Valid - returns null - if [cpf] is either valid or null.
  String? call(String? cpf) =>
      (cpf == null || CPFValidator.isValid(cpf)) ? null : _invalid;
}
