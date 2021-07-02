import 'package:flutter_test/flutter_test.dart';
import 'package:formdator/formdator.dart';

void main() {
  const error = 'The value must be numeric';
  const absent = 'absent value';
  final numeric = Num(nan: error);
  final reqNum = Num.req(nan: error, blank: absent);
  group('Valid inputs - ', () {
    test('null', () {
      expect(numeric(null), null);
      expect(reqNum(null), absent);
    });
    test('single digit', () {
      expect(numeric('0'), null);
      expect(numeric('9'), null);
      expect(reqNum('0'), null);
      expect(reqNum('9'), null);
    });
    test('many numeric', () {
      expect(numeric('01234567899876543210'), null);
      expect(reqNum('01234567899876543210'), null);
    });
  });
  group('Invalid inputs', () {
    test('empty', () {
      expect(numeric(''), error);
      expect(reqNum(''), absent);
    });
    test('many numeric except the last one', () {
      expect(numeric('0123456789987654321X'), error);
      expect(reqNum('0123456789987654321X'), error);
    });
    test('non-numeric', () {
      expect(numeric('.'), error);
      expect(numeric('11A'), error);
      expect(numeric('A1122'), error);
      expect(numeric('000099999X'), error);
      expect(reqNum('.'), error);
      expect(reqNum('11A'), error);
      expect(reqNum('A1122'), error);
      expect(reqNum('000099999X'), error);
    });
    test('floating-point', () {
      expect(numeric('1.23456'), null);
      expect(reqNum('1.23456'), null);
    });
    test('floating-point with comman', () {
      expect(numeric('11,111'), error);
      expect(reqNum('11,111'), error);
    });
    test('plus sign', () {
      expect(numeric('+0'), null);
      expect(numeric('+999'), null);
      expect(reqNum('+0'), null);
      expect(reqNum('+999'), null);
    });
    test('minus sign', () {
      expect(numeric('-0'), null);
      expect(numeric('-1'), null);
      expect(reqNum('-0'), null);
      expect(reqNum('-1'), null);
    });
  });
  group('range —', () {
    const small = 'too small number';
    const large = 'too large number';
    final range = Num(nan: error, min: 1, small: small, max: 10, large: large);
    final reqRange = Num.req(
        blank: absent, nan: error, min: 1, small: small, max: 10, large: large);
    test('null input', () {
      expect(range(null), null);
      expect(reqRange(null), absent);
    });
    test('empty input', () {
      expect(range(''), error);
      expect(reqRange(''), absent);
    });
    test('too small', () {
      expect(range('0'), small);
      expect(reqRange('0'), small);
    });
    test('too large', () {
      expect(range('11'), large);
      expect(reqRange('11'), large);
    });
    test('input value within range', () {
      expect(range('5'), null);
      expect(reqRange('6'), null);
    });
  });
}
