import 'rules.dart';
import 'trim.dart';
import 'type.dart';

/// Convenience trimed-multirules validator.
class TrimRules {
  /// Trims the value and forwards it to [vals].
  TrimRules(List<Callor> vals) : _trim = Trim(Rules(vals));

  final Trim _trim;

  /// Valid - returns null - if [value] is valid for all rules.
  String? call(String? value) => _trim(value);
}
