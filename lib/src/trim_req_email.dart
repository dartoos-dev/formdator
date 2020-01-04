import 'trimmed.dart';
import 'req_email.dart';

/// Convenience trimmed required email validator.
class TrimReqEmail {

  final Trimmed _trimmed;

  TrimReqEmail({
    String blank = 'Non-blank field.',
    String invalid = 'Invalid email.'
  }) :
    _trimmed = Trimmed(ReqEmail(blank: blank, invalid: invalid));

  ///Trims the value before validating against blankness and
  ///ill-formedness.
  String call(String value) => _trimmed(value);
}
