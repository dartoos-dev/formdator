import 'package:formdator/formdator.dart';

/// Plano Brasileiro de Numeração de Telefones Fixos Para Campos Obrigatório.
///
/// Brazilian Landline Numbering Plan for Required Fields.
///
/// Brazil's telephone numbering plan uses a two-digit area code plus
/// eight-digit local telephone numbers for landlines. Typically, a number is
/// masked as (AA) NNNN-NNNN, where AA = area code and N = digit [0–9]. For
/// example:
///
/// - unmasked (plain) number: "1124654321".
/// - unmasked with country code prefix: "+551124654321".
/// - masked number: "(11) 2465-4321".
class ReqBrPhone {
  /// Validates masked and unmasked (with or without '+55' prefix) Brazilian
  /// landline numbers.
  ///
  /// [blank] the error message in case of a null or empty BrPhone number.
  /// [mal] the error message in case of a malformed number.
  ReqBrPhone({String? blank, String? mal})
      : _reqBrPhone = Pair.str2(Req(blank: blank), BrPhone(mal: mal));

  final Pair _reqBrPhone;

  /// Checks whether the [brPhone] value is either blank or malformed.
  ///
  /// Returns null if the [brPhone] value is a valid non-blank BrPhone number;
  /// otherwise, the error message.
  String? call(String? brPhone) => _reqBrPhone(brPhone);
}
