import 'package:formdator/formdator.dart';
import 'package:test/test.dart';

void main() {
  group('ReqMacAddr', () {
    const blank = 'required MAC Address';
    const mal = 'malformed MAC Address';
    final reqMacAddr = ReqMacAddr(blank: blank, mal: mal);
    test('null - blank', () {
      expect(reqMacAddr(null), blank);
    });
    test('empty - blank', () {
      expect(reqMacAddr(''), blank);
    });
    test('invalid MacAddr', () {
      const invalid = '00:11:22:33:44:55:66';
      expect(reqMacAddr(invalid), mal);
    });
    test('valid MacAddr', () {
      expect(reqMacAddr('00:11:22:33:44:55'), null);
    });
  });
}
