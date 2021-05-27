import 'req_cnpj.dart';
import 'trim.dart';

/// Convenience trimmed-required-cnpj validator.
class TrimReqCnpj {
  /// It combines the [Trim], [Req], and [Cnpj] validators.
  ///
  /// [blank] is the error message in case of a null or empty value; [invalid],
  /// in case of an invalid one.
  TrimReqCnpj({required String blank, required String invalid})
      : _trim = Trim(ReqCnpj(blank: blank, invalid: invalid));

  final Trim _trim;

  /// Valid - returns null - if [cnpj] is valid.
  String? call(String? cnpj) => _trim(cnpj);
}
