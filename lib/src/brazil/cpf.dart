import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'cpf_strip.dart';

/// CPF - Cadastro da Pessoa Física.
///
/// Kind of Brazilian SSN - Social Security Number.
///
/// If the field is mandatory, see [ReqCpf] or [Req].
class Cpf {
  /// Validates an optional CPF.
  ///
  /// [mal] the error message in case of a malformed CPF; the default value is
  /// 'malformed cpf'
  const Cpf({String? mal}) : _malformed = mal ?? 'malformed cpf';

  /// The error message.
  final String _malformed;

  /// Returns null if [cpf] is well-formed; otherwise, the erro message.
  String? call(String? cpf) {
    if (cpf == null) return null;

    final stripped = CpfStrip(cpf).value;
    if (stripped == null) return _malformed;

    return CPFValidator.isValid(stripped, false) ? null : _malformed;
  }
}
