import 'package:flutter_test/flutter_test.dart';
import 'package:callor/callor.dart';

void main() {
  group('Cnpj', () {
    const error = 'malformed cnpj';
    const cnpj = Cnpj(mal: error);
    test('null', () {
      expect(cnpj(null), null);
    });
    test('empty', () {
      expect(cnpj(''), error);
    });
    test('masked, well-formed', () {
      expect(cnpj('34.600.728/0001-76'), null);
      expect(cnpj('41.831.918/0001-60'), null);
      expect(cnpj('40.769.911/0001-00'), null);
      expect(cnpj('89.161.992/0001-42'), null);
      expect(cnpj('28.901.976/0001-54'), null);
      expect(cnpj('51.272.701/0001-10'), null);
      expect(cnpj('13.497.166/0001-07'), null);
      expect(cnpj('03.029.749/0001-50'), null);
      expect(cnpj('18.707.049/0001-44'), null);
      expect(cnpj('66.975.296/0001-74'), null);
    });
    test('unmasked (plain), well-formed', () {
      expect(cnpj('34600728000176'), null);
      expect(cnpj('41831918000160'), null);
      expect(cnpj('40769911000100'), null);
      expect(cnpj('89161992000142'), null);
      expect(cnpj('28901976000154'), null);
      expect(cnpj('51272701000110'), null);
      expect(cnpj('13497166000107'), null);
      expect(cnpj('03029749000150'), null);
      expect(cnpj('18707049000144'), null);
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
      expect(cnpj('41831918000161'), error);
      expect(cnpj('40.769.911/0001-02'), error);
      expect(cnpj('89.161.992/0001-43'), error);
      expect(cnpj('28.901.976/0001-55'), error);
      expect(cnpj('51.272.701/0001-11'), error);
      expect(cnpj('13.497.166/0001-08'), error);
      expect(cnpj('03.029.749/0001-51'), error);
      expect(cnpj('18707049000145'), error);
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
