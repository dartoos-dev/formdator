import 'cpf.dart';
import 'rules.dart';

/// Mandatory CPF - Cadastro da Pessoa Física.
///
/// Kind of Brazilian SSN - Social Security Number.
class ReqCpf {
  /// It combines both the [Req] and [Cpf] validators.
  ///
  /// [blank] is the error message for a null or empty cpf; [invalid], for an
  /// invalid one.
  ReqCpf({required String blank, required String invalid})
      : _nonBlankValid = Rules.req(blank, Cpf(invalid: invalid));

  final Rules _nonBlankValid;

  /// Valid - returns null - if [cpf] is valid.
  String? call(String? cpf) => _nonBlankValid(cpf);
}
