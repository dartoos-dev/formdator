import 'package:formdator/formdator.dart';

/// Counts the number of times the validation has been performed.
class Counter {
  /// [init] the initial count value.
  /// [val] an optional extra validation step.
  Counter({int init = 0, ValObj val = _ok})
      : _count = List<int>.filled(1, init),
        _val = val;

  final List<int> _count;
  final ValObj _val;

  static String? _ok(Object? _) => null;

  /// The current count value.
  int get value => _count[0];

  void _inc() => ++_count[0];

  /// Does not perform any validation - just increases its counter upon
  /// validation request.
  String? call(Object? value) {
    _inc();
    return _val(value);
  }
}
