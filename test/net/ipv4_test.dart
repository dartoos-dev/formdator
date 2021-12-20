import 'package:formdator/formdator.dart';
import 'package:test/test.dart';

void main() {
  group('IPv4', () {
    const error = 'malformed IP';
    final ipv4 = IPv4(mal: error);
    test('valid values:', () {
      expect(ipv4(null), null);
      expect(ipv4('0.0.0.0'), null);
      expect(ipv4('1.1.1.10'), null);
      expect(ipv4('10.0.0.1'), null);
      expect(ipv4('10.10.10.10'), null);
      expect(ipv4('127.0.0.1'), null);
      expect(ipv4('192.0.2.235'), null);
      expect(ipv4('192.168.18.1'), null);
      expect(ipv4('172.16.254.1'), null);
      expect(ipv4('189.47.19.149'), null);
      expect(ipv4('255.255.255.255'), null);
    });
    test('invalid values', () {
      expect(ipv4(''), error);
      expect(ipv4('1'), error);
      expect(ipv4('10.10'), error);
      expect(ipv4('10.10.10.'), error);
      expect(ipv4('00.0.0.0'), error);
      expect(ipv4('0.00.0.0'), error);
      expect(ipv4('0.0.00.0'), error);
      expect(ipv4('0.0.0.00'), error);
      expect(ipv4('0.0.0.0.'), error);
      expect(ipv4('010.0.0.1'), error);
      expect(ipv4('127.00.0.1'), error);
      expect(ipv4('000.021.01.0'), error);
      expect(ipv4('255.255.255.256'), error);
      expect(ipv4('256.255.255.255'), error);
      expect(ipv4('033.033.33.033'), error);
      expect(ipv4('192.168.000.1'), error);
      expect(ipv4('999.999.999.999'), error);
    });
  });
}
