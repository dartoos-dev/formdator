import 'package:flutter_test/flutter_test.dart';
import 'package:callor/callor.dart';
import 'value_back.dart';

void main() {
  const trimmed = 'trimmed text';
  const untrimmed = '  \t$trimmed  \n';
  final trim = Trim(const ValueBack());
  group('Trim validator', () {
    test('blank input', () {
      expect(trim(null), null);
      expect(trim(''), '');
    });
    test('untrimmed input', () {
      expect(trim(untrimmed), trimmed);
    });
    test('already trimmed input', () {
      expect(trim(trimmed), trimmed);
    });
  });
}
