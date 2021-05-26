import 'package:flutter_test/flutter_test.dart';
import 'package:callor/callor.dart';

void main() {
  group('Ok Dt validator', () {
    test('always null', () {
      final ok = const OkDt();
      expect(ok(DateTime.now()), null);
    });
  });
}
