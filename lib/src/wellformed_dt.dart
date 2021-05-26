/// Well formed datetime validator.
class WellFormedDt {
  /// Well-formed datetime with [malformed] as the error message.
  const WellFormedDt({String malformed = 'Malformed date value'})
      : _msg = malformed;

  final String _msg;

  /// Null if datetime is w
  String? call(DateTime? datetime) {
    String? ok;
    try {
      DateTime.parse(datetime.toString());
    } on FormatException {
      ok = _msg;
    }
    return ok;
  }
}
