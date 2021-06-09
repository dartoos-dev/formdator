import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'cnpj_stripped.dart';

/// CNPJ - Cadastro Nacional de Pessoa Jurídica.
///
/// Kind of brazilian Company's Registered Number or National Registry of Legal
/// Entities.
class Cnpj {
  /// Validates an optional cnpj field.
  ///
  /// Blank field - null value - is a valid input!  If the field is mandatory,
  /// see [Req].
  ///
  /// [malformed] is the error message in case of a malformed CNPJ.
  const Cnpj({required String malformed}) : _malformed = malformed;

  final String _malformed;

  /// Returns null if [cnpj] is well-formed; the erro message otherwise.
  String? call(String? cnpj) {
    return (cnpj == null ||
            CNPJValidator.isValid('${CnpjStripped(cnpj)}', false))
        ? null
        : _malformed;
  }
}
