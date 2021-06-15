import 'package:callor/callor.dart';

/// Multiple rules applied to a field.
class Rules<T> {
  /// Validates with the given rules.
  Rules(Iterable<TypeVal<T>> rules) : _rules = List.unmodifiable(rules);

  final List<TypeVal<T>> _rules;

  /// Valid - returns null - if [value] is valid for all rules.
  String? call(T? value) {
    String? msg;
    for (final rule in _rules) {
      msg = rule(value);
      if (msg != null) {
        break;
      }
    }
    return msg;
  }
}
