/// Sums the number of times the validation has been performed.
class Counter {
  Counter([int init = 0]) : _count = List<int>.filled(1, init);
  final List<int> _count;

  int get value => _count[0];

  void _inc() => ++_count[0];

  /// Does not perform any validation - just increases its counter upon
  /// validation request.
  String? call(String? value) {
    _inc();
    return null;
  }
}
