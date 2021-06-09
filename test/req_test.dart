import 'package:flutter_test/flutter_test.dart';
import 'package:callor/callor.dart';

void main() {
  const error = 'required';
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
    });
    group('- invalid inputs:', () {
      test('null', () {
        expect(req(null), error);
      });
      test('the empty string', () {
        expect(req(''), error);
      });
    });
  });
}
