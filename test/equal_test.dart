import 'package:flutter_test/flutter_test.dart';
import 'package:callor/callor.dart';

void main() {
  const error = 'different value';
  const value = 'an input value';
  const equal = Equal(value, diff: error);
  group('Equal validator', () {
    test('equivalent values', () {
      expect(equal(value), null);
      expect(equal.to(value), null);
    });
    test('different values', () {
      expect(equal(error), error);
      expect(equal.to(error), error);
    });
  });
}
