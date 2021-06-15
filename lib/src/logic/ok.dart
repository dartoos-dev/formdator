/// Always valid - Tautology.
///
/// Used for validation logic purposes.
class Ok {
  /// Always valid - does not perform any validation.
  const Ok();

  /// Always valid - always returns null.
  String? call(Object? _) => null;
}
