import 'package:formdator/formdator.dart';

/// Required CPF - Cadastro da Pessoa Física.
///
/// Kind of Brazilian SSN - Social Security Number.
class ReqCpf {
  /// Validates a CPF value.
  ///
  /// [blank] the error message in case of an empty or null CPF.
  /// [mal] the error message in case of a malformed CPF
  ReqCpf({String? blank, String? mal})
      : _reqCpfVal = Pair.str2(Req(blank: blank).call, Cpf(mal: mal).call);

  /// The required CPF validation logic.
  final Pair _reqCpfVal;

  /// Returns null if [cnpj] is non-blank and well-formed; otherwise, the erro
  /// message.
  String? call(String? cpf) => _reqCpfVal(cpf);
}
