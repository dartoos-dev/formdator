import 'rules.dart';
import 'trimmed.dart';
import 'type.dart';

/// Trimed multi rules validator.
class TrimRules {
  /// Trims the value before forwarding to [vals].
  TrimRules(List<Val> vals) : _trimmed = Trimmed(Rules(vals));

  final Trimmed _trimmed;

  /// Null if [value] is valid for all rules; the error message otherwise.
  String? call(String value) => _trimmed(value);
}
