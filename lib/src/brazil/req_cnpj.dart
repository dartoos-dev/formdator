import 'package:formdator/brazil.dart';
import 'package:formdator/core.dart';

/// Required CNPJ - Cadastro Nacional de Pessoa Jurídica.
///
/// Kind of Brazilian Company's Registered Number or National Registry of Legal
/// Entities.
class ReqCnpj {
  /// Validates a CNPJ value.
  ///
  /// [blank] the error message in case of a empty or null CNPJ.
  /// [mal] the error message in case of a malformed CNPJ.
  ReqCnpj({String? blank, String? mal})
      : _reqCnpjVal = Pair.str2(Req(blank: blank).call, Cnpj(mal: mal).call);

  /// The required CNPJ validation logic.
  final Pair _reqCnpjVal;

  /// Returns null if [cnpj] is non-blank and well-formed; the erro message
  /// otherwise.
  String? call(String? cnpj) => _reqCnpjVal(cnpj);
}
