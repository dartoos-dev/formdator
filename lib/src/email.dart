/// Optional, well-formed email.
///
/// Blank field - null value - is a valid input!
///
/// If the field is mandatory, use [ReqEmail].
class Email {
  /// Validates an optional email field using a regular expression suitable for
  /// manually entered emails.
  ///
  /// The validation takes into account that the local part (before the @) is
  /// limited to 64 characters and that each part of the domain name is limited
  /// to 63 characters. The number of subdomains has been deliberately limited
  /// to 8 as it is unlikely that someone will ever enter an email address with
  /// more than 4 subdomains.
  ///
  /// **Note:** null value is a **valid input**, whereas the empty string _''_
  /// **is not**. If the email field is mandatory, use [ReqEmail].
  ///
  /// [malformed] is the error message in case of a malformed email.
  Email({required String malformed})
      : this.regex(
          malformed: malformed,
          matcher: _default,
        );

  /// Email validation with custom regex.
  ///
  /// [invalid] is the error message in case of a malformed email; [matcher], is
  /// the custom regex for email validation.
  Email.regex({required String malformed, required RegExp matcher})
      : _malformed = malformed,
        _matcher = matcher;

  final String _malformed;
  final RegExp _matcher;
  // lazy loading (on-demand) initialization.
  static late final RegExp _default = _initDefaultRegex();

  static RegExp _initDefaultRegex() {
    return RegExp(
      r'^[A-Z0-9._%+-]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,8}[A-Z]{2,63}$',
      caseSensitive: false,
      unicode: true,
    );
  }

  /// Valid - returns null - if [email] is either valid or null.
  String? call(String? email) =>
      (email == null || _matcher.hasMatch(email)) ? null : _malformed;
}
