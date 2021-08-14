import 'package:formdator/formdator.dart';
import 'package:test/test.dart';

void main() {
  group('CpfStrip', () {
    group('valid CPFs', () {
      const masked = ['555.555.555-55', '666.666.666-66', '777.777.777-77'];
      const unmasked = ['55555555555', '66666666666', '77777777777'];
      test('masked', () {
        for (int i = 0; i < masked.length; i++) {
          expect(CpfStrip(masked[i]).value, unmasked[i]);
        }
      });
      test('unmasked (plain)', () {
        for (int i = 0; i < unmasked.length; i++) {
          expect(CpfStrip(unmasked[i]).value, unmasked[i]);
        }
      });
    });
    group('invalid CPFs', () {
      test('malformed CPFs', () {
        const mals = ['A11.111.111-11', '222.222-222.22', '33.333.333/33'];
        for (int i = 0; i < mals.length; i++) {
          expect(CpfStrip(mals[i]).value, null);
        }
      });
      test('empty string', () {
        expect(const CpfStrip('').value, null);
      });
    });
    test('masked less than 14 characteres', () {
      expect(const CpfStrip('123.456.789-1').value, null);
    });
    test('masked more than 14 characteres', () {
      expect(const CpfStrip('123.456.789-123').value, null);
    });
    test('unmasked less than 11 characteres', () {
      expect(const CpfStrip('1234567890').value, null);
    });
    test('unmasked more than 11 characteres', () {
      expect(const CpfStrip('123456789123').value, null);
    });
  });
}
