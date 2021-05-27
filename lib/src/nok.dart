/// Always invalid
///
/// Used for some validation logic and testing.
class Nok {
  /// Does not perform any validation.
  ///
  /// [msg] the message in case of a null input value.
  const Nok({String msg = ''}) : _msg = msg;

  final String _msg;

  /// Always invalid
  String? call(String? value) => value ?? _msg;
}
