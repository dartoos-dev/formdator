import 'package:flutter_test/flutter_test.dart';
import 'package:formdator/formdator.dart';

void main() {
  group('Counter validator', () {
    test('no validation', () {
      final counter = Counter();
      expect(counter.value, 0);
    });
    test('some validations', () {
      final counter = Counter();
      expect(counter(null), null);
      expect(counter(''), null);
      expect(counter(1), null);
      expect(counter.value, 3);
    });
    test('custom extra validation step', () {
      const invalid = 'invalid';
      final counter = Counter(val: const Nok(error: invalid));
      expect(counter('anything'), invalid);
      expect(counter.value, 1);
    });
  });
}
