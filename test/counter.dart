/// Sums the number of times the validation has been performed.
class Counter {
  Counter([int init = 0]) : _count = init;
  int _count;

  int get value => _count;

  /// Does not perform any validation - just increases its counter upon
  /// validation request.
  String? call(String? value) {
    ++_count;
    return null;
  }
}
