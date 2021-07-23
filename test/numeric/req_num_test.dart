import 'package:flutter_test/flutter_test.dart';
import 'package:formdator/formdator.dart';

void main() {
  const blank = 'The value is required';
  const error = 'The value must be numeric';
  final numeric = ReqNum(blank: blank, nan: error);

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
      final numMin = ReqNum.min(10, blank: blank, nan: error, small: small);
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
    group('max:', () {
      const large = 'too large';
      final numMax = ReqNum.max(10, blank: blank, nan: error, large: large);
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
    group('range:', () {
      const small = 'too small';
      const large = 'too large';
      final range = ReqNum.range(1, 10,
          blank: blank, nan: error, small: small, large: large);
      final negRange = ReqNum.range(-10, -1,
          blank: blank, nan: error, small: small, large: large);
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
        expect(() => Num.range(10, 1), throwsAssertionError);
        expect(() => Num.range(10, 10), throwsAssertionError);
      });
      test('valid input', () {
        expect(range('5'), null);
        expect(negRange('-5'), null);
      });
    });
  });
}
