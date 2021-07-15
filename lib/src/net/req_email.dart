import 'package:formdator/formdator.dart';
import 'email.dart';

/// Convenient validator for required email fields.
///
/// It is the composite of [Req] and [Email] validators.
class ReqEmail {
  /// Ensures a non-blank and well-formed email value.
  ///
  /// [blank] the blank field message; defaults to 'required email'.
  /// [mal] the malformed email message.
  ReqEmail({String? blank, String? mal})
      : _reqEmail = Req.val(ToValObj(Email(mal: mal)),
            blank: blank ?? 'required email');

  final ValObj _reqEmail;

  /// Valid — returns null — if [input] is a non-blank well-formed email;
  /// otherwise, returns the blank error message if [input] is null, or the
  /// malformed error message if [input] is malformed.
  String? call(String? input) => _reqEmail(input);
}
