import 'package:formdator/formdator.dart';
import 'package:test/test.dart';

void main() {
  group('ReqCnpj', () {
    const blank = 'a CNPJ value is required';
    const error = 'malformed cnpj';
    final cnpj = ReqCnpj(blank: blank, mal: error);
    test('null', () {
      expect(cnpj(null), blank);
    });
    test('empty', () {
      expect(cnpj(''), blank);
    });
    test('masked, well-formed', () {
      expect(cnpj('34.600.728/0001-76'), null);
      expect(cnpj('66.975.296/0001-74'), null);
    });
    test('unmasked (plain), well-formed', () {
      expect(cnpj('34600728000176'), null);
      expect(cnpj('66975296000174'), null);
    });
    test('malformed - black list', () {
      expect(cnpj('00000000000000'), error);
      expect(cnpj('11111111111111'), error);
      expect(cnpj('22222222222222'), error);
      expect(cnpj('33333333333333'), error);
      expect(cnpj('44444444444444'), error);
      expect(cnpj('55555555555555'), error);
      expect(cnpj('66666666666666'), error);
      expect(cnpj('77777777777777'), error);
      expect(cnpj('88888888888888'), error);
      expect(cnpj('99999999999999'), error);
    });
    test('malformed', () {
      expect(cnpj('34600728000177'), error);
      expect(cnpj('40.769.911/0001-02'), error);
      expect(cnpj('66975296000175'), error);
    });
    test('less than 14 digits', () {
      expect(cnpj('4183191800016'), error);
      expect(cnpj('40.76.91/0001-02'), error);
    });
    test('more than 14 digits', () {
      expect(cnpj('041831918000161'), error);
      expect(cnpj('140.769.911/0001-02'), error);
    });
  });
}
