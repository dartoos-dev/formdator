/// Always invalid
///
/// Used for some validation logic and unit testing.
class Nok {
  /// Does not perform any validation.
  ///
  /// [error] the message that will always be returned; defaults to 'Nok error'.
  const Nok({String? error}) : _error = error ?? 'Nok error';

  final String _error;

  /// Always invalid; always returns error.
  String? call(Object? _) => _error;
}
