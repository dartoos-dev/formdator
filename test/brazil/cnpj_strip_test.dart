import 'package:formdator/formdator.dart';
import 'package:test/test.dart';

void main() {
  group('CnpjStrip', () {
    test('value property and call operator equivalence', () {
      const cnpj = '66.975.296/0001-74';
      const useValue = CnpjStrip(cnpj);
      const useCall = CnpjStrip(cnpj);
      expect(useValue.value, useCall());
    });
    test('masked well-formed CNPJs', () {
      expect(const CnpjStrip('34.600.728/0001-76').value, '34600728000176');
      expect(const CnpjStrip('41.831.918/0001-60').value, '41831918000160');
      expect(const CnpjStrip('89.161.992/0001-42').value, '89161992000142');
    });
    test('unmasked (plain) well-formed CNPJs', () {
      const unmasked = ['34600728000176', '41831918000160', '89161992000142'];
      for (int i = 0; i < unmasked.length; i++) {
        expect(CnpjStrip(unmasked[i]).value, unmasked[i]);
      }
    });
    test('malformed CNPJs', () {
      const malformed = [
        '34.600/728000.177',
        '41.831.918000161',
        '89.161.992/001-43'
      ];
      for (int i = 0; i < malformed.length; i++) {
        expect(CnpjStrip(malformed[i]).value, null);
      }
    });
    test('empty string', () {
      expect(const CnpjStrip('').value, null);
    });
    test('unmasked less than 14 characteres', () {
      expect(const CnpjStrip('3460072800017').value, null);
    });
    test('unmasked more than 14 characteres', () {
      expect(const CnpjStrip('034600728000176').value, null);
    });
    test('masked less than 18 characteres', () {
      expect(const CnpjStrip('34.600.728/0001-7').value, null);
    });
    test('masked more than 18 characteres', () {
      expect(const CnpjStrip('034.600.728/0001-76').value, null);
    });
  });
}
