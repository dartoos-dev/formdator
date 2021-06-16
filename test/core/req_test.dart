import 'package:flutter_test/flutter_test.dart';
import 'package:formdator/formdator.dart';

void main() {
  const error = 'required field';
  const req = Req(blank: error);
  group('Req validator', () {
    group('- valid inputs:', () {
      test('a short value', () {
        expect(req('a'), null);
      });
      test('a long value', () {
        expect(req('abcdefghijklmnopqrstuvwxyz-1234567890'), null);
      });
      test('non-digits, non-alpha chars', () {
        expect(req('@#\$*()-+=-'), null);
      });
      test('Iterable input', () {
        expect(req(['abc', '123']), null);
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
        expect(req([]), error);
      });
      test('empty map', () {
        expect(req({}), error);
      });
    });
  });
}
