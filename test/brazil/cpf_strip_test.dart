import 'package:flutter_test/flutter_test.dart';
import 'package:callor/callor.dart';

void main() {
  group('CpfStrip', () {
    test('value property and call operator equivalence', () {
      const cpf = '999.999.999-99';
      const useValue = CpfStrip(cpf);
      const useCall = CpfStrip(cpf);
      expect(useValue.value, useCall());
      const useValueAndCall = CpfStrip(cpf);
      expect(useValueAndCall.value, useValueAndCall());
    });
    test('masked well-formed CPFs', () {
      expect(const CpfStrip('111.111.111-11').value, '11111111111');
      expect(const CpfStrip('222.222.222-22').value, '22222222222');
      expect(const CpfStrip('333.333.333-33').value, '33333333333');
    });
    test('unmasked (plain) well-formed CPFs', () {
      const unmasked = ['55555555555', '66666666666', '77777777777'];
      for (int i = 0; i < unmasked.length; i++) {
        expect(CpfStrip(unmasked[i]).value, unmasked[i]);
      }
    });
    test('malformed CPFs', () {
      const malformeds = ['A11.111.111-11', '222.222-222.22', '33.333.333/33'];
      for (int i = 0; i < malformeds.length; i++) {
        expect(CpfStrip(malformeds[i]).value, null);
      }
    });
    test('empty string', () {
      expect(const CpfStrip('').value, null);
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
