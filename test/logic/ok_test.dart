import 'package:flutter_test/flutter_test.dart';
import 'package:callor/callor.dart';

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
