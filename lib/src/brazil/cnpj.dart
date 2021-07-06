import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'cnpj_strip.dart';

/// CNPJ - Cadastro Nacional de Pessoa Jurídica.
///
/// Kind of brazilian Company's Registered Number or National Registry of Legal
/// Entities.
class Cnpj {
  /// Validates an optional cnpj field.
  ///
  /// [mal] is the error message in case of a malformed CNPJ; defaults to
  /// 'malformed cnpj'.
  const Cnpj({String? mal}) : _malformed = mal ?? 'malformed cnpj';

  final String _malformed;

  /// Returns null if [cnpj] is well-formed; otherwise, the erro message.
  String? call(String? cnpj) {
    if (cnpj == null) return null;

    final stripped = CnpjStrip(cnpj).value;
    if (stripped == null) return _malformed;

    return CNPJValidator.isValid(stripped, false) ? null : _malformed;
  }
}
