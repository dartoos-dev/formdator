/// Unit testing purposes - it gives back the input value.
class ValueBack {
  /// Does not perform any validation.
  const ValueBack();

  /// Always returns the given [value] back.
  String? call(String? value) => value;
}
