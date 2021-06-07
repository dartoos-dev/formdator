import 'email.dart';
import 'rules.dart';

/// Mandatory well-formed email.
class ReqEmail {
  /// It combines both the [Req] and [Email] validators.
  ///
  /// [blank] is the error message in case of a null or empty email value;
  /// [malformed], in case of a malformed one.
  ReqEmail({required String blank, required String malformed})
      : _nonBlankWellFormed = Rules.req(blank, Email(malformed: malformed));

  final Rules _nonBlankWellFormed;

  /// Valid - returns null - if [email] is valid.
  String? call(String? email) => _nonBlankWellFormed(email);
}
