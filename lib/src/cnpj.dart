import 'package:cpf_cnpj_validator/cnpj_validator.dart';

/// Optional CNPJ - Cadastro Nacional de Pessoa Jurídica.
///
/// Kind of brazilian Company's Registered Number or National Registry of Legal
/// Entities.
///
/// ** Blank field - null value - is a valid input!**.
///
/// If the field is mandatory, use [ReqCnpj].
class Cnpj {
  /// Validates an optional cnpj field.
  ///
  /// [invalid] is the error message in case of an invalid CNPJ.
  const Cnpj({required String invalid}) : _invalid = invalid;

  final String _invalid;

  /// Valid - returns null - if [cnpj] is either valid or null.
  String? call(String? cnpj) =>
      (cnpj == null || CNPJValidator.isValid(cnpj)) ? null : _invalid;
}
