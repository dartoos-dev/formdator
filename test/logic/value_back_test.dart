import 'package:formdator/formdator.dart';
import 'package:test/test.dart';

void main() {
  group('ValueBack validator', () {
    test('give back', () {
      const vb = ValueBack();
      const empty = '';
      expect(vb(empty), empty);
      const input = 'some-text';
      expect(vb(input), input);
      expect(vb(null), null);
    });
  });
}
