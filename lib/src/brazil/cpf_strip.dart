/// CPF plain value - non-numeric characters stripped from it.
///
/// CPFs matching the pattern '###.###.###-##' are going to have the dots "."
/// and dash "-" stripped from them; but, if a CPF is already entirely numeric,
/// it remains as is. Finally, in case of a malformed CPF, the null value is
/// going to indicate a format error. For example:
/// - the '493.803.840-41' becomes '49380384041'.
/// - the '49380384041' remains unchanged.
/// - the (malformed) 'AAB.831.918+60' becomes null.
class CpfStrip {
  /// It strips the two dots '.' and dash '-' from the CPF.
  const CpfStrip(this._cpf);

  /// The original cpf.
  final String _cpf;

  /// Matches any non-empty 11-digit CPF.
  static late final RegExp _plainCpf = RegExp(r'^[0-9]{11}$');

  /// Matches any masked wellformed CPF - '###.###.###-##'.
  static late final RegExp _maskedCpf = RegExp(r'^\d{3}(\.\d{3}){2}-\d{2}$');

  /// forwards to [value].
  String? call() => value;

  /// CPF plain value - non-numeric characters stripped from it.
  ///
  /// There are three scenarios for a CPF value. If it is:
  ///   1. properly masked as '###.###.###-##', then the dots "." and dash "-"
  ///   are going to be stripped from it (e.g., '133.497.166-07' becomes
  ///   '13349716607').
  ///   2. composed entirely of 11 numbers, then it is going to remain unchanged
  ///   (e.g., '4183191800' remains as is).
  ///   3. malformed, then the null value is going to indicate a format error
  ///   (e.g., '40.769-911.00' becomes null).
  String? get value => _isMasked
      ? _strip
      : _isPlain
          ? _cpf
          : null;

  /// Checks whether the CPF is properly masked: '###.###.###-##'.
  bool get _isMasked => _maskedCpf.hasMatch(_cpf);

  /// Checks whether the CPF is composed of a non-empty 11-digit numeric value.
  bool get _isPlain => _plainCpf.hasMatch(_cpf);

  /// Strips the '.'s and '-' from CPF.
  String get _strip {
    final buffer = StringBuffer()
      ..write(_cpf.substring(0, 3))
      ..write(_cpf.substring(4, 7))
      ..write(_cpf.substring(8, 11))
      ..write(_cpf.substring(12, 14));
    return buffer.toString();
  }
}
