import 'package:formdator/formdator.dart';
import 'package:test/test.dart';

void main() {
  group('ReqIPv4', () {
    const blank = 'required IP address';
    const mal = 'malformed IP address';
    final reqIPv4 = ReqIPv4(blank: blank, mal: mal);
    test('null - blank', () {
      expect(reqIPv4(null), blank);
    });
    test('empty - blank', () {
      expect(reqIPv4(''), blank);
    });
    test('invalid IPv4', () {
      const invalid = '10.10.10.256';
      expect(reqIPv4(invalid), mal);
    });
    test('valid IPv4', () {
      expect(reqIPv4('10.0.1.1'), null);
    });
  });
}
