import 'package:formdator/formdator.dart';

/// Plano Brasileiro de Numeração Móvel Para Campos Obrigatórios.
///
/// Brazilian Mobile Numbering Plan for Required Fields.
///
/// Brazil's mobile numbering plan uses a two-digit area code plus nine-digit
/// local numbers. Typically, a number is masked as (AA) NNNNN-NNNN, where AA =
/// area code and N = digit [0–9]. For example:
///
/// - unmasked (plain) number: "11987654321".
/// - unmasked with country code prefix: "+5511987654321".
/// - masked number: "(11) 98765-4321".
class ReqBrMobile {
  /// Validates masked and unmasked (with or without '+55' prefix) Brazilian
  /// mobile numbers.
  ///
  /// [blank] the error message in case of a null or empty mobile number.
  /// [mal] the error message in case of a malformed number.
  ReqBrMobile({String? blank, String? mal})
      : _reqBrMobile =
            Pair.str2(Req(blank: blank).call, BrMobile(mal: mal).call);

  final Pair _reqBrMobile;

  /// Checks whether the [brMobile] value is either blank or malformed.
  ///
  /// Returns null if the [brMobile] value is a valid non-blank mobile number;
  /// otherwise, the error message.
  String? call(String? brMobile) => _reqBrMobile(brMobile);
}
