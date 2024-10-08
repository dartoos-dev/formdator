import 'package:formdator/formdator.dart';
import 'package:test/test.dart';

void main() {
  const error = 'Value must contain only digits';
  group('ToValStr adapter', () {
    test('— type checking conversion', () {
      final typeCheking = ToValObj(Digit(mal: error).call);
      expect(typeCheking(null), null);
      expect(typeCheking('1111'), null);
      expect(() => typeCheking(1111), throwsArgumentError);
      expect(() => typeCheking([1111]), throwsArgumentError);
      expect(() => typeCheking(false), throwsArgumentError);
    });
    test('— conversion with no type checking', () {
      final noTypeChecking = ToValObj.toStr(Digit(mal: error).call);
      expect(noTypeChecking(null), null);
      expect(noTypeChecking('1111'), null);
      expect(noTypeChecking(1111), null);
      expect(noTypeChecking([1111]), error);
      expect(noTypeChecking(false), error);
    });
    test('— many validators test case', () {
      const blank = 'required value';
      final many =
          ToValObj.many([const Req(blank: blank).call, Digit(mal: error).call]);
      expect(many(null), blank);
      expect(many('1111'), null);
      expect(() => many(1111), throwsArgumentError);
      expect(() => many([1111]), throwsArgumentError);
      expect(() => many(false), throwsArgumentError);
    });
  });
}
