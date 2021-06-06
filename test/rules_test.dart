import 'package:flutter_test/flutter_test.dart';
import 'package:callor/callor.dart';

import 'counter.dart';
import 'value_back.dart';

void main() {
  group('Multiple rules', () {
    group('- empty list of rules -', () {
      final norules = Rules([]);
      test('non-blank input', () {
        expect(norules('any text'), null);
      });
      test('blank input', () {
        expect(norules(null), null);
        expect(norules(''), null);
      });
    });
    group('- "req" constructor for required fields -', () {
      const errorMsg = 'required field';
      final req = Rules.req(errorMsg, const Ok());
      test('non-blank input', () {
        expect(req('any text'), null);
      });
      test('blank input', () {
        expect(req(null), errorMsg);
        expect(req(''), errorMsg);
      });
    });

    group('- custom rules -', () {
      test('single rule', () {
        final counter = Counter();
        final single = Rules([counter]);
        expect(single('any text'), null);
        expect(counter.value, 1);
      });
      test('multiple rules', () {
        final counter = Counter();
        final multiple = Rules([const Ok(), counter, const ValueBack()]);
        expect(multiple(null), null);
        expect(multiple('a text'), 'a text');
        expect(counter.value, 2);
      });
    });
  });
}
