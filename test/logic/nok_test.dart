import 'package:flutter_test/flutter_test.dart';
import 'package:formdator/formdator.dart';

void main() {
  group('Nok validator', () {
    const msg = 'Not Test';
    const nok = Nok(error: msg);
    test('non-blank input', () {
      expect(nok('non-blank'), msg);
    });
    test('blank input', () {
      expect(nok(null), msg);
      expect(nok(''), msg);
    });
  });
}
