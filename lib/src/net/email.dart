import 'package:formdator/formdator.dart';

/// Validator of optional e-mail values.
///
/// Blank field - null value - is a valid input!
///
/// If the email address is required, see [Req].
class Email {
  /// Validates email addresses using a regular expression that is suitable for
  /// manually entered emails.
  ///
  /// The validation takes into account that the local part (before the @) is
  /// limited to 64 characters and that each part of the domain name is limited
  /// to 63 characters. The number of subdomains has been deliberately limited
  /// to 8 as it is unlikely that someone will ever enter an email address with
  /// more than 4 subdomains.
  ///
  /// If the email field is mandatory, see [Req]; If you need to limit the
  /// maximum length of an email address, see [Email.len].
  ///
  /// [mal] the error message in case of a malformed email address; if omitted,
  /// the default message will be 'malformed email'.
  Email({String? mal})
      : _emailVal = ((String? email) {
          return (email == null || _matcher.hasMatch(email))
              ? null
              : mal ?? 'malformed email';
        });

  /// Validates an optional email address and limits its length to up to [len]
  /// characters.
  ///
  /// [len] the maximum length of an email address; it must be > 0.
  /// [mal] the error message in case of a malformed email address; if omitted,
  /// the default message will be 'malformed email'.
  /// [long] the error message in case of an email address that is too long; if
  /// omitted, the default message will be 'too long email'.
  Email.len(int len, {String? mal, String? long})
      : assert(len > 0),
        _emailVal = Rules<String>(
          [
            Len.max(len, long: long ?? 'too long email'),
            Email(mal: mal),
          ],
        );

  // email validation logic.
  final ValStr _emailVal;

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
  String? call(String? email) => _emailVal(email);
}
