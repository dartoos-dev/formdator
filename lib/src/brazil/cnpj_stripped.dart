/// The [CNPJ] numeric-only value - without '.'s, '/', and '-'.
///
/// Only strips properly masked CNPJ - ##.###.###/####-##; returns the original
/// value otherwise - this includes unmasked and malformed values.
///
/// Ex. the masked CNPJ value 41.831.918/0001-60 becomes 41831918000160; on the
/// other hand, unmasked and malformed values are left untouched.
class CnpjStripped {
  /// Removes the two dots '.', the bar '/', and the dash '-' from the cnpj if
  /// it's properly masked; otherwise, the cnpj is left untouched.
  const CnpjStripped(this._cnpj);

  /// The original cnpj.
  final String _cnpj;

  /// Forwards to [toString].
  String call() => toString();

  /// If the CNPJ is properly masked, retrieves it without the '.'s, '/', and
  /// '-'; retrieves the CNPJ as it is.
  @override
  String toString() => _shouldStrip ? _stripped : _cnpj;

  String get _stripped {
    final buffer = StringBuffer()
      ..write(_cnpj.substring(0, 2))
      ..write(_cnpj.substring(3, 6))
      ..write(_cnpj.substring(7, 10))
      ..write(_cnpj.substring(11, 15))
      ..write(_cnpj.substring(16, 18));
    return buffer.toString();
  }

  bool get _shouldStrip {
    return _cnpj.length == 18 &&
        _cnpj[2] == '.' &&
        _cnpj[6] == '.' &&
        _cnpj[10] == '/' &&
        _cnpj[15] == '-';
  }
}
