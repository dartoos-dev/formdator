import 'package:flutter_test/flutter_test.dart';
import 'package:formdator/formdator.dart';

void main() {
  group('Match validator', () {
    const mismatch = 'mismatch value';

    /// three digits followed by a hyphen and three alphabet characters.
    const pattern = r'^\d{3}-[A-Za-z]{3}$';
    final match = Match(pattern, mis: mismatch);
    final matchRegExp = Match.regExp(RegExp(pattern), mis: mismatch);

    test('- null value', () {
      expect(match(null), null);
      expect(matchRegExp(null), null);
    });
    test('- empty value', () {
      expect(match(''), mismatch);
      expect(matchRegExp(''), mismatch);
    });
    test('- valid values:', () {
      const values = ['123-abc', '890-XYZ', '000-aAa', '999-ZzZ'];
      for (final value in values) {
        expect(match(value), null);
        expect(matchRegExp(value), null);
      }
    });
    test('- invalid values:', () {
      const values = ['123-abcd', '7890-XYZ', '123-ab+', 'a23-abc'];
      for (final value in values) {
        expect(match(value), mismatch);
        expect(matchRegExp(value), mismatch);
      }
    });
  });
}
