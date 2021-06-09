/// Always invalid
///
/// Used for some validation logic and unit testing.
class Nok {
  /// Does not perform any validation.
  ///
  /// [msg] the message that will always be returned.
  const Nok({required String msg}) : _msg = msg;

  final String _msg;

  /// Always invalid; always returns msg.
  String? call(String? _) => _msg;
}
