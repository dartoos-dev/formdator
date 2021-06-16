import 'package:flutter_test/flutter_test.dart';
import 'package:formdator/formdator.dart';

void main() {
  const error = 'Value must contain only digits';
  const digits = Digit(non: error);
  group('Valid inputs - ', () {
    test('null', () {
      expect(digits(null), null);
    });
    test('single digit', () {
      expect(digits('0'), null);
      expect(digits('9'), null);
    });
    test('many digits', () {
      expect(digits('01234567899876543210'), null);
    });
  });
  group('Invalid inputs', () {
    test('empty', () {
      expect(digits(''), error);
    });
    test('many digits except the last one', () {
      expect(digits('0123456789987654321X'), error);
    });
    test('non-digits', () {
      expect(digits('.'), error);
      expect(digits('11A'), error);
      expect(digits('A1122'), error);
      expect(digits('000099999X'), error);
    });
    test('floating-point', () {
      expect(digits('1.23456'), error);
    });
    test('floating-point with comman', () {
      expect(digits('11,111'), error);
    });
    test('plus sign', () {
      expect(digits('+0'), error);
      expect(digits('+999'), error);
    });
    test('minus sign', () {
      expect(digits('-0'), error);
      expect(digits('-1'), error);
    });
  });
}
