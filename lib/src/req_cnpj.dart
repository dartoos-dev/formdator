import 'cnpj.dart';
import 'rules.dart';

/// Mandatory CNPJ - (Cadastro Nacional de Pessoa Jurídica).
///
/// Kind of brazilian Company's Registered Number or National Registry of Legal
/// Entities.
class ReqCnpj {
  /// It combines both the [Req] and [Cnpj] validators.
  ///
  /// [blank] is the error message in case of a null or empty value; [invalid],
  /// in case of an invalid one.
  ReqCnpj({required String blank, required String invalid})
      : _nonBlankValid = Rules.req(blank, Cnpj(invalid: invalid));

  final Rules _nonBlankValid;

  /// Valid - returns null - if cnpj is valid.
  String? call(String? cnpj) => _nonBlankValid(cnpj);
}
