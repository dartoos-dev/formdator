import 'package:formdator/formdator.dart';
import 'package:test/test.dart';

void main() {
  group('ReqBrMobile', () {
    const error = 'malformed number';
    const blank = 'required field';
    final brMobile = ReqBrMobile(blank: blank, mal: error);
    test('null', () {
      expect(brMobile(null), blank);
    });
    test('empty', () {
      expect(brMobile(''), blank);
    });
    test('masked well-formed', () {
      expect(brMobile('(00) 00000-0000'), null);
      expect(brMobile('(12) 93456-7890'), null);
      expect(brMobile('(98) 97654-3210'), null);
      expect(brMobile('(99) 99999-9999'), null);
    });
    test('unmasked (plain) well-formed', () {
      expect(brMobile('90000000000'), null);
      expect(brMobile('91234567890'), null);
      expect(brMobile('99876543210'), null);
      expect(brMobile('99999999999'), null);
    });

    test('malformed', () {
      expect(brMobile('905505+210'), error);
      expect(brMobile('905505/210'), error);
      expect(brMobile('91234A-123'), error);
      expect(brMobile('912345X789'), error);
    });
    test('fewer than 11 digits', () {
      expect(brMobile('1'), error);
      expect(brMobile('123456789'), error);
      expect(brMobile('(44) 91234-567'), error);
      expect(brMobile('(44) 912-34567'), error);
    });
    test('more than 11 digits', () {
      expect(brMobile('129345678901'), error);
      expect(brMobile('(123) 91234-7890'), error);
      expect(brMobile('(77) 912340-7890'), error);
      expect(brMobile('(77) 91234-78901'), error);
    });
  });
}
