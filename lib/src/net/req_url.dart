import '../../core.dart';
import '../../type.dart';
import 'url.dart';

/// Convenience validator for required URL values.
class ReqUrl {
  /// Non-blank and well-formed URL values.
  ReqUrl({String blank = 'required URL', String mal = 'malformed URL'})
      : _reqUrl = Pair.str2(Req(blank: blank), Url(mal: mal));

  final ValObj _reqUrl;

  /// Returns null if the value is a valid URL; otherwise it will return the
  /// error message for blank fields or the error message for malformed fields.
  String? call(String? value) => _reqUrl(value);
}
