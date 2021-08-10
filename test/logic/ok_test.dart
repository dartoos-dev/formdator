import 'package:formdator/formdator.dart';
import 'package:test/test.dart';

void main() {
  group('Ok validator', () {
    const ok = Ok();
    test('any non-null input', () {
      expect(ok('test-string'), null);
    });
    test('null input', () {
      expect(ok(null), null);
    });
  });
}
