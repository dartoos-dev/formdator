import 'package:formdator/formdator.dart';

/// Convenient validator for required fields whose constraints regard to text
/// pattern.
class ReqMatch {
  /// Constrains input data to values that the pattern [pattern] has a match.
  ///
  /// [mis] the error message in case of a mismatch between the input data and
  /// [pattern].
  ReqMatch(String pattern, {String? blank, String? mis})
      : this.regExp(RegExp(pattern), blank:blank, mis: mis);

  /// Constrains input data to values that the regular expression [regExp] has a
  /// match.
  ///
  /// [blank] the error message in case of a null or empty input value.
  /// [mis] the error message in case of a mismatch between the input data and
  /// [pattern].
  ReqMatch.regExp(RegExp regExp, {String? blank, String? mis})
      : _reqVal = Pair.str2(Req(blank: blank), Match.regExp(regExp, mis: mis));

  /// The required match validation logic.
  final Pair _reqVal;

  /// Valid - returns null - if [input] is neither null nor empty, and the text
  /// pattern has a match in [input].
  String? call(String? input) => _reqVal(input);
}
