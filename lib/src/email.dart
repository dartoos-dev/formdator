import 'package:validators/validators.dart';

/// Optional, well-formed email.
///
/// ** Blank field - null value - is a valid input!**.
///
/// If the field is mandatory, use [ReqEmail].
class Email {
  /// Validates an optional email field.
  ///
  /// [invalid] is the error message in case of an malformed email.
  const Email({required String invalid}) : _invalid = invalid;

  final String _invalid;

  /// Valid - returns null - if [email] is either valid or null.
  String? call(String? email) =>
      (email == null || isEmail(email)) ? null : _invalid;
}
