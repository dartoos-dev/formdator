import 'rules_dt.dart';
import 'req_dt.dart';
import 'wellformed_dt.dart';

/// Required, wellformed datetime.
class ReqWellFormedDt {
  final RulesDt _rules;

  ReqWellFormedDt({
    String blank = 'Required.',
    String malformed = 'Malformed.',
  }) : _rules = RulesDt([
          ReqDt(blank: blank),
          WellFormedDt(malformed: malformed),
        ]);

  String? call(DateTime? dt) => _rules(dt);
}
