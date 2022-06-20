import 'package:formdator/src/net/req_url.dart';
import 'package:test/test.dart';

void main() {
  group('ReqUrl', () {
    const blank = 'required URL value';
    const mal = 'malformed URL value';
    final reqUrl = ReqUrl(blank: blank, mal: mal);
    test('null - blank', () {
      expect(reqUrl(null), blank);
    });
    test('empty - blank', () {
      expect(reqUrl(''), blank);
    });
    test('valid URL', () {
      expect(reqUrl('http://10.0.1.1'), null);
    });
    test('invalid URL', () {
      expect(reqUrl('http://10.10.10.256'), mal);
    });
  });
}
