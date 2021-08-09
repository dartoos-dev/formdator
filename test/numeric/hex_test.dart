import 'package:flutter_test/flutter_test.dart';
import 'package:formdator/formdator.dart';

void main() {
  group('Hex —', () {
    const error = 'the data must only contain hexadecimal digits';
    const diff = 'length error';
    const less = 'the length is too short';
    const great = 'the length is too long';
    const len = 2;
    const min = 3;
    const max = 8;
    final dig = Hex(non: error);
    final digLen = Hex.len(len, non: error, diff: diff);
    final digMin = Hex.min(min, non: error, less: less);
    final digMax = Hex.max(max, non: error, great: great);
    final digRange = Hex.range(min, max, non: error, less: less, great: great);
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
    test('2 digits', () {
      const twoHex = 'FF';
      expect(dig(twoHex), null);
      expect(digLen(twoHex), null);
      expect(digMin(twoHex), less);
      expect(digMax(twoHex), null);
      expect(digRange(twoHex), less);
    });
    test('4 digits', () {
      const fourHexs = 'fe98';
      expect(dig(fourHexs), null);
      expect(digLen(fourHexs), diff);
      expect(digMin(fourHexs), null);
      expect(digMax(fourHexs), null);
      expect(digRange(fourHexs), null);
    });
    test('8 digits', () {
      const eightHexs = 'CafeBabe';
      expect(dig(eightHexs), null);
      expect(digLen(eightHexs), diff);
      expect(digMin(eightHexs), null);
      expect(digMax(eightHexs), null);
      expect(digRange(eightHexs), null);
    });
    test('16 hex-digits', () {
      const tenHex = '0123456789ABCDEF';
      expect(dig(tenHex), null);
      expect(digLen(tenHex), diff);
      expect(digMin(tenHex), null);
      expect(digMax(tenHex), great);
      expect(digRange(tenHex), great);
    });
    test('the last char is a non-hex-digit', () {
      const invalid = '0123456789ABCDEFX';
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
      expect(() => Hex.len(-1), throwsAssertionError);
      expect(() => Hex.min(-1), throwsAssertionError);
      expect(() => Hex.max(0), throwsAssertionError);
      expect(() => Hex.range(0, 1), throwsAssertionError);
      expect(() => Hex.range(1, -1), throwsAssertionError);
      expect(() => Hex.range(2, 2), throwsAssertionError);
      expect(() => Hex.range(5, 4), throwsAssertionError);
    });
  });
}