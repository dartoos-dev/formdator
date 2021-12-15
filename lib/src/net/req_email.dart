import '../core/pair.dart';
import '../core/req.dart';
import '../type.dart';

import 'email.dart';

/// Convenience validator for required email fields.
///
/// It is the composition between validators [Req] and [Email].
class ReqEmail {
  /// Non-blank and well-formed email values.
  ///
  /// [blank] the error message in case of an email address left blank; if
  /// omitted, the default message will be 'required email'.
  /// [mal] the error message in case of a malformed email address; if omitted,
  /// the default message will be 'malformed email'.
  ReqEmail({String? blank, String? mal})
      : this._email(Email(mal: mal), blank: blank);

  /// Non-blank, well-formed, and limited-length email values.
  ///
  /// [max] the maximum length of an email address; it must be > 0.
  /// [blank] the error message in case of an email address left blank; if
  /// omitted, the default message will be 'required email'.
  /// [mal] the error message in case of a malformed email address; if omitted,
  /// the default message will be 'malformed email'.
  /// [long] the error message in case of an email address that is too long; if
  /// omitted, the default message will be 'email longer than $max chars'.
  ReqEmail.len(int max, {String? blank, String? mal, String? long})
      : this._email(Email.len(max, mal: mal, long: long), blank: blank);

  /// Helper ctor.
  ReqEmail._email(Email email, {String? blank})
      : _reqEmail = Pair.str2(Req(blank: blank ?? 'required email'), email);

  // the required email logic.
  final ValObj _reqEmail;

  /// Valid — returns null — if [input] is a non-blank well-formed email;
  /// otherwise, returns the blank error message if [input] is null, or the
  /// malformed error message if [input] is malformed.
  String? call(String? input) => _reqEmail(input);
}
