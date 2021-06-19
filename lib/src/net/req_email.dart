import 'package:formdator/formdator.dart';
import 'email.dart';

/// Convenient validator for required email fields.
///
/// It is the composite of [Req] and [Email] validators.
class ReqEmail {
  /// Ensures a non-blank and well-formed email value.
  ///
  /// [blank] is the blank field message; [mal], the malformed email message.
  ReqEmail({String blank = 'required', String mal = 'malformed'})
      : _reqEmail = Rules<String>([Req(blank: blank), Email(mal: mal)]);

  final Rules _reqEmail;

  /// Valid — returns null — if [email] is a non-blank and well-formed email;
  /// otherwise, returns the blank error message if [email] is null, or the
  /// malformed error message if [email] is malformed.
  String? call(String? email) => _reqEmail(email);
}
