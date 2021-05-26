import 'type.dart';

/// Multiple datetime validator.
class RulesDt {
  final List<DtValidator> _vals;

  const RulesDt(this._vals);

  String? call(DateTime? dt) {
    String? msg;
    for (final val in _vals) {
      msg = val(dt);
      if (msg != null) break;
    }
    return msg;
  }
}
