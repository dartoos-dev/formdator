/// Always valid - Tautology.
///
/// Used for validation logic purposes.
class Ok {
  /// Does not perform any validation.
  const Ok();

  /// Always valid - always returns null.
  String? call(String? value) => null;
}
