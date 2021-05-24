/// Well formed datetime validator.
class WellFormedDt {
  final String _msg;

  const WellFormedDt({String malformed = 'Malformed value.'})
      : _msg = malformed;

  String call(DateTime dt) {
    String ok;
    try {
      DateTime.parse(dt.toString());
    } catch (e) {
      ok = _msg;
    }
    return ok;
  }
}
