import 'package:flutter_test/flutter_test.dart';
import 'package:callor/callor.dart';

/// Most test cases were taken from:
/// - [valid-email-addresses](https://en.wikipedia.org/wiki/Email_address#Valid_email_addresses)
void main() {
  group('Email validator', () {
    const error = 'malformed email';
    const email = Email(malformed: error);
    group('- valid emails:', () {
      test('simple valid email', () {
        expect(email('simple@example.com'), null);
        expect(email('very.common@example.com'), null);
        expect(email('very_common_too@example.com'), null);
        expect(email('disposable.style.email.with+symbol@example.com'), null);
        expect(email('other.email-with-hyphen@example.com'), null);
        expect(email('fully-qualified-domain@example.com'), null);
        expect(email('_______@example.com'), null);
      });
      test('numbers-only local-part', () {
        expect(email('1234567890@example.com'), null);
      });
      test('may go to user.name@example.com inbox', () {
        expect(email('user.name+tag+sorting@example.com'), null);
      });
      test('one-letter local-part', () {
        expect(email('x@example.com'), null);
      });
      test('indeed strange example', () {
        expect(email('example-indeed@strange-example.com'), null);
      });
      test('% escaped mail route to user@example.com via example.org', () {
        expect(email('user%example.com@example.org'), null);
      });
      test(
          'local part ending with non-alphanumeric character from the list of allowed printable characters',
          () {
        expect(email('user-@example.org'), null);
      });
    });
    group('- invalid emails:', () {
      test('no @ character', () {
        expect(email('Abc.example.com'), error);
      });
      test('only one @ is allowed outside quotation marks', () {
        expect(email('A@b@c@example.com'), error);
      });
      test(
          'none of the special characters in this local-part are allowed outside quotation marks',
          () {
        expect(email(r'a"b(c)d,e:f;g<h>i[j\k]l@example.com'), error);
      });
      test(
          'quoted strings must be dot separated or the only element making up the local-part',
          () {
        expect(email('just"not"right@example.com '), error);
      });
      test(
          'spaces, quotes, and backslashes may only exist when within quoted strings and preceded by a backslash',
          () {
        expect(email(r'this is"not\allowed@example.com'), error);
      });
      test(
          'even if escaped (preceded by a backslash), spaces, quotes, and backslashes must still be contained by quotes',
          () {
        expect(email(r'this\ still\"not\\allowed@example.com'), error);
      });
      test('local-part is longer than 64 characters', () {
        expect(
            email(
                '1234567890123456789012345678901234567890123456789012345678901234+x@example.com'),
            error);
      });
      test('Underscore is not allowed in domain part', () {
        expect(
            email(
                'i_like_underscore@but_its_not_allowed_in_this_part.example.com'),
            error);
      });
      test('icon characters', () {
        expect(email('QA[icon]CHOCOLATE[icon]@test.com'), error);
      });
    });
  });
}
