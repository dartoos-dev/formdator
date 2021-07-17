import 'package:flutter_test/flutter_test.dart';
import 'package:formdator/formdator.dart';

void main() {
  group('ReqEmail', () {
    const blank = 'required email address';
    const mal = 'malformed email address';
    final reqEmail = ReqEmail(blank: blank, mal: mal);
    final reqEmailLen = ReqEmail.len(30, blank: blank, mal: mal);
    test('null - blank', () {
      expect(reqEmail(null), blank);
      expect(reqEmailLen(null), blank);
    });
    test('empty - blank', () {
      expect(reqEmail(''), blank);
      expect(reqEmailLen(''), blank);
    });
    test('invalid email', () {
      const invalid = '123@email';
      expect(reqEmail(invalid), mal);
      expect(reqEmailLen(invalid), mal);
    });
    test('valid email', () {
      const valid = 'a_valid_user@anyemail.com';
      expect(reqEmail(valid), null);
      expect(reqEmailLen(valid), null);
    });
    test('long, valid email', () {
      const longValid = 'disposable.style.email.with+symbol@example.com';
      expect(reqEmail(longValid), null);
      expect(reqEmailLen(longValid), 'email longer than 30 chars');
    });
  });
}
