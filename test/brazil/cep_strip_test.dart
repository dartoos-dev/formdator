import 'package:flutter_test/flutter_test.dart';
import 'package:formdator/formdator.dart';

void main() {
  group('CepStrip', () {
    test('value property and call operator equivalence', () {
      const cpf = '99999-999';
      const useValue = CepStrip(cpf);
      const useCall = CepStrip(cpf);
      expect(useValue.value, useCall());
      const useValueAndCall = CepStrip(cpf);
      expect(useValueAndCall.value, useValueAndCall());
    });
    test('masked well-formed CEPs', () {
      expect(const CepStrip('11111-111').value, '11111111');
      expect(const CepStrip('22222-222').value, '22222222');
      expect(const CepStrip('33333-333').value, '33333333');
    });
    test('unmasked (plain) well-formed CEPs', () {
      const unmasked = ['55555555', '66666666', '77777777'];
      for (int i = 0; i < unmasked.length; i++) {
        expect(CepStrip(unmasked[i]).value, unmasked[i]);
      }
    });
    test('malformed CPFs', () {
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
    test('empty string', () {
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
}
