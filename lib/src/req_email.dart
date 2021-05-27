import 'email.dart';
import 'rules.dart';

/// Mandatory well-formed email.
class ReqEmail {
  /// It combines both the [Req] and [Email] validators.
  ///
  /// [blank] is the error message in case of a null or empty email; [invalid],
  /// in case of an invalid one.
  ReqEmail({required String blank, required String invalid})
      : _nonBlankWellFormed = Rules.req(blank, Email(invalid: invalid));

  final Rules _nonBlankWellFormed;

  /// Valid - returns null - if [email] is valid.
  String? call(String? email) => _nonBlankWellFormed(email);
}
