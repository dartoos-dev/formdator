import 'package:flutter_test/flutter_test.dart';
import 'package:formdator/formdator.dart';

void main() {
  const error = 'Value must contain only digits';
  group('ToValStr adapter', () {
    test('— single validator test case', () {
      final single = ToValObj(Digit(non: error));
      expect(single(null), null);
      expect(single(1111), null);
      expect(single([1111]), error);
      expect(single(false), error);
    });
    test('— many validators test case', () {
      const blank = 'required value';
      final many = ToValObj.many([Req(blank: blank), Digit(non: error)]);
      expect(many(null), blank);
      expect(many(1111), null);
      expect(many([1111]), error);
      expect(many(false), error);
    });
  });
}
