import 'trimmed.dart';
import 'req_cnpj.dart';

/// Convenience trimmed required cnpj validator.
class TrimReqCnpj {

  final Trimmed _trimmed;

  TrimReqCnpj({
    String blank = 'Non-blank field.',
    String invalid = 'Invalid cnpj.'
  }) :
    _trimmed = Trimmed(ReqCnpj(blank: blank, invalid: invalid));

  ///Trims the value before validating against blankness and
  ///ill-formedness.
  String call(String value) => _trimmed(value);
}
