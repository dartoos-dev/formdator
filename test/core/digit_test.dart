import 'package:flutter_test/flutter_test.dart';
import 'package:formdator/formdator.dart';

void main() {
  group('Digit —', () {
    const error = 'the data must only contain digits';
    const diff = 'value length error';
    const short = 'the value is too short';
    const long = 'the value is too long';
    final dig = Digit(non: error);
    final digLen = Digit.len(2, non: error, diff: diff);
    final digMin = Digit.min(3, non: error, short: short);
    final digMax = Digit.max(6, non: error, long: long);
    final digRange = Digit.range(4, 6, non: error, short: short, long: long);
    test('null', () {
      expect(dig(null), null);
      expect(digLen(null), null);
      expect(digMin(null), null);
      expect(digMax(null), null);
      expect(digRange(null), null);
    });
    test('empty', () {
      expect(dig(''), error);
      expect(digLen(''), error);
      expect(digMin(''), error);
      expect(digMax(''), error);
      expect(digRange(''), error);
    });
    test('4 digits', () {
      const fourDigits = '1234';
      expect(dig(fourDigits), null);
      expect(digLen(fourDigits), diff);
      expect(digMin(fourDigits), null);
      expect(digMax(fourDigits), null);
      expect(digRange(fourDigits), null);
    });
    test('6 digits', () {
      const sixDigits = '123456';
      expect(dig(sixDigits), null);
      expect(digLen(sixDigits), diff);
      expect(digMin(sixDigits), null);
      expect(digMax(sixDigits), null);
      expect(digRange(sixDigits), null);
    });
    test('short value', () {
      const twoDigits = '99';
      expect(dig(twoDigits), null);
      expect(digLen(twoDigits), null);
      expect(digMin(twoDigits), short);
      expect(digMax(twoDigits), null);
      expect(digRange(twoDigits), short);
    });
    test('long value', () {
      const manyDigits = '01234567899876543210';
      expect(dig(manyDigits), null);
      expect(digLen(manyDigits), diff);
      expect(digMin(manyDigits), null);
      expect(digMax(manyDigits), long);
      expect(digRange(manyDigits), long);
    });
    test('the last char is non-digit', () {
      const invalid = '0123456789987654321X';
      expect(dig(invalid), error);
      expect(digLen(invalid), error);
      expect(digMin(invalid), error);
      expect(digMax(invalid), error);
      expect(digRange(invalid), error);
    });
    test('floating-point', () {
      const floatPoint = '1.23456';
      expect(dig(floatPoint), error);
      expect(digLen(floatPoint), error);
      expect(digMin(floatPoint), error);
      expect(digMax(floatPoint), error);
      expect(digRange(floatPoint), error);
    });
    test('plus sign', () {
      const plusSign = '+0';
      expect(dig(plusSign), error);
      expect(digLen(plusSign), error);
      expect(digMin(plusSign), error);
      expect(digMax(plusSign), error);
      expect(digRange(plusSign), error);
    });
    test('minus sign', () {
      const minusSign = '-1';
      expect(dig(minusSign), error);
      expect(digLen(minusSign), error);
      expect(digMin(minusSign), error);
      expect(digMax(minusSign), error);
      expect(digRange(minusSign), error);
    });
    test('assertions', () {
      expect(() => Digit.len(-1), throwsAssertionError);
      expect(() => Digit.min(-1), throwsAssertionError);
      expect(() => Digit.max(0), throwsAssertionError);
      expect(() => Digit.range(0, 1), throwsAssertionError);
      expect(() => Digit.range(1, -1), throwsAssertionError);
      expect(() => Digit.range(2, 2), throwsAssertionError);
      expect(() => Digit.range(5, 4), throwsAssertionError);
    });
  });
}
