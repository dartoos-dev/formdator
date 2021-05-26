import 'package:cpf_cnpj_validator/cnpj_validator.dart';

/// Cnpj (Cadastro Nacional de Pessoa Jurídica) rule.

/// Kind of brazilian Company's Registered Number or
/// National Registry of Legal Entities.
class Cnpj {
  final String _msg;

  const Cnpj({msg = 'Invalid cnpj.'}) : _msg = msg;

  /// Checks wheter the given value represents a valid cnpj.
  String? call(String? value) {
    return CNPJValidator.isValid(value) ? null : _msg;
  }
}
