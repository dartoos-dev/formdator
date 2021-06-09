import 'package:flutter_test/flutter_test.dart';
import 'package:callor/callor.dart';

void main() {
  const error = 'value is too long';
  group('MaxLen validator', () {
    test('- special case: max length = 0', () {
      const noLength = MaxLen(0, tooLong: error);
      expect(noLength(null), null);
      expect(noLength(''), null);
      expect(noLength('a'), error);
    });
    test('- max length = 1', () {
      const one = MaxLen(1, tooLong: error);
      expect(one(null), null);
      expect(one(''), null);
      expect(one('a'), null);
      expect(one('ab'), error);
      expect(one('abc'), error);
    });
    test(' - max length = 10', () {
      const ten = MaxLen(10, tooLong: error);
      expect(ten(null), null);
      expect(ten(''), null);
      expect(ten('a'), null);
      expect(ten('ab'), null);
      expect(ten('abcdefghij'), null);
      expect(ten('abcdefghijk'), error);
      expect(ten('abcdefghijklmnopqrstuvwxyz'), error);
    });
  });
}
