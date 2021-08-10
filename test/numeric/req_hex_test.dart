import 'package:formdator/formdator.dart';
import 'package:test/test.dart';

void main() {
  group('ReqHex —', () {
    const blank = 'required field';
    const error = 'the data must only contain hexadecimal digits';
    const diff = 'length error';
    const less = 'the length is too short';
    const great = 'the length is too long';
    const len = 2;
    const min = 3;
    const max = 8;
    final dig = ReqHex(blank: blank, non: error);
    final digLen = ReqHex.len(len, blank: blank, non: error, diff: diff);
    final digMin = ReqHex.min(min, blank: blank, non: error, less: less);
    final digMax = ReqHex.max(max, blank: blank, non: error, great: great);
    final digRange = ReqHex.range(min, max,
        blank: blank, non: error, less: less, great: great);
    test('null', () {
      expect(dig(null), blank);
      expect(digLen(null), blank);
      expect(digMin(null), blank);
      expect(digMax(null), blank);
      expect(digRange(null), blank);
    });
    test('empty', () {
      expect(dig(''), blank);
      expect(digLen(''), blank);
      expect(digMin(''), blank);
      expect(digMax(''), blank);
      expect(digRange(''), blank);
    });
    test('2 digits', () {
      const twoHex = 'AA';
      expect(dig(twoHex), null);
      expect(digLen(twoHex), null);
      expect(digMin(twoHex), less);
      expect(digMax(twoHex), null);
      expect(digRange(twoHex), less);
    });
    test('4 digits', () {
      const fourHexs = 'ab1C';
      expect(dig(fourHexs), null);
      expect(digLen(fourHexs), diff);
      expect(digMin(fourHexs), null);
      expect(digMax(fourHexs), null);
      expect(digRange(fourHexs), null);
    });
    test('8 digits', () {
      const eightHexs = 'BABE123';
      expect(dig(eightHexs), null);
      expect(digLen(eightHexs), diff);
      expect(digMin(eightHexs), null);
      expect(digMax(eightHexs), null);
      expect(digRange(eightHexs), null);
    });
    test('16 hex-digits', () {
      const tenHex = 'FEDCEA9876543210';
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
      expect(() => Hex.len(-1), throwsA(isA<AssertionError>()));
      expect(() => Hex.min(-1), throwsA(isA<AssertionError>()));
      expect(() => Hex.max(0), throwsA(isA<AssertionError>()));
      expect(() => Hex.range(0, 1), throwsA(isA<AssertionError>()));
      expect(() => Hex.range(1, -1), throwsA(isA<AssertionError>()));
      expect(() => Hex.range(2, 2), throwsA(isA<AssertionError>()));
      expect(() => Hex.range(5, 4), throwsA(isA<AssertionError>()));
    });
  });
}
