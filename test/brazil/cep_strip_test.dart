import 'package:formdator/formdator.dart';
import 'package:test/test.dart';

void main() {
  group('CepStrip', () {
    group('valid CEPs', () {
      const masked = ['01234-567', '55555-555', '66666-666', '98765-432'];
      const unmasked = ['01234567', '55555555', '66666666', '98765432'];
      test('masked', () {
        for (int i = 0; i < masked.length; i++) {
          expect(CepStrip(masked[i]).value, unmasked[i]);
        }
      });
      test('unmasked (plain)', () {
        for (int i = 0; i < unmasked.length; i++) {
          expect(CepStrip(unmasked[i]).value, unmasked[i]);
        }
      });
    });
    group('invalid CEPs', () {
      test('malformed', () {
        const mals = [
          'A1111-111',
          '222.22-222',
          '33333/333',
          '44444-44',
          '12345-67A'
        ];
        for (int i = 0; i < mals.length; i++) {
          expect(CepStrip(mals[i]).value, null);
        }
      });
      test('empty', () {
        expect(const CepStrip('').value, null);
      });
      test('masked less than 9 characteres', () {
        expect(const CepStrip('1234-567').value, null);
      });
      test('masked more than 9 characteres', () {
        expect(const CepStrip('123456-789').value, null);
      });
      test('unmasked less than 8 characteres', () {
        expect(const CepStrip('1234567').value, null);
      });
      test('unmasked more than 8 characteres', () {
        expect(const CepStrip('123456789').value, null);
      });
    });
  });
}
