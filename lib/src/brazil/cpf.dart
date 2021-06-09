import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'cpf_stripped.dart';

/// CPF - Cadastro da Pessoa Física.
///
/// Kind of Brazilian SSN - Social Security Number.
///
/// Blank field - null value - is a valid input!
///
/// If the field is mandatory, see [Req].
class Cpf {
  /// Validates an optional cpf field.
  ///
  /// [invalid] is the error message in case of an malformed CPF.
  const Cpf({required String malformed}) : _malformed = malformed;

  final String _malformed;

  /// Valid - returns null - if [cpf] is either valid or null.
  String? call(String? cpf) {
    return (cpf == null || CPFValidator.isValid('${CpfStripped(cpf)}', false))
        ? null
        : _malformed;
  }
}
