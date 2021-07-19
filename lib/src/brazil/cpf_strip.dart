/// CPF as a digit-only value.
///
/// CPFs matching the pattern '###.###.###-##' will have the dots "." and dash
/// "-" stripped from them; but, if a CPF is already entirely numeric, it
/// remains as is. Finally, in case of a malformed CPF, the null value will be
/// returned to indicate a formatting error.
///
/// For example:
///
/// - if the CPF is '493.803.840-41', then the return value will be '49380384041';
/// - if the CPF is '49380384041', then the return value will also be
///   '49380384041';
/// - if the CPF is malformed as the value 'AAB.831.918+60', then the return
///   value will be the null value.
class CpfStrip {
  /// It strips the two dots '.' and dash '-' from the CPF.
  const CpfStrip(this._cpf);

  /// The original cpf.
  final String _cpf;

  /// Matches any 11-digit value or a masked (###.###.###-##), well-formed CPF.
  static final _wellFormed = RegExp(r'^(\d{11}|\d{3}(\.\d{3}){2}-\d{2})$');

  /// Matches non-digit characters of a CPF value.
  static final _nonDigits = RegExp('[-.]');

  /// forwards to [value].
  String? call() => value;

  /// CPF as a digit-only value — non-numeric characters are stripped from it.
  ///
  /// There are three scenarios for a CPF value. If it is:
  ///   1. properly masked as '###.###.###-##', then the dots "." and dash "-"
  ///   will be stripped from it (e.g., '133.497.166-07' becomes '13349716607').
  ///   2. composed entirely of 11 numbers, then it will remain unchanged (e.g.,
  ///   '4183191800' remains as is).
  ///   3. malformed, then the null value will be returned to indicate a
  ///   formatting error (e.g., '40.769-911.00' becomes null).
  String? get value => _isWellFormed ? _strip : null;

  /// Strips the '.'s and '-' from the CPF value.
  String get _strip => _cpf.replaceAll(_nonDigits, '');

  bool get _isWellFormed => _wellFormed.hasMatch(_cpf);
}
