import 'req_cnpj.dart';
import 'trimmed.dart';

/// Convenience trimmed required cnpj validator.
class TrimReqCnpj {
  /// Trimmed mandatory with [blank] as error for blank and [invalid] as error
  /// for invalid.
  TrimReqCnpj(
      {String blank = 'Non-blank field.', String invalid = 'Invalid cnpj.'})
      : _trimmed = Trimmed(ReqCnpj(blank: blank, invalid: invalid));

  final Trimmed _trimmed;

  /// Null if [cnpj] is valid; the error message if blank or invalid.
  String? call(String? cnpj) => _trimmed(cnpj);
}
