import 'package:formdator/core.dart';
import 'package:formdator/net.dart';
import 'package:formdator/type.dart';

/// Convenience validator for required URL values.
class ReqUrl {
  /// Non-blank and well-formed URL values.
  ReqUrl({String blank = 'required URL', String mal = 'malformed URL'})
      : _reqUrl = Pair.str2(Req(blank: blank).call, Url(mal: mal).call).call;

  final ValObj _reqUrl;

  /// Returns null if the value is a valid URL; otherwise it will return the
  /// error message for blank fields or the error message for malformed fields.
  String? call(String? value) => _reqUrl(value);
}
