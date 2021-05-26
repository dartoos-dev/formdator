import 'req_email.dart';
import 'trimmed.dart';

/// Convenience trimmed required email validator.
class TrimReqEmail {
  /// Trimmed mandatory email with [blank] as error for blank and [invalid] as
  /// error for invalid emails.
  TrimReqEmail(
      {String blank = 'Non-blank field.', String invalid = 'Invalid email.'})
      : _trimmed = Trimmed(ReqEmail(blank: blank, invalid: invalid));

  final Trimmed _trimmed;

  /// Null if [email] is valid; the error message if blank or invalid.
  String? call(String? email) => _trimmed(email);
}
