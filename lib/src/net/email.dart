/// Optional well-formed email.
///
/// Blank field - null value - is a valid input!
///
/// If the field is mandatory, see [Req].
class Email {
  /// Validates an optional email field using a regular expression suitable for
  /// validating emails that were manually entered.
  ///
  /// The validation takes into account that the local part (before the @) is
  /// limited to 64 characters and that each part of the domain name is limited
  /// to 63 characters. The number of subdomains has been deliberately limited
  /// to 8 as it is unlikely that someone will ever enter an email address with
  /// more than 4 subdomains.
  ///
  /// **Note:** null value is a **valid input**, whereas the empty string _''_
  /// is not. If the email field is mandatory, see [Req].
  ///
  /// [mal] is the error message in case of a malformed email.
  const Email({required String mal}) : _malformed = mal;

  final String _malformed;
  // lazy loading (on-demand) initialization.
  static late final RegExp _matcher = _emailPattern();

  /// suitable pattern for a manually entered email.
  static RegExp _emailPattern() {
    return RegExp(
      r'^[A-Z0-9._%+-]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,8}[A-Z]{2,63}$',
      caseSensitive: false,
      unicode: true,
    );
  }

  /// Valid - returns null - if [email] is either well-formed or null.
  String? call(String? email) =>
      (email == null || _matcher.hasMatch(email)) ? null : _malformed;
}
