import 'package:flutter_test/flutter_test.dart';
import 'package:formdator/formdator.dart';

void main() {
  const error = 'Value must contain only digits';
  group('ToValStr adapter', () {
    test('— type checking conversion', () {
      final typeCheking = ToValObj(Digit(non: error));
      expect(typeCheking(null), null);
      expect(typeCheking('1111'), null);
      expect(() => typeCheking(1111), throwsArgumentError);
      expect(() => typeCheking([1111]), throwsArgumentError);
      expect(() => typeCheking(false), throwsArgumentError);
    });
    test('— conversion with no type checking', () {
      final noTypeChecking = ToValObj.toStr(Digit(non: error));
      expect(noTypeChecking(null), null);
      expect(noTypeChecking('1111'), null);
      expect(noTypeChecking(1111), null);
      expect(noTypeChecking([1111]), error);
      expect(noTypeChecking(false), error);
    });
    test('— many validators test case', () {
      const blank = 'required value';
      final many = ToValObj.many([Req(blank: blank), Digit(non: error)]);
      expect(many(null), blank);
      expect(many('1111'), null);
      expect(() => many(1111), throwsArgumentError);
      expect(() => many([1111]), throwsArgumentError);
      expect(() => many(false), throwsArgumentError);
    });
  });
}
