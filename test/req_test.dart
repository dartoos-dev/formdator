import 'package:flutter_test/flutter_test.dart';
import 'package:callor/callor.dart';

import 'counter.dart';

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
    group(' - extra step validation', () {
      test('valid input', () {
        final count = Counter();
        final extraVal = Req(val: count, blank: error);
        expect(extraVal('a'), null);
        expect(extraVal('abcdefghijklmnopqrstuvwxyz-1234567890'), null);
        expect(count.value, 2);
      });
      test('invalid input', () {
        final count = Counter();
        final extraInval = Req(val: count, blank: error);
        expect(extraInval(null), error);
        expect(extraInval(''), error);
        expect(count.value, 0);
      });
    });
  });
}
