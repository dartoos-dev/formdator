/// Required datetime.
class ReqDt {
  final String _msg;

  const ReqDt({String blank = 'Required.'}) : _msg = blank;

  String call(DateTime dt) => dt == null ? _msg : null;
}
