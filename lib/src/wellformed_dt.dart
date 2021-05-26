/// Well formed datetime validator.
class WellFormedDt {
  final String _msg;

  const WellFormedDt({String malformed = 'Malformed date value.'})
      : _msg = malformed;

  String? call(DateTime? dt) {
    String? ok;
    try {
      DateTime.parse(dt.toString());
    } on FormatException {
      ok = _msg;
    }
    return ok;
  }
}
