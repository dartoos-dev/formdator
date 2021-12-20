import 'package:formdator/brazil.dart';

/// Plano Brasileiro de Numeração de Telefones Fixos.
///
/// Brazilian Landline Numbering Plan.
///
/// Brazil's telephone numbering plan uses a two-digit area code plus
/// eight-digit local telephone numbers for landlines. Typically, a number is
/// masked as (AA) NNNN-NNNN, where AA = area code and N = digit [0–9]. For
/// example:
///
/// - unmasked (plain) number: "1124654321".
/// - unmasked with country code prefix: "+551124654321".
/// - masked number: "(11) 2465-4321".
///
/// References:
///
/// - [br numbering plan](https://en.wikipedia.org/wiki/Telephone_numbers_in_Brazil)
/// - [br form masks](http://opensource.locaweb.com.br/locawebstyle-v2/manual/formularios/mascaras-forms/)
class BrPhone {
  /// Validates masked and unmasked (with or without '+55' prefix) Brazilian
  /// landline numbers.
  ///
  /// [mal] the error message in case of a malformed number; the default value
  /// is 'malformed number'.
  const BrPhone({String? mal}) : _malformed = mal ?? 'malformed number';

  final String _malformed;

  /// Checks whether [brPhone] is well-formed.
  ///
  /// Returns null if [brPhone] is a valid Brazilian phone number; otherwise,
  /// the error message.
  String? call(String? brPhone) {
    if (brPhone == null) return null;
    return BrPhoneStrip(brPhone).value == null ? _malformed : null;
  }
}
