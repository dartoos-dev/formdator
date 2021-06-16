import 'package:flutter_test/flutter_test.dart';
import 'package:formdator/formdator.dart';

void main() {
  group('ValueBack validator', () {
    test('give back', () {
      const vb = ValueBack();
      const empty = '';
      expect(vb(empty), empty);
      const input = 'some-text';
      expect(vb(input), input);
      const blank = null;
      expect(vb(blank), blank);
    });
  });
}
