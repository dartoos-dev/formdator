import 'package:flutter_test/flutter_test.dart';
import 'package:formdator/formdator.dart';

void main() {
  const error = 'value is too long';
  group('MaxLen —', () {
    group('assertion and type error:', () {
      test('negative length', () {
        expect(() => MaxLen(-1), throwsAssertionError);
      });
      test('input type other than String, Iterable, or Map', () {
        const number = 10;
        expect(() => const MaxLen(10).call(number), throwsArgumentError);
      });
    });
    group('String input', () {
      test('length = 0', () {
        const noLength = MaxLen(0, long: error);
        expect(noLength(null), null);
        expect(noLength(''), null);
        expect(noLength('a'), error);
      });
      test('length = 1', () {
        const one = MaxLen(1, long: error);
        expect(one(null), null);
        expect(one(''), null);
        expect(one('a'), null);
        expect(one('ab'), error);
        expect(one('abc'), error);
      });
      test('length = 10', () {
        const ten = MaxLen(10, long: error);
        expect(ten(null), null);
        expect(ten(''), null);
        expect(ten('a'), null);
        expect(ten('ab'), null);
        expect(ten('abcdefghij'), null);
        expect(ten('abcdefghijk'), error);
        expect(ten('abcdefghijklmnopqrstuvwxyz'), error);
      });
    });
    group('Iterable input', () {
      test('length = 0', () {
        const noLength = MaxLen(0, long: error);
        expect(noLength(null), null);
        expect(noLength([]), null);
        expect(noLength(['a']), error);
      });
      test('length = 1', () {
        const one = MaxLen(1, long: error);
        expect(one(null), null);
        expect(one([]), null);
        expect(one(['a']), null);
        expect(one(['a', 'b']), error);
        expect(one(['a', 'b', 'c']), error);
      });
      test('length = 10', () {
        const ten = MaxLen(10, long: error);
        expect(ten(null), null);
        expect(ten([]), null);
        expect(ten(['a']), null);
        expect(ten(['a', 'b']), null);
        expect(ten(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j']), null);
        expect(
          ten(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k']),
          error,
        );
      });
    });
    group('Map input', () {
      test('length = 0', () {
        const noLength = MaxLen(0, long: error);
        expect(noLength(null), null);
        expect(noLength({}), null);
        expect(noLength({1: 'a'}), error);
      });
      test('length = 1', () {
        const one = MaxLen(1, long: error);
        expect(one(null), null);
        expect(one({}), null);
        expect(one({1: 'a'}), null);
        expect(one({1: 'a', 2: 'b'}), error);
        expect(one({1: 'a', 2: 'b', 3: 'c'}), error);
      });
      test('length = 10', () {
        const ten = MaxLen(10, long: error);
        expect(ten(null), null);
        expect(ten({}), null);
        expect(ten({1: 'a'}), null);
        expect(ten({1: 'a', 2: 'b'}), null);
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
            error);
      });
    });
  });
}
