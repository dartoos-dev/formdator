import 'package:flutter_test/flutter_test.dart';
import 'package:callor/callor.dart';

void main() {
  const error = 'Value must contain only digits';
  const digits = Digit(nonDigit: error);
  group('Valid inputs - ', () {
    test('single digit', () {
      expect(digits('1'), null);
    });
    test('many digits', () {
      expect(digits('012345678'), null);
    });
    test('null', () {
      expect(digits(null), null);
    });
  });
  group('Invalid inputs', () {
    test('empty value', () {
      expect(digits(''), error);
    });
    test('non-digits value', () {
      expect(digits('11A'), error);
    });
    test('floating-point', () {
      expect(digits('1.1111'), error);
    });
  });
}
