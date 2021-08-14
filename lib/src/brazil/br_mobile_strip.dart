/// BrMobile as a digit-only value.
///
/// Brazilian mobile numbers corresponding to the pattern '(##) ##### - ####'
/// will have the hyphen "-", the left "(" and right ")" parenthesis removed
/// from them. However, if a number is already fully numeric (containing or not
/// the code prefix '+55'), it will remain as is.  Finally, if the number is
/// malformed, the value 'null' will be returned as an indication of a
/// formatting error. For example:
///
/// - if the number is '(21) 91234-5678', then the return value will be
///   '92112345678'
/// - if the number is '9876543210', then the return value will also be '9876543210'
/// - if the number contains the Brazilian code prefix '+55' like
///   '+559876543210', then the return value will also be '+559876543210'
/// - if the number is malformed like '983191+060', then the return value will
///   be the null value
class BrMobileStrip {
  /// It strips the hyfen '-' and parenthesis from the BrMobile value.
  const BrMobileStrip(this._brMobile);

  // The original BrMobile value.
  final String _brMobile;

  /// Plan-conforming numbers are limited to a maximum of 15 digits, excluding
  /// the international call prefix. The presentation of a number is usually
  /// prefixed with the plus sign (+), indicating that the number includes the
  /// country calling code — [e.164](https://en.wikipedia.org/wiki/E.164).
  static final RegExp _wellFormedBrMobile =
      RegExp(r'^((\+55)?\d{11}|\(\d{2}\)\s?\d{5}-\d{4})$');

  /// Matches non-digit characters of a brazilian phone number.
  static final _nonDigits = RegExp(r'[-()\s]');

  /// BrMobile as a digit-only value — without the hyphen and parenthesis.
  String? get value => _isWellFormed ? _strip : null;

  /// Stripped number.
  String get _strip => _brMobile.replaceAll(_nonDigits, '');

  /// Checks whether [brMobile] is well-formed.
  bool get _isWellFormed => _wellFormedBrMobile.hasMatch(_brMobile);
}
