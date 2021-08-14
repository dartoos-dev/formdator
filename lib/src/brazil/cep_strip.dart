/// CEP as a digit-only value.
///
/// CEP values matching the pattern '#####-###' will have the hyphen "-" removed
/// from them. However, if a zip value is already fully numeric, it will remain
/// as it is. Finally, if the zip code value is malformed, then the 'null' value
/// will be returned as an indication of a formatting error.
///
/// For example:
///
/// - if the CEP value is '12345-678', then the return value will be '12345678';
/// - if the CEP value is '87654321', then the return value will also be
///   '87654321';
/// - if the CEP value is malformed as the value '83191+060', then the return
///   value will be the null value.
class CepStrip {
  /// It strips the hyfen '-' from the CEP value.
  const CepStrip(this._cep);

  // The original cep value.
  final String _cep;

  static final RegExp _wellFormedCep = RegExp(r'^(\d{8}|\d{5}-\d{3})$');

  /// CEP as a digit-only value — without the hyphen '-'.
  ///
  /// There are three scenarios for a CEP value. If it is:
  ///   1. properly masked as '#####-###', then the hyphen "-" will be removed
  ///   from it (e.g., '13349-070' becomes '13349070').
  ///   2. composed entirely of 8 numbers, then it will remain unchanged (e.g.,
  ///   '1334070' remains as is).
  ///   3. malformed, then the null value will be returned to indicate a
  ///   formatting error (e.g., '13349-00' becomes null).
  String? get value => _isWellFormed ? _strip : null;

  /// Strips the '-' from CEP.
  String get _strip => _cep.replaceFirst('-', '', 5);

  /// Checks whether [cep] is a well-formed CEP value.
  bool get _isWellFormed => _wellFormedCep.hasMatch(_cep);
}
