import 'req_email.dart';
import 'trim.dart';

/// Convenience trimmed-required-email validator.
class TrimReqEmail {
  /// It combines the [Trim], [Req], and [Email] validators.
  ///
  /// [blank] is the error message in case of a null or empty value; [invalid],
  /// in case of an invalid one.
  TrimReqEmail({required String blank, required String invalid})
      : _trim = Trim(ReqEmail(blank: blank, invalid: invalid));

  final Trim _trim;

  /// Valid - returns null - if [email] is valid.
  String? call(String? email) => _trim(email);
}
