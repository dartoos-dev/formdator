/// CPF without formatting characters like '.' and '-'.
///
/// Only strips masked CPF matching the pattern '###.###.###-##'; returns the
/// original value otherwise - this includes unmasked and malformed values.
///
/// Ex. the masked CPF value 493.803.840-41 becomes 49380384041; on the other
/// hand, for example, the unmasked CPF 49380384041 is left untouched.
class CpfStripped {
  /// Removes the two dots '.' and the dash '-' from the cpf field if it's
  /// properly masked; otherwise, the cpf is left untouched.
  const CpfStripped(this._cpf);

  /// The original cpf.
  final String _cpf;

  /// forwards to [toString].
  String call() => toString();

  /// CPF as its stripped value.
  @override
  String toString() => _shouldStrip ? _stripped : _cpf;

  /// Removes the '.'s and '-' from the (masked) cpf.
  String get _stripped {
    return '${_cpf.substring(0, 3)}${_cpf.substring(4, 7)}${_cpf.substring(8, 11)}${_cpf.substring(12, 14)}';
  }

  /// Checks whether the cpf was masked like: '###.###.###-##'.
  bool get _shouldStrip {
    return _cpf.length == 14 &&
        _cpf[3] == '.' &&
        _cpf[7] == '.' &&
        _cpf[11] == '-';
  }
}
