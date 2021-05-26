/// Required datetime.
class ReqDt {
  /// Mandatory datetime with [blank] as the error message.
  const ReqDt({String blank = 'Required field'}) : _blank = blank;

  // Error message.
  final String _blank;

  /// Null if [datetime] is valid; the erro message if blank or invalid.
  String? call(DateTime? datetime) => datetime == null ? _blank : null;
}
