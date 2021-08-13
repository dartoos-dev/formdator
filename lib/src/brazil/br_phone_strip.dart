/// BrPhone as a digit-only value.
///
/// Brazilian phone numbers corresponding to the pattern '(##) #### - ####' will
/// have the hyphen "-", the left "(" and right ")" parenthesis removed from
/// them. However, if a number is already fully numeric, it will remain as is.
/// Finally, if the number is malformed, the value 'null' will be returned as an
/// indication of a formatting error. For example:
///
/// - if the number is '(21) 1234-5678', then the return value will be
///   '2112345678'
/// - if the number is '876543210', then the return value will be '876543210' as
///   well
/// - if the number is malformed '83191+060', then the return value will be the
///   null value
class BrPhoneStrip {
  /// It strips the hyfen '-' and parenthesis from the BrPhone value.
  const BrPhoneStrip(this._brPhone);

  // The original BrPhone value.
  final String _brPhone;

/// Plan-conforming numbers are limited to a maximum of 15 digits, excluding the
/// international call prefix. The presentation of a number is usually prefixed
/// with the plus sign (+), indicating that the number includes the country
/// calling code — [e.164](https://en.wikipedia.org/wiki/E.164).
  static final RegExp _wellFormedBrPhone = RegExp(r'^((\+55)?\d{10}|\(\d{2}\)\s?\d{4}-\d{4})$');

  /// Matches non-digit characters of a brazilian phone number.
  static final _nonDigits = RegExp(r'[-()\s]');
  /// BrPhone as a digit-only value — without the hyphen and parenthesis.
  String? get value => _isWellFormed ? _strip : null;

  /// Stripped number.
  String get _strip => _brPhone.replaceAll(_nonDigits, '');

  /// Checks whether [brPhone] is well-formed.
  bool get _isWellFormed => _wellFormedBrPhone.hasMatch(_brPhone);
}
