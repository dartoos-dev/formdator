import 'req.dart';
import 'trim.dart';

/// Convenience trimmed-required validator.
class TrimReq {
  /// It combines both the [Trim] and [Req] validators.
  ///
  /// [blank] is the error message in case of a null or empty value.
  TrimReq({required String blank}) : _trim = Trim(Req(blank: blank));

  final Trim _trim;

  /// Valid - returns null - if [value], after being trimmed, is neither null
  /// nor empty.
  String? call(String? value) => _trim(value);
}
