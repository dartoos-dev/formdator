import 'package:flutter_test/flutter_test.dart';
import 'package:formdator/formdator.dart';

void main() {
  const error = 'value is too short';
  group('MinLen —', () {
    group('assertion and type error:', () {
      test('negative length', () {
        expect(() => MinLen(-1), throwsAssertionError);
      });
      test('input type other than String, Iterable, or Map', () {
        const number = 10;
        expect(() => const MinLen(10).call(number), throwsArgumentError);
      });
    });
    group('String input', () {
      test('length = 0', () {
        const noLength = MinLen(0, short: error);
        expect(noLength(null), null);
        expect(noLength(''), null);
        expect(noLength('a'), null);
      });
      test('length = 1', () {
        const one = MinLen(1, short: error);
        expect(one(null), null);
        expect(one(''), error);
        expect(one('a'), null);
        expect(one('ab'), null);
        expect(one('abc'), null);
      });
      test('length = 10', () {
        const ten = MinLen(10, short: error);
        expect(ten(null), null);
        expect(ten(''), error);
        expect(ten('a'), error);
        expect(ten('ab'), error);
        expect(ten('abcdefghij'), null);
        expect(ten('abcdefghijk'), null);
        expect(ten('abcdefghijklmnopqrstuvwxyz'), null);
      });
    });
    group('Iterable input', () {
      test('length = 0', () {
        const noLength = MinLen(0, short: error);
        expect(noLength(null), null);
        expect(noLength([]), null);
        expect(noLength(['a']), null);
      });
      test('length = 1', () {
        const one = MinLen(1, short: error);
        expect(one(null), null);
        expect(one([]), error);
        expect(one(['a']), null);
        expect(one(['a', 'b']), null);
        expect(one(['a', 'b', 'c']), null);
      });
      test('length = 10', () {
        const ten = MinLen(10, short: error);
        expect(ten(null), null);
        expect(ten([]), error);
        expect(ten(['a']), error);
        expect(ten(['a', 'b']), error);
        expect(ten(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j']), null);
        expect(
          ten(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k']),
          null,
        );
      });
    });
    group('Map input', () {
      test('length = 0', () {
        const noLength = MinLen(0, short: error);
        expect(noLength(null), null);
        expect(noLength({}), null);
        expect(noLength({1: 'a'}), null);
      });
      test('length = 1', () {
        const one = MinLen(1, short: error);
        expect(one(null), null);
        expect(one({}), error);
        expect(one({1: 'a'}), null);
        expect(one({1: 'a', 2: 'b'}), null);
        expect(one({1: 'a', 2: 'b', 3: 'c'}), null);
      });
      test('length = 10', () {
        const ten = MinLen(10, short: error);
        expect(ten(null), null);
        expect(ten({}), error);
        expect(ten({1: 'a'}), error);
        expect(ten({1: 'a', 2: 'b'}), error);
        expect(
            ten({
              1: 'a',
              2: 'b',
              3: 'c',
              4: 'd',
              5: 'e',
              6: 'f',
              7: 'g',
              8: 'h',
              9: 'j',
              10: 'k'
            }),
            null);
        expect(
            ten({
              1: 'a',
              2: 'b',
              3: 'c',
              4: 'd',
              5: 'e',
              6: 'f',
              7: 'g',
              8: 'h',
              9: 'j',
              10: 'k',
              11: 'j'
            }),
            null);
      });
    });
  });
}
