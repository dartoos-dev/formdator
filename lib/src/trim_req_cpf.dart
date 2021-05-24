import 'trimmed.dart';
import 'req_cpf.dart';

/// Convenience trimmed required cpf validator.
class TrimReqCpf {
  final Trimmed _trimmed;

  TrimReqCpf(
      {String blank = 'Non-blank field.', String invalid = 'Invalid cpf.'})
      : _trimmed = Trimmed(ReqCpf(blank: blank, invalid: invalid));

  ///Trims the value before validating against blankness and
  ///ill-formedness.
  String call(String value) => _trimmed(value);
}
