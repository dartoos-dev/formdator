import 'package:formdator/formdator.dart';

/// Multiple rules applied to input data.
class Rules<T> {
  /// Validates with the given rules.
  Rules(Iterable<ValType<T>> rules) : _rules = List.unmodifiable(rules);

  final List<ValType<T>> _rules;

  /// Valid - returns null - if [input] is valid for all rules.
  String? call(T? input) {
    for (final rule in _rules) {
      final error = rule(input);
      if (error != null) return error;
    }
    return null;
  }
}
