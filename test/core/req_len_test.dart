import 'package:flutter_test/flutter_test.dart';
import 'package:formdator/formdator.dart';

void main() {
  group('ReqLen —', () {
    const blank = 'cannot be left blank';
    const diff = 'value length diff';
    const less = 'the value is too small';
    const great = 'the value is too large';
    group('assertions and error:', () {
      test('invalid length', () {
        expect(() => ReqLen(-1), throwsAssertionError);
        expect(() => ReqLen.min(-1), throwsAssertionError);
        expect(() => ReqLen.min(0), throwsAssertionError);
        expect(() => ReqLen.max(-1), throwsAssertionError);
        expect(() => ReqLen.max(0), throwsAssertionError);
        expect(() => ReqLen.range(4, 2), throwsAssertionError);
      });
      test('input type other than String, num, Iterable, or Map', () {
        expect(() => ReqLen(10).call(true), throwsArgumentError);
        expect(() => ReqLen.min(10).call(false), throwsArgumentError);
        expect(() => ReqLen.max(10).call(Object()), throwsArgumentError);
        expect(
          () => ReqLen.range(5, 10).call(const MapEntry(1, 'a')),
          throwsArgumentError,
        );
      });
    });

    group('input length = 0', () {
      group('ReqLen default ctor', () {
        final zeroReqLen = ReqLen(0, blank: blank, diff: diff);
        test('String', () {
          expect(zeroReqLen(null), blank);
          expect(zeroReqLen(''), blank);
          expect(zeroReqLen('a'), diff);
        });
        test('num', () {
          expect(zeroReqLen(null), blank);
          expect(zeroReqLen(1), diff);
        });
        test('Iterable', () {
          expect(zeroReqLen(null), blank);
          expect(zeroReqLen([]), blank);
          expect(zeroReqLen(['a']), diff);
        });
        test('Map', () {
          expect(zeroReqLen(null), blank);
          expect(zeroReqLen({}), blank);
          expect(zeroReqLen({1: 'a'}), diff);
        });
      });
    });

    group('input length = 5', () {
      group('ReqLen default ctor', () {
        final five = ReqLen(5, blank: blank, diff: diff);
        test('String', () {
          expect(five(null), blank);
          expect(five(''), blank);
          expect(five('a'), diff);
          expect(five('12345'), null);
          expect(five('123456'), diff);
        });
        test('num', () {
          expect(five(null), blank);
          expect(five(1), diff);
          expect(five(012345), null);
          expect(five(12345), null);
          expect(five(123456), diff);
        });
        test('Iterable', () {
          expect(five(null), blank);
          expect(five([]), blank);
          expect(five(['1']), diff);
          expect(five(['1', '2', '3', '4', '5']), null);
          expect(five(['1', '2', '3', '4', '5', '6']), diff);
        });
        test('Map', () {
          expect(five(null), blank);
          expect(five({}), blank);
          expect(five({1: 'a'}), diff);
          expect(five({1: 'a', 2: 'b', 3: 'c', 4: 'd', 5: 'e'}), null);
          expect(five({1: 'a', 2: 'b', 3: 'c', 4: 'd', 5: 'e', 6: 'f'}), diff);
        });
      });

      group('Len.min', () {
        final minFive = ReqLen.min(5, blank: blank, less: less);
        test('String', () {
          expect(minFive(null), blank);
          expect(minFive(''), blank);
          expect(minFive('1'), less);
          expect(minFive('12345'), null);
          expect(minFive('123456'), null);
        });
        test('num', () {
          expect(minFive(null), blank);
          expect(minFive(1), less);
          expect(minFive(01234), less);
          expect(minFive(12345), null);
          expect(minFive(123456), null);
        });
        test('Iterable', () {
          expect(minFive(null), blank);
          expect(minFive([]), blank);
          expect(minFive(['1']), less);
          expect(minFive([1, 2, 3, 4, 5]), null);
          expect(minFive([1, 2, 3, 4, 5, 6]), null);
        });
        test('Map', () {
          expect(minFive(null), blank);
          expect(minFive({}), blank);
          expect(minFive({1: 'a'}), less);
          expect(minFive({1: 'a', 2: 'b', 3: 'c', 4: 'd', 5: 'e'}), null);
          expect(
              minFive({1: 'a', 2: 'b', 3: 'c', 4: 'd', 5: 'e', 6: 'f'}), null);
        });
      });

      group('Len.max', () {
        final maxFive = Len.max(5, great: great);
        test('String', () {
          expect(maxFive(null), null);
          expect(maxFive(''), null);
          expect(maxFive('a'), null);
          expect(maxFive('12345'), null);
          expect(maxFive('123456'), great);
        });
        test('num', () {
          expect(maxFive(null), null);
          expect(maxFive(1), null);
          expect(maxFive(12345), null);
          expect(maxFive(123456), great);
        });
        test('Iterable', () {
          expect(maxFive(null), null);
          expect(maxFive([]), null);
          expect(maxFive(['a']), null);
          expect(maxFive([1, 2, 3, 4, 5]), null);
          expect(maxFive([1, 2, 3, 4, 5, 6]), great);
        });
        test('Map', () {
          expect(maxFive(null), null);
          expect(maxFive({}), null);
          expect(maxFive({1: 'a'}), null);
          expect(maxFive({1: 'a', 2: 'b', 3: 'c', 4: 'd', 5: 'e'}), null);
          expect(
            maxFive({1: 'a', 2: 'b', 3: 'c', 4: 'd', 5: 'e', 6: 'f'}),
            great,
          );
        });
      });

      group('Len.range', () {
        final rangeOneFive =
            ReqLen.range(1, 5, blank: blank, less: less, great: great);
        test('String', () {
          expect(rangeOneFive(null), blank);
          expect(rangeOneFive(''), blank);
          expect(rangeOneFive('a'), null);
          expect(rangeOneFive(12345), null);
          expect(rangeOneFive(123456), great);
        });
        test('num', () {
          expect(rangeOneFive(null), blank);
          expect(rangeOneFive(0), null);
          expect(rangeOneFive(12345), null);
          expect(rangeOneFive(123456), great);
        });
        test('Iterable', () {
          expect(rangeOneFive(null), blank);
          expect(rangeOneFive([]), blank);
          expect(rangeOneFive(['a']), null);
          expect(rangeOneFive([1, 2, 3, 4, 5]), null);
          expect(rangeOneFive([1, 2, 3, 4, 5, 6]), great);
        });
        test('Map', () {
          expect(rangeOneFive(null), blank);
          expect(rangeOneFive({}), blank);
          expect(rangeOneFive({1: 'a'}), null);
          expect(rangeOneFive({1: 'a', 2: 'b', 3: 'c', 4: 'd', 5: 'e'}), null);
          expect(
            rangeOneFive({1: 'a', 2: 'b', 3: 'c', 4: 'd', 5: 'e', 6: 'f'}),
            great,
          );
        });
      });
    });
  });
}
