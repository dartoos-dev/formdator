/// Unit testing purposes - it gives back the input value as String.
class ValueBack {
  /// Does not perform any validation.
  const ValueBack();

  /// Always returns the given [value] back as String.
  String? call(Object? value) => value?.toString();
}
