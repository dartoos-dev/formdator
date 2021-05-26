import 'type.dart';

/// Multiple datetime validator.
class RulesDt {
  /// DtValidator.
  const RulesDt(this._vals);

  final List<DtValidator> _vals;

  /// Null if [datetime] if valid for all rules; the error message otherwise.
  String? call(DateTime? datetime) {
    String? msg;
    for (final val in _vals) {
      msg = val(datetime);
      if (msg != null) break;
    }
    return msg;
  }
}
