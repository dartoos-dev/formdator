import 'digit.dart';
import 'req.dart';
import 'rules.dart';

/// Mandatory digit-only field.
class ReqDigit {
  /// It combines both the [Req] and [Digit] validators.
  ///
  /// [blank] is the error message in case of a null or empty value; [invalid],
  /// in case of a non-digit character is found.
  ReqDigit({required String blank, required String nonDigit})
      : _nonBlankDigit = Rules.req(blank, Digit(nonDigit: nonDigit));

  final Rules _nonBlankDigit;

  /// Valid - returns null - if [digits] contains only digits.
  String? call(String? digits) => _nonBlankDigit(digits);
}
