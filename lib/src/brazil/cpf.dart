import 'package:formdator/brazil.dart';

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
    return CpfVal(cpf).isOk ? null : _malformed;
  }
}
