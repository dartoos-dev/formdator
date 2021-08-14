/// CNPJ as a digit-only value.
///
/// CNPJs matching the pattern '##.###.###/####-##' will have the dots ".",
/// slash "/", and dash "-" stripped from them; but, if a CNPJ is already
/// entirely numeric, it remains as is. Finally, in case of a malformed CNPJ,
/// the null value will be returned to indicate a formatting error.
///
/// For example:
///
/// - if the CNPJ is '41.831.918/0001-60', then the return value will be
///   '41831918000160';
/// - if the CNPJ is '41831918000160', then the return value will also be
///   '41831918000160';
/// - if the CNPJ is malformed as the value 'AA.831.918+0001-60', then the
///   return value nill be the null value.
class CnpjStrip {
  /// It strips the two dots '.', bar '/', and dash '-' from the CNPJ.
  const CnpjStrip(this._cnpj);

  /// The original cnpj.
  final String _cnpj;

  /// Matches any 14-digit value or a masked (##.###.###/####-##), well-formed
  /// CNPJ.
  static final _wellFormed =
      RegExp(r'^(\d{14}|\d{2}(\.\d{3}){2}/\d{4}-\d{2})$');

  /// Matches non-digit characters of a CNPJ value.
  static final _nonDigits = RegExp('[-./]');

  /// CNPJ as a digit-only value — non-numeric characters are stripped from it.
  ///
  /// There are three scenarios for a CNPJ value. If it is:
  ///   1. properly masked as '##.###.###/####-##', then the dots ".", slash
  ///   "/", and dash "-" will be stripped from it (e.g., '13.497.166/0001-07'
  ///   becomes '13497166000107').
  ///   2. composed entirely of 14 numbers, then it will remain unchanged
  ///   (e.g.,'41831918000160' remains as is).
  ///   3. malformed, then the null value will be returned to indicate a
  ///   formatting error. (e.g., the values '111AB222333445' and
  ///   '40.769-9110/001.00' become null).
  String? get value => _isWellFormed ? _strip : null;

  /// Strips the dots ".", slash "/", and dash "-" from CNPJ.
  String get _strip => _cnpj.replaceAll(_nonDigits, '');

  bool get _isWellFormed => _wellFormed.hasMatch(_cnpj);
}
