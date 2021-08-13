import 'package:formdator/formdator.dart';
import 'package:test/test.dart';

void main() {
  group('BrPhoneStrip', () {
    group('valid values', () {
      const plain = '1234567890';
      test('plain number', () {
        expect(const BrPhoneStrip(plain).value, plain);
      });
      test('masked number', () {
        const masked = '(12) 3456-7890';
        expect(const BrPhoneStrip(masked).value, plain);
      });
      test('masked without space', () {
        const maskedNoSpace = '(12)3456-7890';
        expect(const BrPhoneStrip(maskedNoSpace).value, plain);
      });
      test('country code prefix', () {
        const withCountryCode = '+551234567890';
        expect(const BrPhoneStrip(withCountryCode).value, withCountryCode);
      });
    });
    group('invalid values', () {
      test('missing one digit', () {
        const missingOneDigit = '123456789';
        expect(const BrPhoneStrip(missingOneDigit).value, null);
      });
      test('missing hyphen', () {
        const missingHyphen = '(11) 98763241';
        expect(const BrPhoneStrip(missingHyphen).value, null);
      });
      test('missing left parenthesis', () {
        const noLeft = '11) 98763-2410';
        expect(const BrPhoneStrip(noLeft).value, null);
      });
      test('missing right parenthesis', () {
        const noRight = '(11 98763-2410';
        expect(const BrPhoneStrip(noRight).value, null);
      });
      test('no parenthesis', () {
        const noParenthesis = '11 98763-2410';
        expect(const BrPhoneStrip(noParenthesis).value, null);
      });
      test('no plus sign', () {
        const noPlusSign = '559912456789';
        expect(const BrPhoneStrip(noPlusSign).value, null);
      });
      test('illegal prefix', () {
        const illegalPrefix = '-551234567890';
        expect(const BrPhoneStrip(illegalPrefix).value, null);
      });
    });
  });
}
