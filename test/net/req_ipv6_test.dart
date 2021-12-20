import 'package:formdator/formdator.dart';
import 'package:test/test.dart';

void main() {
  group('ReqIPv6', () {
    const blank = 'required IP address';
    const mal = 'malformed IP address';
    final reqIPv6 = ReqIPv6(blank: blank, mal: mal);
    test('null - blank', () {
      expect(reqIPv6(null), blank);
    });
    test('empty - blank', () {
      expect(reqIPv6(''), blank);
    });
    test('invalid IPv6', () {
      const invalid = '2x01:0db8:0000:0000:0000:ff00:0042:8329';
      expect(reqIPv6(invalid), mal);
    });
    test('valid IPv6', () {
      expect(reqIPv6('2001:0db8:0000:0000:0000:ff00:0042:8329'), null);
    });
  });
}
