import 'package:flutter_test/flutter_test.dart';
import 'package:formdator/formdator.dart';

void main() {
  const error = 'The value must be numeric';
  final numeric = Num(nan: error);

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
      final numMin = Num.min(10, nan: error, small: small);
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
    group('max:', () {
      const large = 'too large';
      final numMax = Num.max(10, nan: error, large: large);
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
    group('range:', () {
      const small = 'too small';
      const large = 'too large';
      final range = Num.range(1, 10, nan: error, small: small, large: large);
      final negRange =
          Num.range(-10, -1, nan: error, small: small, large: large);
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

      test('illegal range, min > max', () {
        expect(() => Num.range(10, 1), throwsAssertionError);
      });
      test('valid input', () {
        expect(range('5'), null);
        expect(negRange('-5'), null);
      });
    });
  });
}
