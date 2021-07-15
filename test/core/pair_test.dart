import 'package:flutter_test/flutter_test.dart';
import 'package:formdator/formdator.dart';

void main() {
  group('Pair', () {
    const blank = 'required field';
    const malformed = 'invalid email address';
    final req = Req(blank: blank);
    test('— ValObj and ValStr', () {
      final pair = Pair(req, Email(mal: malformed));
      expect(pair(null), blank);
      expect(pair('an_invalid_email@.com'), malformed);
      expect(pair('a_user@email.com'), null);
    });
    test('— ValObj and ValObj', () {
      const long = 'the maximum length is 20';
      final objPair = Pair.obj(req, Len.max(20, long: long));
      expect(objPair(null), blank);
      expect(objPair('A text that is too long and should be rejected'), long);
      expect(objPair('A short text'), null);
    });
    test('— ValStr and ValStr', () {
      const upperCaseError = 'lower case characters only';
      String? noUpperCase(String? input) {
        return (input != null && input.contains(RegExp('[A-Z]')))
            ? upperCaseError
            : null;
      }

      final strPair = Pair.str(noUpperCase, Email(mal: malformed));
      expect(strPair(null), null);
      expect(strPair('an_invalid_email@.com'), malformed);
      expect(strPair('a_Capitalized_account@email.com'), upperCaseError);
    });
  });
}
