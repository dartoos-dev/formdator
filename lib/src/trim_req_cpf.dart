import 'req_cpf.dart';
import 'trimmed.dart';

/// Convenience trimmed required cpf validator.
class TrimReqCpf {
  /// Trimmed mandatory cpf with [blank] as error for blank and invalid as error
  /// for invalid values.
  TrimReqCpf(
      {String blank = 'Non-blank field.', String invalid = 'Invalid cpf.'})
      : _trimmed = Trimmed(ReqCpf(blank: blank, invalid: invalid));

  final Trimmed _trimmed;

  /// Null if cpf is valid; the error message if blank or invalid.
  String? call(String? cpf) => _trimmed(cpf);
}
