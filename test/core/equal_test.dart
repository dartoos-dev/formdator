import 'package:flutter_test/flutter_test.dart';
import 'package:formdator/formdator.dart';

void main() {
  const error = 'different value';
  const value = 'an input value';
  final equal = Equal(() => value, diff: error);
  group('Equal validator', () {
    test('equivalent values', () {
      expect(equal(value), null);
      expect(equal.to(value), null);
    });
    test('different values', () {
      expect(equal(error), error);
      expect(equal.to(error), error);
    });
    test('null', () {
      final nullEqual = Equal(() => null, diff: error);
      expect(nullEqual(null), null);
      expect(nullEqual.to(null), null);
    });
  });
}
