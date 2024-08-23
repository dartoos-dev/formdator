import 'package:formdator/src/core/required.dart';
import 'package:test/test.dart';

void main() {
  group('Required —', () {
    group('valid inputs:', () {
      const requiredWithValidInput = Required();
      test('short input value', () {
        expect(requiredWithValidInput('1'), null);
      });
      test('long input value', () {
        expect(
          requiredWithValidInput('abcdefghijklmnopqrstuvwxyz-1234567890'),
          null,
        );
      });
      test('non-digits, non-alpha chars', () {
        expect(requiredWithValidInput('@#\$*()-+=-'), null);
      });
      test('Iterable input', () {
        expect(requiredWithValidInput(['123', '45']), null);
      });
      test('Map input', () {
        expect(requiredWithValidInput({'key1': 1, 'key2': 'two'}), null);
      });
    });
    group('invalid inputs:', () {
      const errorMessage = 'required field';
      const requiredWithEmptyInput = Required(ifBlank: errorMessage);
      test('null', () {
        expect(requiredWithEmptyInput(null), errorMessage);
      });
      test('empty string', () {
        expect(requiredWithEmptyInput(''), errorMessage);
      });
      test('empty iterable', () {
        expect(requiredWithEmptyInput(<int>[]), errorMessage);
      });
      test('empty map', () {
        expect(requiredWithEmptyInput(<int, int>{}), errorMessage);
      });
    });
  });
}
