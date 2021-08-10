import 'package:formdator/formdator.dart';
import 'package:test/test.dart';

void main() {
  const error = 'The value must be numeric';
  final numeric = Num(non: error);

  group('Num', () {
    group('():', () {
      group('Valid input - ', () {
        test('null', () {
          expect(numeric(null), null);
        });
        test('single digit', () {
          expect(numeric('0'), null);
          expect(numeric('9'), null);
        });
        test('many digits', () {
          expect(numeric('01234567899876543210'), null);
        });
        test('plus sign', () {
          expect(numeric('+0'), null);
          expect(numeric('+999'), null);
        });
        test('minus sign', () {
          expect(numeric('-0'), null);
          expect(numeric('-1'), null);
        });
      });
      group('Invalid input', () {
        test('empty', () {
          expect(numeric(''), error);
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
      final numMin = Num.min(10, non: error, small: small);
      test('null input', () {
        expect(numMin(null), null);
      });
      test('empty input', () {
        expect(numMin(''), error);
      });
      test('too small', () {
        expect(numMin('0'), small);
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
      final pos = Num.pos(non: error, neg: neg);
      test('null', () {
        expect(pos(null), null);
      });
      test('empty', () {
        expect(pos(''), error);
      });
      test('valid input', () {
        expect(pos('0'), null);
        expect(pos('0.001'), null);
        expect(pos('+0.1'), null);
        expect(pos('0.99'), null);
        expect(pos('10'), null);
        expect(pos('10000000000'), null);
      });
      group('Invalid input', () {
        test('negative numbers', () {
          expect(pos('-0.001'), neg);
          expect(pos('-0.9999'), neg);
          expect(pos('-1'), neg);
          expect(pos('-1.1'), neg);
          expect(pos('-10'), neg);
          expect(pos('-10000000000'), neg);
        });
        test('null', () {
          expect(pos(null), null);
        });
        test('empty', () {
          expect(pos(''), error);
        });
        test('last digit non-integer', () {
          expect(pos('123456789987654321X'), error);
        });
        test('non-numeric', () {
          expect(pos('.'), error);
          expect(pos('11,111'), error);
          expect(pos('11A'), error);
          expect(pos('A1122'), error);
          expect(pos('000099999X'), error);
        });
      });
    });
    group('max:', () {
      const large = 'too large';
      final numMax = Num.max(10, non: error, large: large);
      test('null', () {
        expect(numMax(null), null);
      });
      test('empty', () {
        expect(numMax(''), error);
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
      const pos = 'negative number';
      final neg = Num.neg(non: error, pos: pos);
      test('null', () {
        expect(neg(null), null);
      });
      test('empty', () {
        expect(neg(''), error);
      });
      test('valid input', () {
        expect(neg('-0.001'), null);
        expect(neg('-0.9'), null);
        expect(neg('-1'), null);
        expect(neg('-100'), null);
        expect(neg('-100000000000'), null);
      });
      group('Invalid input', () {
        test('negative numbers', () {
          expect(neg('0'), pos);
          expect(neg('0.001'), pos);
          expect(neg('1'), pos);
          expect(neg('1.1'), pos);
          expect(neg('10'), pos);
          expect(neg('10000000000'), pos);
        });
        test('null', () {
          expect(neg(null), null);
        });
        test('empty', () {
          expect(neg(''), error);
        });
        test('last digit non-integer', () {
          expect(neg('123456789987654321X'), error);
        });
        test('non-numeric', () {
          expect(neg('.'), error);
          expect(neg('11,111'), error);
          expect(neg('11A'), error);
          expect(neg('A1122'), error);
          expect(neg('000099999X'), error);
        });
      });
    });
    group('range:', () {
      const small = 'too small';
      const large = 'too large';
      final range = Num.range(1, 10, non: error, small: small, large: large);
      final negRange =
          Num.range(-10, -1, non: error, small: small, large: large);
      test('null', () {
        expect(range(null), null);
        expect(negRange(null), null);
      });
      test('empty', () {
        expect(range(''), error);
        expect(negRange(''), error);
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
