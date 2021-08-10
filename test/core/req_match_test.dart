import 'package:formdator/formdator.dart';
import 'package:test/test.dart';

void main() {
  group('ReqMatch validator', () {
    const blank = 'requred field';
    const mismatch = 'mismatch value';

    /// three digits followed by a hyphen and three alphabet characters.
    const pattern = r'^\d{3}-[A-Za-z]{3}$';
    final match = ReqMatch(pattern, blank: blank, mis: mismatch);
    final matchRegExp =
        ReqMatch.regExp(RegExp(pattern), blank: blank, mis: mismatch);

    test('- null value', () {
      expect(match(null), blank);
      expect(matchRegExp(null), blank);
    });
    test('- empty value', () {
      expect(match(''), blank);
      expect(matchRegExp(''), blank);
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
