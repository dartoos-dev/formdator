import 'package:formdator/formdator.dart';
import 'package:test/test.dart';

void main() {
  const blank = 'The value is required';
  const error = 'The value must be numeric';
  final numeric = ReqNum(blank: blank, mal: error);

  group('ReqNum', () {
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
      final numMin = ReqNum.min(10, blank: blank, mal: error, small: small);
      test('null input', () {
        expect(numMin(null), blank);
      });
      test('empty input', () {
        expect(numMin(''), blank);
      });
      test('too small', () {
        expect(numMin('9'), small);
        expect(numMin('9.9'), small);
        expect(numMin('-10'), small);
      });
      test('valid input', () {
        expect(numMin('10.1'), null);
        expect(numMin('9999999999'), null);
      });
    });
    group('pos:', () {
      const neg = 'negative number';
      final pos = ReqNum.pos(blank: blank, mal: error, neg: neg);
      test('null input', () {
        expect(pos(null), blank);
      });
      test('empty input', () {
        expect(pos(''), blank);
      });
      test('negative numbers', () {
        expect(pos('-0.001'), neg);
        expect(pos('-1'), neg);
        expect(pos('-1.1'), neg);
        expect(pos('-10'), neg);
        expect(pos('-10000000000'), neg);
      });
      test('valid input', () {
        expect(pos('0'), null);
        expect(pos('1.1'), null);
        expect(pos('+2.222222'), null);
        expect(pos('10'), null);
        expect(pos('10000000000'), null);
      });
    });
    group('max:', () {
      const large = 'too large';
      final numMax = ReqNum.max(10, blank: blank, mal: error, large: large);
      test('null', () {
        expect(numMax(null), blank);
      });
      test('empty', () {
        expect(numMax(''), blank);
      });
      test('too large', () {
        expect(numMax('10.1'), large);
        expect(numMax('99999999999'), large);
      });
      test('valid', () {
        expect(numMax('0'), null);
        expect(numMax('-1'), null);
        expect(numMax('-9999999999'), null);
        expect(numMax('9.9'), null);
      });
    });
    group('neg:', () {
      const pos = 'positive number';
      final neg = ReqNum.neg(blank: blank, mal: error, pos: pos);
      test('null', () {
        expect(neg(null), blank);
      });
      test('empty', () {
        expect(neg(''), blank);
      });
      test('positive numbers', () {
        expect(neg('0'), pos);
        expect(neg('1.1'), pos);
        expect(neg('+2.22'), pos);
        expect(neg('10'), pos);
        expect(neg('10000000000'), pos);
      });
      test('valid', () {
        expect(neg('-0.001'), null);
        expect(neg('-1'), null);
        expect(neg('-1.1'), null);
        expect(neg('-10'), null);
        expect(neg('-10000000000'), null);
      });
    });
    group('range:', () {
      const small = 'too small';
      const large = 'too large';
      final range = ReqNum.range(
        1,
        10,
        blank: blank,
        mal: error,
        small: small,
        large: large,
      );
      final negRange = ReqNum.range(
        -10,
        -1,
        blank: blank,
        mal: error,
        small: small,
        large: large,
      );
      test('null', () {
        expect(range(null), blank);
        expect(negRange(null), blank);
      });
      test('empty', () {
        expect(range(''), blank);
        expect(negRange(''), blank);
      });
      test('too small', () {
        expect(range('0.9'), small);
        expect(range('0'), small);
        expect(range('-9'), small);
        expect(negRange('-10.1'), small);
        expect(negRange('-11'), small);
      });
      test('too large', () {
        expect(range('10.1'), large);
        expect(range('999999'), large);
        expect(negRange('-0.9'), large);
        expect(negRange('999999'), large);
      });

      test('illegal range, min >= max', () {
        expect(() => Num.range(10, 1), throwsA(isA<AssertionError>()));
        expect(() => Num.range(10, 10), throwsA(isA<AssertionError>()));
      });
      test('valid input', () {
        expect(range('5'), null);
        expect(negRange('-5'), null);
      });
    });
  });
}
