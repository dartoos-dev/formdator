import 'package:formdator/formdator.dart';
import 'package:test/test.dart';

void main() {
  group('ReqCpf', () {
    const blank = 'a CPF value is required';
    const error = 'malformed cpf';
    final cpf = ReqCpf(blank: blank, mal: error);
    test('null', () {
      expect(cpf(null), blank);
    });
    test('empty', () {
      expect(cpf(''), blank);
    });
    test('masked well-formed', () {
      expect(cpf('273.023.920-05'), null);
      expect(cpf('222.034.680-33'), null);
    });
    test('unmasked (plain) well-formed', () {
      expect(cpf('27302392005'), null);
      expect(cpf('22203468033'), null);
    });

    test('malformed - black list', () {
      expect(cpf('00000000000'), error);
      expect(cpf('11111111111'), error);
      expect(cpf('22222222222'), error);
      expect(cpf('33333333333'), error);
      expect(cpf('44444444444'), error);
      expect(cpf('55555555555'), error);
      expect(cpf('66666666666'), error);
      expect(cpf('77777777777'), error);
      expect(cpf('88888888888'), error);
      expect(cpf('99999999999'), error);
    });
    test('malformed', () {
      expect(cpf('27302392006'), error);
      expect(cpf('868.519.040-96'), error);
      expect(cpf('22213468033'), error);
    });
    test('less than 11 digits', () {
      expect(cpf('272.746.370-7'), error);
      expect(cpf('8675190409'), error);
    });
    test('more than 11 digits', () {
      expect(cpf('186751904096'), error);
      expect(cpf('840.494.790-280'), error);
    });
  });
}
