import 'package:formdator/formdator.dart';
import 'package:test/test.dart';

/// Currently the lowest postal code is 01001-000 and the highest one is
/// 99990-970.
/// [cep](https://en.wikipedia.org/wiki/C%C3%B3digo_de_Endere%C3%A7amento_Postal)
void main() {
  group('Cep', () {
    const error = 'malformed cep value';
    const cep = Cep(mal: error);
    test('null', () {
      expect(cep(null), null);
    });
    test('empty', () {
      expect(cep(''), error);
    });
    test('masked well-formed', () {
      const lowestMaskCode = '01001-000';
      const highestMaskCode = '99990-970';
      expect(cep('00000-000'), null);
      expect(cep(lowestMaskCode), null);
      expect(cep('12345-678'), null);
      expect(cep(highestMaskCode), null);
      expect(cep('99999-999'), null);
    });
    test('unmasked (plain) well-formed', () {
      const lowestCode = '01001000';
      const highestCode = '99990970';
      expect(cep('00000000'), null);
      expect(cep(lowestCode), null);
      expect(cep('12345678'), null);
      expect(cep(highestCode), null);
      expect(cep('99999999'), null);
    });

    test('malformed', () {
      expect(cep('05505+210'), error);
      expect(cep('05505/210'), error);
      expect(cep('1234A-123'), error);
      expect(cep('1234567A'), error);
    });
    test('fewer than 8 digits', () {
      expect(cep('1234567'), error);
      expect(cep('1234-567'), error);
    });
    test('more than 8 digits', () {
      expect(cep('123456789'), error);
      expect(cep('123456-789'), error);
    });
  });
}
