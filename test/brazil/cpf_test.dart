import 'package:formdator/formdator.dart';
import 'package:test/test.dart';

void main() {
  group('Cpf', () {
    const error = 'malformed cpf';
    const cpf = Cpf(mal: error);
    test('null', () {
      expect(cpf(null), null);
    });
    test('empty', () {
      expect(cpf(''), error);
    });
    test('masked well-formed', () {
      expect(cpf('273.023.920-05'), null);
      expect(cpf('693.421.280-09'), null);
      expect(cpf('055.870.340-20'), null);
      expect(cpf('493.803.840-41'), null);
      expect(cpf('943.766.670-99'), null);
      expect(cpf('272.746.370-70'), null);
      expect(cpf('867.519.040-96'), null);
      expect(cpf('840.494.790-28'), null);
      expect(cpf('043.090.020-13'), null);
      expect(cpf('222.034.680-33'), null);
    });
    test('unmasked (plain) well-formed', () {
      expect(cpf('27302392005'), null);
      expect(cpf('69342128009'), null);
      expect(cpf('05587034020'), null);
      expect(cpf('49380384041'), null);
      expect(cpf('94376667099'), null);
      expect(cpf('27274637070'), null);
      expect(cpf('86751904096'), null);
      expect(cpf('84049479028'), null);
      expect(cpf('04309002013'), null);
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
      expect(cpf('79342128009'), error);
      expect(cpf('055.870.340-21'), error);
      expect(cpf('493.803.841-41'), error);
      expect(cpf('943.767.670-99'), error);
      expect(cpf('273.746.370-70'), error);
      expect(cpf('868.519.040-96'), error);
      expect(cpf('940.494.790-28'), error);
      expect(cpf('14309002013'), error);
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
