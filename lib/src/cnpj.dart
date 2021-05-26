import 'package:cpf_cnpj_validator/cnpj_validator.dart';

/// Cnpj (Cadastro Nacional de Pessoa Jurídica) rule.

/// Kind of brazilian Company's Registered Number or
/// National Registry of Legal Entities.
class Cnpj {
  /// Cnpj validator with [invalid] as the error message.
  const Cnpj({String invalid = 'Invalid cnpj'}) : _invalid = invalid;

  // The error message.
  final String _invalid;

  /// Returns null if [cnpj] is valid; the error message otherwise.
  String? call(String? cnpj) => CNPJValidator.isValid(cnpj) ? null : _invalid;
}
