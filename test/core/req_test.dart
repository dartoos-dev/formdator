import 'package:flutter_test/flutter_test.dart';
import 'package:formdator/formdator.dart';

void main() {
  group('Req validator', () {
    const error = 'required field';
    const errorVal = 'out of range';
    const errorStr = 'digits only';
    const errorMany = 'always wrong';
    final req = Req(blank: error);
    final reqVal =
        Req.val(Len.range(1, 3, less: errorVal, great: errorVal), blank: error);
    final reqStr = Req.str(Digit(non: errorStr), blank: error);
    final reqMany =
        Req.many([const Ok(), const Nok(error: errorMany)], blank: error);
    group('- valid inputs:', () {
      test('a short value', () {
        const short = '1';
        expect(req(short), null);
        expect(reqVal(short), null);
        expect(reqStr(short), null);
        expect(reqMany(short), errorMany);
      });
      test('a long value', () {
        const long = 'abcdefghijklmnopqrstuvwxyz-1234567890';
        expect(req(long), null);
        expect(reqVal(long), errorVal);
        expect(reqStr(long), errorStr);
        expect(reqMany(long), errorMany);
      });
      test('non-digits, non-alpha chars', () {
        const nonDigits = '@#\$*()-+=-';
        expect(req(nonDigits), null);
        expect(reqVal(nonDigits), errorVal);
        expect(reqStr(nonDigits), errorStr);
        expect(reqMany(nonDigits), errorMany);
      });
      test('Iterable input', () {
        const iter = ['123', '45'];
        expect(req(iter), null);
        expect(reqVal(iter), null);
        expect(reqStr(iter), errorStr);
        expect(reqMany(iter), errorMany);
      });
      test('Map input', () {
        expect(req({'key1': 1, 'key2': "two"}), null);
        expect(reqVal({'key1': 1, 'key2': "two"}), null);
        expect(reqStr({'key1': 1, 'key2': "two"}), errorStr);
        expect(reqMany({'key1': 1, 'key2': "two"}), errorMany);
      });
    });
    group('- invalid inputs:', () {
      test('null', () {
        expect(req(null), error);
        expect(reqVal(null), error);
        expect(reqStr(null), error);
        expect(reqMany(null), error);
      });
      test('empty string', () {
        expect(req(''), error);
        expect(reqVal(''), error);
        expect(reqStr(''), error);
        expect(reqMany(''), error);
      });
      test('empty iterable', () {
        expect(req([]), error);
        expect(reqVal([]), error);
        expect(reqStr([]), error);
        expect(reqMany([]), error);
      });
      test('empty map', () {
        expect(req({}), error);
        expect(reqVal({}), error);
        expect(reqStr({}), error);
        expect(reqMany({}), error);
      });
    });
  });
}
