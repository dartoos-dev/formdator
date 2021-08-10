import 'package:formdator/formdator.dart';
import 'package:test/test.dart';

void main() {
  group('ReqDigit —', () {
    const blank = 'it cannot be left blank';
    const error = 'the data must only contain digits';
    const diff = 'length error';
    const less = 'the length is too short';
    const great = 'the length is too long';
    final reqDig = ReqDigit(blank: blank, mal: error);
    final reqDigLen = ReqDigit.len(2, blank: blank, mal: error, diff: diff);
    final reqDigMin = ReqDigit.min(3, blank: blank, mal: error, less: less);
    final reqDigMax = ReqDigit.max(6, blank: blank, mal: error, great: great);
    final reqDigRange = ReqDigit.range(4, 6,
        blank: blank, mal: error, less: less, great: great);
    test('null', () {
      expect(reqDig(null), blank);
      expect(reqDigLen(null), blank);
      expect(reqDigMin(null), blank);
      expect(reqDigMax(null), blank);
      expect(reqDigRange(null), blank);
    });
    test('empty', () {
      expect(reqDig(''), blank);
      expect(reqDigLen(''), blank);
      expect(reqDigMin(''), blank);
      expect(reqDigMax(''), blank);
      expect(reqDigRange(''), blank);
    });
    test('4 digits', () {
      const fourDigits = '1234';
      expect(reqDig(fourDigits), null);
      expect(reqDigLen(fourDigits), diff);
      expect(reqDigMin(fourDigits), null);
      expect(reqDigMax(fourDigits), null);
      expect(reqDigRange(fourDigits), null);
    });
    test('6 digits', () {
      const sixDigits = '123456';
      expect(reqDig(sixDigits), null);
      expect(reqDigLen(sixDigits), diff);
      expect(reqDigMin(sixDigits), null);
      expect(reqDigMax(sixDigits), null);
      expect(reqDigRange(sixDigits), null);
    });
    test('less value', () {
      const twoDigits = '99';
      expect(reqDig(twoDigits), null);
      expect(reqDigLen(twoDigits), null);
      expect(reqDigMin(twoDigits), less);
      expect(reqDigMax(twoDigits), null);
      expect(reqDigRange(twoDigits), less);
    });
    test('great value', () {
      const manyDigits = '01234567899876543210';
      expect(reqDig(manyDigits), null);
      expect(reqDigLen(manyDigits), diff);
      expect(reqDigMin(manyDigits), null);
      expect(reqDigMax(manyDigits), great);
      expect(reqDigRange(manyDigits), great);
    });
    test('the last char is non-digit', () {
      const invalid = '0123456789987654321X';
      expect(reqDig(invalid), error);
      expect(reqDigLen(invalid), error);
      expect(reqDigMin(invalid), error);
      expect(reqDigMax(invalid), error);
      expect(reqDigRange(invalid), error);
    });
    test('floating-point', () {
      const floatPoint = '1.23456';
      expect(reqDig(floatPoint), error);
      expect(reqDigLen(floatPoint), error);
      expect(reqDigMin(floatPoint), error);
      expect(reqDigMax(floatPoint), error);
      expect(reqDigRange(floatPoint), error);
    });
    test('plus sign', () {
      const plusSign = '+0';
      expect(reqDig(plusSign), error);
      expect(reqDigLen(plusSign), error);
      expect(reqDigMin(plusSign), error);
      expect(reqDigMax(plusSign), error);
      expect(reqDigRange(plusSign), error);
    });
    test('minus sign', () {
      const minusSign = '-1';
      expect(reqDig(minusSign), error);
      expect(reqDigLen(minusSign), error);
      expect(reqDigMin(minusSign), error);
      expect(reqDigMax(minusSign), error);
      expect(reqDigRange(minusSign), error);
    });
    test('assertions', () {
      expect(() => Digit.len(-1), throwsA(isA<AssertionError>()));
      expect(() => Digit.min(-1), throwsA(isA<AssertionError>()));
      expect(() => Digit.max(0), throwsA(isA<AssertionError>()));
      expect(() => Digit.range(0, 1), throwsA(isA<AssertionError>()));
      expect(() => Digit.range(1, -1), throwsA(isA<AssertionError>()));
      expect(() => Digit.range(2, 2), throwsA(isA<AssertionError>()));
      expect(() => Digit.range(5, 4), throwsA(isA<AssertionError>()));
    });
  });
}
