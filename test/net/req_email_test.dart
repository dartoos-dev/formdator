import 'package:flutter_test/flutter_test.dart';
import 'package:formdator/formdator.dart';

/// Most test cases were taken from:
/// - [valid-email-addresses](https://en.wikipedia.org/wiki/Email_address#Valid_email_addresses)
void main() {
  group('Default error messages', () {
    final reqEmail = ReqEmail();
    test('null - blank', () {
      expect(reqEmail(null), 'required email');
    });
    test('empty - blank', () {
      expect(reqEmail(''), 'required email');
    });
    test('invalid email', () {
      expect(reqEmail('123@email'), 'malformed email');
    });
    test('valid email', () {
      expect(reqEmail('a_valid_user@anyemail.com'), null);
    });
  });
  group('Custom error messages', () {
    const mal = 'malformed email';
    const blank = 'required email';
    final reqEmail = ReqEmail(blank: blank, mal: mal);
    test('null - blank', () {
      expect(reqEmail(null), blank);
    });
    test('empty - blank', () {
      expect(reqEmail(''), blank);
    });
    test('invalid email, no @ character', () {
      expect(reqEmail('Abc.example.com'), mal);
    });
    test('valid email', () {
      expect(reqEmail('user@validemail.com'), null);
    });
  });
}
