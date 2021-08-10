import 'package:formdator/formdator.dart';
import 'package:test/test.dart';

void main() {
  group('Pair', () {
    const blank = 'required field';
    const malformed = 'invalid email address';
    const upperCaseError = 'lower case characters only';
    String? noUpperCase(String? input) {
      return (input != null && input.contains(RegExp('[A-Z]')))
          ? upperCaseError
          : null;
    }

    const req = Req(blank: blank);
    test('— ValObj and ValStr', () {
      final pair = Pair.str(req, Email(mal: malformed));
      expect(pair(null), blank);
      expect(pair('an_invalid_email@.com'), malformed);
      expect(pair('a_user@email.com'), null);
    });
    test('— ValObj and ValObj', () {
      const long = 'the maximum length is 20';
      final objPair = Pair(req, Len.max(20, great: long));
      expect(objPair(null), blank);
      expect(objPair('A text that is too long and should be rejected'), long);
      expect(objPair('A short text'), null);
    });
    test('— ValStr and ValStr', () {
      final strPair = Pair.str(noUpperCase, Email(mal: malformed));
      expect(strPair(null), null);
      expect(strPair('an_invalid_email@.com'), malformed);
      expect(strPair('a_Capitalized_account@email.com'), upperCaseError);
    });
    group('heterogeneous pairs', () {
      test('— ValStr and ValObj', () {
        const tooShort = 'too short';
        final str1st = Pair.str1(noUpperCase, Len.min(5, less: tooShort));
        expect(str1st(null), null);
        expect(str1st('1234'), tooShort);
        expect(str1st('Titlecase Text'), upperCaseError);
        expect(str1st('this should pass'), null);
      });
      test('— ValObj and ValStr', () {
        const tooLong = 'too long';
        final str2nd = Pair.str2(Len.max(20, great: tooLong), noUpperCase);
        expect(str2nd(null), null);
        expect(str2nd('abcdefghijklmnopqrstuvwxyz'), tooLong);
        expect(str2nd('Titlecase Text'), upperCaseError);
        expect(str2nd('this should pass'), null);
      });
    });
  });
}
