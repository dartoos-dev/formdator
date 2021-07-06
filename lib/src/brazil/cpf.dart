import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'cpf_strip.dart';

/// CPF - Cadastro da Pessoa Física.
///
/// Kind of Brazilian SSN - Social Security Number.
///
/// Blank field - null value - is a valid input!
///
/// If the field is mandatory, see [Req].
class Cpf {
  /// Validates an optional cpf input.
  ///
  /// [mal] is the error message in case of a malformed CPF; defaults to
  /// 'malformed cpf'
  const Cpf({String? mal}) : _malformed = mal ?? 'malformed cpf';

  final String _malformed;

  /// Returns null if [cpf] is well-formed; otherwise, the erro message.
  String? call(String? cpf) {
    if (cpf == null) return null;

    final stripped = CpfStrip(cpf).value;
    if (stripped == null) return _malformed;

    return CPFValidator.isValid(stripped, false) ? null : _malformed;
  }
}
