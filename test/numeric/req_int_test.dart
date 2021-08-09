import 'package:flutter_test/flutter_test.dart';
import 'package:formdator/formdator.dart';

void main() {
  const blank = 'The value is required';
  const error = 'The value must be numeric';
  final numeric = ReqInt(blank: blank, non: error);

  group('ReqInt', () {
    group('():', () {
      group('Valid input - ', () {
        test('null', () {
          expect(numeric(null), blank);
        });
        test('single digit', () {
          expect(numeric('1'), null);
          expect(numeric('2'), null);
        });
        test('many digits', () {
          expect(numeric('01234567899876543210'), null);
        });
        test('plus sign', () {
          expect(numeric('+0'), null);
          expect(numeric('+999'), null);
        });
        test('minus sign', () {
          expect(numeric('-100'), null);
          expect(numeric('+100'), null);
        });
      });
      group('Invalid input', () {
        test('empty', () {
          expect(numeric(''), blank);
        });
        test('last digit non-numeric', () {
          expect(numeric('0123456789987654321X'), error);
        });
        test('non-numeric', () {
          expect(numeric('.'), error);
          expect(numeric('11A'), error);
          expect(numeric('A1122'), error);
          expect(numeric('000099999X'), error);
        });
        test('floating-point with comman', () {
          expect(numeric('11,111'), error);
        });
      });
    });
    group('min:', () {
      const small = 'too small';
      final numMin = ReqInt.min(10, blank: blank, non: error, small: small);
      test('null input', () {
        expect(numMin(null), blank);
      });
      test('empty input', () {
        expect(numMin(''), blank);
      });
      test('too small', () {
        expect(numMin('9'), small);
        expect(numMin('-10'), small);
      });
      test('valid input', () {
        expect(numMin('10'), null);
        expect(numMin('1000000000'), null);
      });
    });
    group('pos:', () {
      const neg = 'negative number';
      final pos = ReqInt.pos(blank: blank, non: error, neg: neg);
      test('null input', () {
        expect(pos(null), blank);
      });
      test('empty input', () {
        expect(pos(''), blank);
      });
      test('negative numbers', () {
        expect(pos('-1'), neg);
        expect(pos('-10'), neg);
        expect(pos('-10000000000'), neg);
      });
      test('valid input', () {
        expect(pos('0'), null);
        expect(pos('10'), null);
        expect(pos('10000000000'), null);
      });
    });
    group('max:', () {
      const large = 'too large';
      final numMax = ReqInt.max(10, blank: blank, non: error, large: large);
      test('null', () {
        expect(numMax(null), blank);
      });
      test('empty', () {
        expect(numMax(''), blank);
      });
      test('too large', () {
        expect(numMax('11'), large);
        expect(numMax('10000000000'), large);
      });
      test('valid', () {
        expect(numMax('-10000000000'), null);
        expect(numMax('-1'), null);
        expect(numMax('0'), null);
        expect(numMax('9'), null);
      });
    });
    group('neg:', () {
      const pos = 'too pos';
      final neg = ReqInt.neg(blank: blank, non: error, pos: pos);
      test('null', () {
        expect(neg(null), blank);
      });
      test('empty', () {
        expect(neg(''), blank);
      });
      test('positive numbers', () {
        expect(neg('0'), pos);
        expect(neg('10'), pos);
        expect(neg('10000000000'), pos);
      });
      test('valid', () {
        expect(neg('-1'), null);
        expect(neg('-10'), null);
        expect(neg('-10000000000'), null);
      });
    });
    group('range:', () {
      const small = 'too small';
      const large = 'too large';
      final range = ReqInt.range(1, 10,
          blank: blank, non: error, small: small, large: large);
      final negRange = ReqInt.range(-10, -1,
          blank: blank, non: error, small: small, large: large);
      test('null', () {
        expect(range(null), blank);
        expect(negRange(null), blank);
      });
      test('empty', () {
        expect(range(''), blank);
        expect(negRange(''), blank);
      });
      test('too small', () {
        expect(negRange('-11'), small);
        expect(negRange('-10000000000'), small);
      });
      test('too large', () {
        expect(range('11'), large);
        expect(range('999999'), large);
        expect(negRange('0'), large);
        expect(negRange('999999'), large);
      });

      test('illegal range, min >= max', () {
        expect(() => Int.range(10, 1), throwsAssertionError);
        expect(() => Int.range(10, 10), throwsAssertionError);
      });
      test('valid input', () {
        expect(range('5'), null);
        expect(negRange('-5'), null);
      });
    });
  });
}
