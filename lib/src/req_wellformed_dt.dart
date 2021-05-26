import 'req_dt.dart';
import 'rules_dt.dart';
import 'wellformed_dt.dart';

/// Required, wellformed datetime.
class ReqWellFormedDt {
  /// Well-formed datetime.
  ReqWellFormedDt({
    String blank = 'Required.',
    String malformed = 'Malformed.',
  }) : _rules = RulesDt([
          ReqDt(blank: blank),
          WellFormedDt(malformed: malformed),
        ]);

  final RulesDt _rules;

  /// Null if [datetime] is valid; the error message if blank or invalid.
  String? call(DateTime? datetime) => _rules(datetime);
}
