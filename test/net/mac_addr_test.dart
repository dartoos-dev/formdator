import 'package:formdator/formdator.dart';
import 'package:test/test.dart';

void main() {
  group('MAC Address', () {
    const error = 'malformed MAC Address';
    final macAddr = MacAddr(mal: error);
    test('valid values:', () {
      expect(macAddr(null), null);
      expect(macAddr('00:00:00:00:00:00'), null);
      expect(macAddr('00-00-00-00-00-00'), null);
      expect(macAddr('3D:F2:C9:A6:B3:4F'), null);
      expect(macAddr('A1-B2-C3-D4-E5-F6'), null);
      expect(macAddr('a1-b2-c3-d4-e5-f6'), null);
      expect(macAddr('aA-bB-cC-dD-eE-fF'), null);
      expect(macAddr('Aa:Bb:Cc:Dd:Ee:Ff'), null);
    });
    test('invalid values', () {
      expect(macAddr(''), error);
      expect(macAddr('1'), error);
      expect(macAddr('00-00-00-00-00'), error);
      expect(macAddr('00.00.00.00'), error);
      expect(macAddr('00:00-00:00:00-00'), error);
      expect(macAddr('3D:F2:C9-A6:B3:4F'), error);
    });
  });
}
