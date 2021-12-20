import 'package:formdator/net.dart';
import 'package:test/test.dart';

void main() {
  group('IPv6', () {
    const error = 'malformed IP';
    final ipv6 = IPv6(mal: error);
    group('valid IPv6 values', () {
      test('null input', () {
        expect(ipv6(null), null);
      });
      test('full representation (8 groups of 4 hex digits):', () {
        expect(ipv6('0000:0000:0000:0000:0000:0000:0000:0000'), null);
        expect(ipv6('0000:0000:0000:0000:0000:0000:0000:0001'), null);
        expect(ipv6('2001:0db8:0000:0000:0000:ff00:0042:8329'), null);
        expect(ipv6('0123:4567:89ab:cdef:0123:4567:89AB:CDEF'), null);
        expect(ipv6('aAaA:bBbB:cCcC:dDdD:AaAa:BbBb:CcCc:DdDd'), null);
        expect(ipv6('ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff'), null);
      });
      test('shortened', () {
        expect(ipv6('::1'), null);
        expect(ipv6('2001:db8:0:0:0:ff00:42:8329'), null);
        expect(ipv6('2001:0db8::ff00:42:8329'), null);
        expect(ipv6('fff:ffff:ffff:ffff:ffff:ffff:ffff:ffff'), null);
      });
    });
    group('invalid IPv6 values', () {
      test('empty', () {
        expect(ipv6(''), error);
      });
      test('IPv4 values', () {
        expect(ipv6('0.0.0.0'), error);
        expect(ipv6('1.1.1.10'), error);
        expect(ipv6('10.0.0.1'), error);
        expect(ipv6('127.0.0.1'), error);
        expect(ipv6('189.47.19.149'), error);
        expect(ipv6('192.168.1.1'), error);
        expect(ipv6('255.255.255.255'), error);
      });
      test('invalid length', () {
        expect(ipv6('0000:0000:0000:0000:0000:0000:0000:0000:0000'), error);
        expect(ipv6('1:0000:0000:0000:0000:0000:0000:0000:0001'), error);
        expect(ipv6('2001:0db8:0000:0000:0000:ff00:0042:98321'), error);
        expect(ipv6('fffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff'), error);
      });
      test('invalid characters', () {
        expect(ipv6('test:test:test:test:test:test:test:test'), error);
        expect(ipv6('2001.db8:0:0:0:ff00:42:8329'), error);
        expect(ipv6('0000:0000:0000:0000:0000:0000:0000:0000:'), error);
        expect(ipv6('0123:4567:89ab:cdef:0123:4567:89XB:CDEF'), error);
      });
    });
  });
}
