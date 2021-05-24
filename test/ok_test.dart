import 'package:flutter_test/flutter_test.dart';
import 'package:callor/callor.dart';

void main() {
  group('Ok validator', () {
    test('always null', () {
      final ok = const Ok();
      expect(ok('test-string'), null);
    });
  });
}
