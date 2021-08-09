import 'package:flutter_test/flutter_test.dart';
import 'package:formdator/formdator.dart';

void main() {
  group('Int', () {
    const error = 'The value must be integer';
    final integer = Int(non: error);
    group('():', () {
      group('Valid input - ', () {
        test('null', () {
          expect(integer(null), null);
        });
        test('single digit', () {
          expect(integer('0'), null);
          expect(integer('9'), null);
        });
        test('large integer number', () {
          expect(integer('123456789987654321'), null);
        });
        test('plus sign', () {
          expect(integer('+0'), null);
          expect(integer('+999'), null);
        });
        test('minus sign', () {
          expect(integer('-0'), null);
          expect(integer('-1'), null);
        });
      });
      group('Invalid input', () {
        test('empty', () {
          expect(integer(''), error);
        });
        test('last digit non-integer', () {
          expect(integer('123456789987654321X'), error);
        });
        test('non-integer', () {
          expect(integer('.'), error);
          expect(integer('11,111'), error);
          expect(integer('11A'), error);
          expect(integer('A1122'), error);
          expect(integer('000099999X'), error);
        });
        test('floating-point', () {
          expect(integer('1.1'), error);
          expect(integer('-1.1'), error);
          expect(integer('9.99'), error);
          expect(integer('-9.99'), error);
        });
      });
    });
    group('min:', () {
      const small = 'too small';
      final numMin = Int.min(10, non: error, small: small);
      test('null input', () {
        expect(numMin(null), null);
      });
      test('empty input', () {
        expect(numMin(''), error);
      });
      test('too small', () {
        expect(numMin('-100'), small);
        expect(numMin('-10'), small);
        expect(numMin('0'), small);
        expect(numMin('9'), small);
      });
      test('valid input', () {
        expect(numMin('10'), null);
        expect(numMin('9999999999'), null);
      });
      group('Invalid input', () {
        test('empty', () {
          expect(integer(''), error);
        });
        test('last digit non-integer', () {
          expect(integer('123456789987654321X'), error);
        });
        test('non-integer', () {
          expect(integer('.'), error);
          expect(integer('11,111'), error);
          expect(integer('11A'), error);
          expect(integer('A1122'), error);
          expect(integer('000099999X'), error);
        });
        test('floating-point', () {
          expect(integer('1.1'), error);
          expect(integer('-1.1'), error);
          expect(integer('9.99'), error);
          expect(integer('-9.99'), error);
        });
      });
    });
    group('pos:', () {
      const neg = 'negative number';
      final pos = Int.pos(non: error, neg: neg);
      test('null', () {
        expect(pos(null), null);
      });
      test('empty', () {
        expect(pos(''), error);
      });
      test('valid input', () {
        expect(pos('1'), null);
        expect(pos('10'), null);
        expect(pos('10000000000'), null);
      });
      group('Invalid input', () {
        test('negative numbers', () {
          expect(pos('-1'), neg);
          expect(pos('-10'), neg);
          expect(pos('-10000000000'), neg);
        });
        test('null', () {
          expect(pos(null), null);
        });
        test('empty', () {
          expect(integer(''), error);
        });
        test('last digit non-integer', () {
          expect(integer('123456789987654321X'), error);
        });
        test('non-integer', () {
          expect(integer('.'), error);
          expect(integer('11,111'), error);
          expect(integer('11A'), error);
          expect(integer('A1122'), error);
          expect(integer('000099999X'), error);
        });
        test('floating-point', () {
          expect(integer('1.1'), error);
          expect(integer('-1.1'), error);
          expect(integer('9.99'), error);
          expect(integer('-9.99'), error);
        });
      });
    });
    group('max:', () {
      const large = 'too large';
      final numMax = Int.max(10, non: error, large: large);
      test('null', () {
        expect(numMax(null), null);
      });
      test('empty', () {
        expect(numMax(''), error);
      });
      test('too large', () {
        expect(numMax('11'), large);
        expect(numMax('99999999999'), large);
      });
      test('valid', () {
        expect(numMax('0'), null);
        expect(numMax('-1'), null);
        expect(numMax('-9999999999'), null);
        expect(numMax('9'), null);
      });
      group('Invalid input', () {
        test('empty', () {
          expect(integer(''), error);
        });
        test('last digit non-integer', () {
          expect(integer('123456789987654321X'), error);
        });
        test('non-integer', () {
          expect(integer('.'), error);
          expect(integer('11,111'), error);
          expect(integer('11A'), error);
          expect(integer('A1122'), error);
          expect(integer('000099999X'), error);
        });
        test('floating-point', () {
          expect(integer('1.1'), error);
          expect(integer('-1.1'), error);
          expect(integer('9.99'), error);
          expect(integer('-9.99'), error);
        });
      });
    });
    group('neg:', () {
      const pos = 'positive number';
      final neg = Int.neg(non: error, pos: pos);
      test('null', () {
        expect(neg(null), null);
      });
      test('empty', () {
        expect(neg(''), error);
      });
      test('valid input', () {
        expect(neg('-1'), null);
        expect(neg('-10'), null);
        expect(neg('-10000000000'), null);
      });
      group('Invalid input', () {
        test('positive numbers', () {
          expect(neg('0'), pos);
          expect(neg('1'), pos);
          expect(neg('10'), pos);
          expect(neg('10000000000'), pos);
        });
        test('empty', () {
          expect(integer(''), error);
        });
        test('last digit non-integer', () {
          expect(integer('-123456789987654321X'), error);
        });
        test('non-integer', () {
          expect(integer('.'), error);
          expect(integer('11,111'), error);
          expect(integer('11A'), error);
          expect(integer('A1122'), error);
          expect(integer('000099999X'), error);
        });
        test('floating-point', () {
          expect(integer('1.1'), error);
          expect(integer('-1.1'), error);
          expect(integer('9.99'), error);
          expect(integer('-9.99'), error);
        });
      });
    });
    group('range:', () {
      const small = 'too small';
      const large = 'too large';
      final range = Int.range(1, 10, non: error, small: small, large: large);
      final negRange =
          Int.range(-10, -1, non: error, small: small, large: large);
      test('null', () {
        expect(range(null), null);
        expect(negRange(null), null);
      });
      test('empty', () {
        expect(range(''), error);
        expect(negRange(''), error);
      });
      test('too small', () {
        expect(range('-9999999999'), small);
        expect(range('-11'), small);
      });
      test('too large', () {
        expect(range('11'), large);
        expect(negRange('0'), large);
        expect(range('9999999999999'), large);
      });

      test('illegal range, min >= max', () {
        expect(() => Int.range(10, 1), throwsAssertionError);
        expect(() => Int.range(10, 10), throwsAssertionError);
      });
      test('valid input', () {});
      group('Invalid input', () {
        test('out of range', () {
          expect(range('-5'), small);
          expect(negRange('5'), large);
        });
        test('empty', () {
          expect(range(''), error);
        });
        test('last digit non-integer', () {
          expect(range('1X'), error);
          expect(negRange('-1X'), error);
        });
        test('non-integer', () {
          expect(range('.'), error);
          expect(range('11,111'), error);
          expect(range('11A'), error);
          expect(range('A1122'), error);
          expect(range('000099999X'), error);
        });
        test('floating-point', () {
          expect(range('1.1'), error);
          expect(range('-1.1'), error);
          expect(range('9.99'), error);
          expect(range('-9.99'), error);
        });
      });
    });
  });
}
