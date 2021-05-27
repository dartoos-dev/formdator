import 'req_cpf.dart';
import 'trim.dart';

/// Convenience trimmed-required-cpf validator.
class TrimReqCpf {
  /// It combines the [Trim], [Req], and [Cpf] validators.
  ///
  /// [blank] is the error message in case of a null or empty value; [invalid],
  /// in case on an invalid one.
  TrimReqCpf({required String blank, required String invalid})
      : _trim = Trim(ReqCpf(blank: blank, invalid: invalid));

  final Trim _trim;

  /// Valid - returns null - if [cpf] is valid.
  String? call(String? cpf) => _trim(cpf);
}
