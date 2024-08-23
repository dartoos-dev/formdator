import 'package:formdator/formdator.dart';
import 'package:test/test.dart';

void main() {
  const trimmed = 'trimmed text';
  const untrimmed = '  \t$trimmed  \n';
  // ignore: prefer_const_constructors
  final trim = Trim(const ValueBack().call);
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
