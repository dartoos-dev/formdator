import 'package:formdator/formdator.dart';
import 'package:test/test.dart';

/// Currently the lowest postal code is 01001-000 and the highest one is
/// 99990-970.
/// [reqCep](https://en.wikipedia.org/wiki/C%C3%B3digo_de_Endere%C3%A7amento_Postal)
void main() {
  group('ReqCep', () {
    const error = 'malformed reqCep value';
    const blank = 'the cep must be informed';
    final reqCep = ReqCep(mal: error, blank: blank);
    test('null', () {
      expect(reqCep(null), blank);
    });
    test('empty', () {
      expect(reqCep(''), blank);
    });
    test('masked well-formed', () {
      const lowestMaskCode = '01001-000';
      const highestMaskCode = '99990-970';
      expect(reqCep('00000-000'), null);
      expect(reqCep(lowestMaskCode), null);
      expect(reqCep('12345-678'), null);
      expect(reqCep(highestMaskCode), null);
      expect(reqCep('99999-999'), null);
    });
    test('unmasked (plain) well-formed', () {
      const lowestCode = '01001000';
      const highestCode = '99990970';
      expect(reqCep('00000000'), null);
      expect(reqCep(lowestCode), null);
      expect(reqCep('12345678'), null);
      expect(reqCep(highestCode), null);
      expect(reqCep('99999999'), null);
    });

    test('malformed', () {
      expect(reqCep('05505+210'), error);
      expect(reqCep('05505/210'), error);
      expect(reqCep('1234A-123'), error);
      expect(reqCep('1234567A'), error);
    });
    test('fewer than 8 digits', () {
      expect(reqCep('1234567'), error);
      expect(reqCep('1234-567'), error);
    });
    test('more than 8 digits', () {
      expect(reqCep('123456789'), error);
      expect(reqCep('123456-789'), error);
    });
  });
}
