import 'package:flutter_test/flutter_test.dart';
import 'package:callor/callor.dart';

void main() {
  group('Ok Dt validator', () {
    test('always null', () {
      const ok = OkDt();
      expect(ok(DateTime.now()), null);
    });
  });
}
