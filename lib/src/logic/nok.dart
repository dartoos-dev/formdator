/// Always invalid
///
/// Used for some validation logic and unit testing.
class Nok {
  /// Does not perform any validation.
  ///
  /// [error] the message that will always be returned.
  const Nok({String error = 'error'}) : _error = error;

  final String _error;

  /// Always invalid; always returns error.
  String? call(Object? _) => _error;
}
