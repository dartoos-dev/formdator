import 'package:flutter_test/flutter_test.dart';
import 'package:callor/callor.dart';

void main() {
  const error = 'value is too short';
  group('MinLen validator', () {
    test('- special case: min length = 0', () {
      const noLength = MinLen(0, short: error);
      expect(noLength(null), null);
      expect(noLength(''), null);
      expect(noLength('a'), null);
    });
    test('- min length = 1', () {
      const one = MinLen(1, short: error);
      expect(one(null), null);
      expect(one(''), error);
      expect(one('a'), null);
      expect(one('ab'), null);
    });
    test('- min length = 10', () {
      const ten = MinLen(10, short: error);
      expect(ten(null), null);
      expect(ten(''), error);
      expect(ten('a'), error);
      expect(ten('ab'), error);
      expect(ten('abcdefghi'), error);
      expect(ten('abcdefghij'), null);
      expect(ten('abcdefghijklmnopqrstuvwxyz'), null);
    });
    test('assert error', () {
      expect(() => MinLen(-1), throwsAssertionError);
    });
  });
}
