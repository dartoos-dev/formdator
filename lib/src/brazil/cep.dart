import 'package:formdator/brazil.dart';

/// CEP — Código de Endereçamento Postal.
///
/// It is the Brazilian equivalent of zip/postal code.
///
/// Blank field — null value — is a valid input value! If the field is required,
/// see [ReqCep] or [Req].
class Cep {
  /// Validates CEP input values.
  ///
  /// [mal] the error message in case of a malformed CEP; the default value is
  /// 'malformed cep'.
  const Cep({String? mal}) : _malformed = mal ?? 'malformed cep';

  final String _malformed;

  /// Checks whether [cep] is a well-formed CEP value.
  ///
  /// Returns null if [cep] is a valid CEP value; otherwise, the error message.
  String? call(String? cep) {
    if (cep == null) return null;

    return CepStrip(cep).value == null ? _malformed : null;
  }
}
