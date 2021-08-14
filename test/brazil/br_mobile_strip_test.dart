import 'package:formdator/formdator.dart';
import 'package:test/test.dart';

void main() {
  group('BrMobileStrip', () {
    group('valid values', () {
      const plain = '11934567890';
      test('plain number', () {
        expect(const BrMobileStrip(plain).value, plain);
      });
      test('masked number', () {
        const masked = '(11) 93456-7890';
        expect(const BrMobileStrip(masked).value, plain);
      });
      test('masked without space', () {
        const maskedNoSpace = '(11)93456-7890';
        expect(const BrMobileStrip(maskedNoSpace).value, plain);
      });
      test('country code prefix', () {
        const withCountryCode = '+5511934567890';
        expect(const BrMobileStrip(withCountryCode).value, withCountryCode);
      });
    });
    group('invalid values', () {
      test('missing one digit', () {
        const missingOneDigit = '9123456789';
        expect(const BrMobileStrip(missingOneDigit).value, null);
      });
      test('missing hyphen', () {
        const missingHyphen = '(11) 998763241';
        expect(const BrMobileStrip(missingHyphen).value, null);
      });
      test('missing left parenthesis', () {
        const noLeft = '11) 998763-2410';
        expect(const BrMobileStrip(noLeft).value, null);
      });
      test('missing right parenthesis', () {
        const noRight = '(11 998763-2410';
        expect(const BrMobileStrip(noRight).value, null);
      });
      test('no parenthesis', () {
        const noParenthesis = '11 998763-2410';
        expect(const BrMobileStrip(noParenthesis).value, null);
      });
      test('no plus sign', () {
        const noPlusSign = '5599812456789';
        expect(const BrMobileStrip(noPlusSign).value, null);
      });
      test('illegal prefix', () {
        const illegalPrefix = '-5512934567890';
        expect(const BrMobileStrip(illegalPrefix).value, null);
      });
    });
  });
}
