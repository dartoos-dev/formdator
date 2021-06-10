/// CNPJ plain value - non-numeric characters stripped from it.
///
/// CNPJs matching the pattern '##.###.###/####-##' are going to have the dots
/// ".", slash "/", and dash "-" stripped from them; but, if a CNPJ is already
/// entirely numeric, it remains as is. Finally, in case of a malformed CNPJ,
/// the null value is going to indicate a format error. For example:
/// - the '41.831.918/0001-60' becomes '41831918000160'.
/// - the '41831918000160' remains unchanged.
/// - the (malformed) 'AA.831.918+0001-60' becomes null.
class CnpjStrip {
  /// It strips the two dots '.', bar '/', and dash '-' from the CNPJ.
  const CnpjStrip(this._cnpj);

  /// The original cnpj.
  final String _cnpj;

  /// Matches any non-empty 14-digit CNPJ.
  static late final RegExp _plainCnpj = RegExp(r'^[0-9]{14}$');

  /// Matches any masked wellformed CNPJ - '##.###.###/####-##'.
  static late final RegExp _maskedCnpj =
      RegExp(r'^\d{2}(\.\d{3}){2}/\d{4}-\d{2}$');

  /// Forwards to [value].
  String? call() => value;

  /// CNPJ plain value - non-numeric characters stripped from it.
  ///
  /// There are three scenarios for a CNPJ value. If it is:
  ///   1. properly masked as '##.###.###/####-##', then the dots ".", slash
  ///   "/", and dash "-" are going to be stripped from it (e.g.,
  ///   '13.497.166/0001-07' becomes '13497166000107').
  ///   2. composed entirely of 14 numbers, then it is going to remain unchanged
  ///   (e.g.,'41831918000160' remains as is).
  ///   3. malformed, then the null value is going to indicate a format error
  ///   (e.g., the values '111AB222333445' and '40.769-9110/001.00' become
  ///   null).
  String? get value => _isMasked
      ? _strip
      : _isPlain
          ? _cnpj
          : null;

  /// Strips the dots ".", slash "/", and dash "-" from CNPJ.
  String get _strip {
    final buffer = StringBuffer()
      ..write(_cnpj.substring(0, 2))
      ..write(_cnpj.substring(3, 6))
      ..write(_cnpj.substring(7, 10))
      ..write(_cnpj.substring(11, 15))
      ..write(_cnpj.substring(16, 18));
    return buffer.toString();
  }

  /// Checks whether the CNPJ is properly masked: '##.###.###/####-##'.
  bool get _isMasked => _maskedCnpj.hasMatch(_cnpj);

  /// Checks whether the CNPJ is comprising of a non-empty 14-digit numeric value.
  bool get _isPlain => _plainCnpj.hasMatch(_cnpj);
}
