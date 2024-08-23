import 'package:formdator/formdator.dart';

/// Required CEP — Código de Endereçamento Postal.
///
/// It is the Brazilian equivalent of zip/postal code.
class ReqCep {
  /// Validates CEP input values.
  ///
  /// [blank] the error message in case of a null or empty CEP value.
  /// [mal] the error message in case of a malformed CEP value.
  ///
  /// For de default values of [blank] and [mal], see [Req] and [Cep].
  ReqCep({String? blank, String? mal})
      : _reqCep = Pair.str2(Req(blank: blank).call, Cep(mal: mal).call);

  final Pair _reqCep;

  /// Checks that [cep] is neither blank nor malformed.
  ///
  /// Returns null if [cep] is a non-blank valid CEP value; otherwise, the error
  /// message.
  String? call(String? cep) => _reqCep(cep);
}
