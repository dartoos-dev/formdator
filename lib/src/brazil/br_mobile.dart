import 'br_mobile_strip.dart';

/// Plano Brasileiro de Numeração Móvel.
///
/// Brazilian Mobile Numbering Plan.
///
/// Brazil's mobile numbering plan uses a two-digit area code plus nine-digit
/// local numbers. Typically, a number is masked as (AA) NNNNN-NNNN, where AA =
/// area code and N = digit [0–9]. For example:
///
/// - unmasked (plain) number: "11987654321".
/// - unmasked with country code prefix: "+5511987654321".
/// - masked number: "(11) 98765-4321".
///
/// References:
///
/// - [br numbering plan](https://en.wikipedia.org/wiki/Telephone_numbers_in_Brazil)
/// - [br form masks](http://opensource.locaweb.com.br/locawebstyle-v2/manual/formularios/mascaras-forms/)
class BrMobile {
  /// Validates masked and unmasked (with or without '+55' prefix) Brazilian
  /// mobile numbers.
  ///
  /// [mal] the error message in case of a malformed number; the default value
  /// is 'malformed number'.
  const BrMobile({String? mal}) : _malformed = mal ?? 'malformed number';

  final String _malformed;

  /// Checks whether [brMobile] is well-formed.
  ///
  /// Returns null if [brMobile] is a valid Brazilian phone number; otherwise,
  /// the error message.
  String? call(String? brMobile) {
    if (brMobile == null) return null;
    return BrMobileStrip(brMobile).value == null ? _malformed : null;
  }
}
