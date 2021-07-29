/// CPF as a digit-only value.
///
/// CPFs that match the pattern '###.###.###-##' will be stripped of its two
/// dots "." and hyphen "-". However, if a CPF is already fully numeric, it will
/// remain as-is. Finally, if the CPF is malformed, then the null value will be
/// returned as an indication of a formatting error.
///
/// For example:
///
/// - if the CPF is '493.803.840-41', the return value will be '49380384041'.
/// - if the CPF is '49380384041', the return value will also be '49380384041'.
/// - if the CPF is a malformed value, such as 'AAB.831.918+60', then the return
///   value will be null.
class CpfStrip {
  /// Strips the CPF of its two dots '.' and hyphen '-'.
  const CpfStrip(this._cpf);

  /// The original cpf.
  final String _cpf;

  /// Matches any 11-digit value or a masked (###.###.###-##), well-formed CPF.
  static final _wellFormed = RegExp(r'^(\d{11}|\d{3}(\.\d{3}){2}-\d{2})$');

  /// Matches non-digit characters of a CPF value.
  static final _nonDigits = RegExp('[-.]');

  /// forwards to [value].
  String? call() => value;

  /// CPF as a 11-digits value — non-numeric characters are stripped from it.
  ///
  /// There are three scenarios for a CPF value:
  ///
  /// - if the CPF is properly masked (###.###.###-##), it will be stripped of
  ///   its two dots "." and hyphen "-"; therefore, if the input value is
  ///   '133.497.166-07', the return value will be '13349716607'.
  /// - if the CPF is composed entirely of 11 numbers, it will remain unchanged;
  ///   thus, the return value will be the CPF as-is.
  /// - if the CPF is malformed, then the return value will be null as an
  ///   indication of a formatting error.
  String? get value => _isWellFormed ? _strip : null;

  /// Strips the '.'s and '-' from the CPF value.
  String get _strip => _cpf.replaceAll(_nonDigits, '');

  bool get _isWellFormed => _wellFormed.hasMatch(_cpf);
}
