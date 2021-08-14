import 'package:formdator/formdator.dart';
import 'package:test/test.dart';

void main() {
  group('ReqBrPhone', () {
    const error = 'malformed number';
    const blank = 'required field';
    final brPhone = ReqBrPhone(blank: blank, mal: error);
    test('null', () {
      expect(brPhone(null), blank);
    });
    test('empty', () {
      expect(brPhone(''), blank);
    });
    test('masked well-formed', () {
      expect(brPhone('(12) 3456-7890'), null);
      expect(brPhone('(98) 7654-3210'), null);
    });
    test('unmasked (plain) well-formed', () {
      expect(brPhone('0000000000'), null);
      expect(brPhone('1234567890'), null);
      expect(brPhone('9876543210'), null);
      expect(brPhone('9999999999'), null);
    });

    test('malformed', () {
      expect(brPhone('05505+210'), error);
      expect(brPhone('05505/210'), error);
      expect(brPhone('1234A-123'), error);
      expect(brPhone('12345X789'), error);
    });
    test('fewer than 10 digits', () {
      expect(brPhone('1'), error);
      expect(brPhone('12345678'), error);
      expect(brPhone('(44) 1234-567'), error);
    });
    test('more than 10 digits', () {
      expect(brPhone('12345678901'), error);
      expect(brPhone('(123) 1234-7890'), error);
      expect(brPhone('(77) 12340-7890'), error);
      expect(brPhone('(77) 1234-78901'), error);
    });
  });
}
