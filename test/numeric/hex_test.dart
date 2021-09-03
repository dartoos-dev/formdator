import 'package:formdator/formdator.dart';
import 'package:test/test.dart';

void main() {
  group('Hex —', () {
    const error = 'the data must only contain hexadecimal digits';
    const diff = 'length error';
    const short = 'the length is too short';
    const long = 'the length is too long';
    const len = 2;
    const min = 3;
    const max = 8;
    final dig = Hex(mal: error);
    final digLen = Hex.len(len, mal: error, diff: diff);
    final digMin = Hex.min(min, mal: error, short: short);
    final digMax = Hex.max(max, mal: error, long: long);
    final digRange = Hex.range(min, max, mal: error, short: short, long: long);
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
      expect(digMin(twoHex), short);
      expect(digMax(twoHex), null);
      expect(digRange(twoHex), short);
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
      expect(digMax(tenHex), long);
      expect(digRange(tenHex), long);
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
