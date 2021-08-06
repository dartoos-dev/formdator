import 'package:flutter_test/flutter_test.dart';
import 'package:formdator/formdator.dart';

void main() {
  group('Req validator', () {
    const error = 'required field';
    const req = Req(blank: error);
    group('- valid inputs:', () {
      test('a short value', () {
        const short = '1';
        expect(req(short), null);
      });
      test('a long value', () {
        const long = 'abcdefghijklmnopqrstuvwxyz-1234567890';
        expect(req(long), null);
      });
      test('non-digits, non-alpha chars', () {
        const nonDigits = '@#\$*()-+=-';
        expect(req(nonDigits), null);
      });
      test('Iterable input', () {
        const iter = ['123', '45'];
        expect(req(iter), null);
      });
      test('Map input', () {
        expect(req({'key1': 1, 'key2': "two"}), null);
      });
    });
    group('- invalid inputs:', () {
      test('null', () {
        expect(req(null), error);
      });
      test('empty string', () {
        expect(req(''), error);
      });
      test('empty iterable', () {
        expect(req(<int>[]), error);
      });
      test('empty map', () {
        expect(req(<int, int>{}), error);
      });
    });
  });
}
