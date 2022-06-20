import 'package:formdator/src/net/url.dart';
import 'package:test/test.dart';

void main() {
  group('URL', () {
    const error = 'malformed URL value';
    const url = Url(mal: error);
    test('Valid Urls:', () {
      expect(url(null), null);
      expect(url('//shortsyntax.com'), null);
      expect(url('//www.shortsyntax.com'), null);
      expect(url('http://www.example.com'), null);
      expect(url('http://www.example.com.'), null);
      expect(url('http://www.example.com/index.html'), null);
      expect(url('http://example.com?foo=bar'), null);
      expect(url('https://www.example.com/foo/?bar=baz&inga=42&quux'), null);
      expect(url('http://odf.ws/123'), null);
      expect(url('http://userid:password@example.com:8080'), null);
      expect(url('http://userid:password@example.com:8080/'), null);
      expect(url('https://www.youtube.com/watch?v=nmhX3_m84Is'), null);
      expect(url('http://foo.com/blah_blah#cite-1'), null);
      expect(url('http://userid@example.com:8080/'), null);
      expect(url('http://foo.com/blah_(wikipedia)#cite-1'), null);
      expect(url('http://foo.com/blah_(wikipedia)_blah#cite-1'), null);
      expect(url('http://code.google.com/events/#&product=browser'), null);
      expect(url('http://foo.bar/?q=Test%20URL-encoded%20stuff'), null);
      expect(url("http://-.~_!&'()*+,;=:%40:80%2f::::::@example.com"), null);
      expect(url('https://foo_bar.example.com/'), null);
      expect(url('http://1337.net'), null);
      expect(url('http://192.168.0.3'), null);
      expect(url('http://192.168.0.3/resource'), null);
      expect(url('http://223.255.255.254'), null);
    });
    test('Valid FTP Urls:', () {
      expect(url('ftp://example.com'), null);
      expect(url('ftp://example.com:8080'), null);
      expect(url('ftp://example.com:8080/'), null);
      expect(url('ftp://example.com:8080/url-path'), null);
      expect(url('ftp://userid:password@example.com:8080/url-path'), null);
    });
    test('invalid URLs', () {
      expect(url(''), error);
      expect(url('//'), error);
      expect(url('://'), error);
      expect(url('//a'), error);
      expect(url('http://'), error);
      expect(url('http:///a'), error);
      expect(url('foo.com'), error);
      expect(url('rdar://1234'), error);
      expect(url('http://.'), error);
      expect(url('http://..'), error);
      expect(url('http://?'), error);
      expect(url('http://??'), error);
      expect(url('http://#'), error);
      expect(url('http://##'), error);
      expect(url('1'), error);
      expect(url('10.10'), error);
      expect(url('0.0.0.0'), error);
      expect(url('http://10.1.1.255'), error);
      expect(url('http://224.1.1.1'), error);
      expect(url('http://3628126748'), error);
      // the first IP andress (network) of each class is considered invalid.
      expect(url('http://192.168.0.0'), error);
      expect(url('http://192.168.0.0/resource'), error);
      // the last IP andress (broadcast) of each class is considered invalid.
      expect(url('http://192.168.0.255/'), error);
      expect(url('http://192.168.0.255/resource'), error);

      expect(url('http://?df.ws/123'), error);
      expect(url('http:// shouldfail.com'), error);
      expect(url('http://.www.foo.bar/'), error);
      expect(url('http://foo.bar?q=Spaces should be encoded'), error);
    });
  });
}
