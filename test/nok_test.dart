import 'package:flutter_test/flutter_test.dart';
import 'package:callor/callor.dart';

void main() {
  group('Nok validator', () {
    const nok = Nok();
    const nonEmpty = 'test-string';
    test('any non null input', () {
      expect(nok(nonEmpty), nonEmpty);
    });
    test('custom msg', () {
      const msg = 'any message';
      const nokWithCustomMsg = Nok(msg: msg);
      expect(nokWithCustomMsg(null), msg);
    });
    test('null input', () {
      expect(nok(null), '');
    });
  });
}
