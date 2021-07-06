import 'package:flutter_test/flutter_test.dart';
import 'package:formdator/formdator.dart';

void main() {
  group('Len —', () {
    const error = 'value length error';
    const short = 'value is too short';
    const long = 'value is too long';
    group('assertion and type error:', () {
      test('negative length', () {
        expect(() => Len(-1), throwsAssertionError);
        expect(() => Len.min(-1), throwsAssertionError);
        expect(() => Len.max(-1), throwsAssertionError);
        expect(() => Len.range(-1, 1), throwsAssertionError);
        expect(() => Len.range(1, -1), throwsAssertionError);
      });
      test('input type other than String, num, Iterable, or Map', () {
        expect(() => Len(10).call(true), throwsArgumentError);
        expect(() => Len.min(10).call(false), throwsArgumentError);
        expect(() => Len.max(10).call(Object()), throwsArgumentError);
        expect(
          () => Len.range(5, 10).call(const MapEntry(1, 'a')),
          throwsArgumentError,
        );
      });
    });

    group('input length = 0', () {
      group('Len ctor', () {
        final zeroLen = Len(0, error: error);
        test('String', () {
          expect(zeroLen(null), null);
          expect(zeroLen(''), null);
          expect(zeroLen('a'), error);
        });
        test('num', () {
          expect(zeroLen(null), null);
          expect(zeroLen(1), error);
        });
        test('Iterable', () {
          expect(zeroLen(null), null);
          expect(zeroLen([]), null);
          expect(zeroLen(['a']), error);
        });
        test('Map', () {
          expect(zeroLen(null), null);
          expect(zeroLen({}), null);
          expect(zeroLen({1: 'a'}), error);
        });
      });

      group('Len.min', () {
        final minZeroLen = Len.min(0, short: short);
        test('String', () {
          expect(minZeroLen(null), null);
          expect(minZeroLen(''), null);
          expect(minZeroLen('a'), null);
        });
        test('num', () {
          expect(minZeroLen(null), null);
          expect(minZeroLen(1), null);
        });
        test('Iterable', () {
          expect(minZeroLen(null), null);
          expect(minZeroLen([]), null);
          expect(minZeroLen(['a']), null);
        });
        test('Map', () {
          expect(minZeroLen(null), null);
          expect(minZeroLen({}), null);
          expect(minZeroLen({1: 'a'}), null);
        });
      });

      group('Len.max', () {
        final maxZeroLen = Len.max(0, long: long);
        test('String', () {
          expect(maxZeroLen(null), null);
          expect(maxZeroLen(''), null);
          expect(maxZeroLen('a'), long);
        });
        test('num', () {
          expect(maxZeroLen(null), null);
          expect(maxZeroLen(1), long);
        });
        test('Iterable', () {
          expect(maxZeroLen(null), null);
          expect(maxZeroLen([]), null);
          expect(maxZeroLen(['a']), long);
        });
        test('Map', () {
          expect(maxZeroLen(null), null);
          expect(maxZeroLen({}), null);
          expect(maxZeroLen({1: 'a'}), long);
        });
      });

      group('Len.range', () {
        final rangeZeroLen = Len.range(0, 0, short: short, long: long);
        test('String', () {
          expect(rangeZeroLen(null), null);
          expect(rangeZeroLen(''), null);
          expect(rangeZeroLen('a'), long);
        });
        test('num', () {
          expect(rangeZeroLen(null), null);
          expect(rangeZeroLen(1), long);
        });
        test('Iterable', () {
          expect(rangeZeroLen(null), null);
          expect(rangeZeroLen([]), null);
          expect(rangeZeroLen(['a']), long);
        });
        test('Map', () {
          expect(rangeZeroLen(null), null);
          expect(rangeZeroLen({}), null);
          expect(rangeZeroLen({1: 'a'}), long);
        });
      });
    });

    group('input length = 5', () {
      group('Len ctor', () {
        final five = Len(5, error: error);
        test('String', () {
          expect(five(null), null);
          expect(five(''), error);
          expect(five('a'), error);
          expect(five('12345'), null);
          expect(five('123456'), error);
        });
        test('num', () {
          expect(five(null), null);
          expect(five(1), error);
          expect(five(012345), null);
          expect(five(12345), null);
          expect(five(123456), error);
        });
        test('Iterable', () {
          expect(five(null), null);
          expect(five([]), error);
          expect(five(['1']), error);
          expect(five(['1', '2', '3', '4', '5']), null);
          expect(five(['1', '2', '3', '4', '5', '6']), error);
        });
        test('Map', () {
          expect(five(null), null);
          expect(five({}), error);
          expect(five({1: 'a'}), error);
          expect(five({1: 'a', 2: 'b', 3: 'c', 4: 'd', 5: 'e'}), null);
          expect(five({1: 'a', 2: 'b', 3: 'c', 4: 'd', 5: 'e', 6: 'f'}), error);
        });
      });

      group('Len.min', () {
        final minFive = Len.min(5, short: short);
        test('String', () {
          expect(minFive(null), null);
          expect(minFive(''), short);
          expect(minFive('1'), short);
          expect(minFive('12345'), null);
          expect(minFive('123456'), null);
        });
        test('num', () {
          expect(minFive(null), null);
          expect(minFive(1), short);
          expect(minFive(01234), short);
          expect(minFive(12345), null);
          expect(minFive(123456), null);
        });
        test('Iterable', () {
          expect(minFive(null), null);
          expect(minFive([]), short);
          expect(minFive(['1']), short);
          expect(minFive([1, 2, 3, 4, 5]), null);
          expect(minFive([1, 2, 3, 4, 5, 6]), null);
        });
        test('Map', () {
          expect(minFive(null), null);
          expect(minFive({}), short);
          expect(minFive({1: 'a'}), short);
          expect(minFive({1: 'a', 2: 'b', 3: 'c', 4: 'd', 5: 'e'}), null);
          expect(
              minFive({1: 'a', 2: 'b', 3: 'c', 4: 'd', 5: 'e', 6: 'f'}), null);
        });
      });

      group('Len.max', () {
        final maxFive = Len.max(5, long: long);
        test('String', () {
          expect(maxFive(null), null);
          expect(maxFive(''), null);
          expect(maxFive('a'), null);
          expect(maxFive('12345'), null);
          expect(maxFive('123456'), long);
        });
        test('num', () {
          expect(maxFive(null), null);
          expect(maxFive(1), null);
          expect(maxFive(12345), null);
          expect(maxFive(123456), long);
        });
        test('Iterable', () {
          expect(maxFive(null), null);
          expect(maxFive([]), null);
          expect(maxFive(['a']), null);
          expect(maxFive([1, 2, 3, 4, 5]), null);
          expect(maxFive([1, 2, 3, 4, 5, 6]), long);
        });
        test('Map', () {
          expect(maxFive(null), null);
          expect(maxFive({}), null);
          expect(maxFive({1: 'a'}), null);
          expect(maxFive({1: 'a', 2: 'b', 3: 'c', 4: 'd', 5: 'e'}), null);
          expect(
            maxFive({1: 'a', 2: 'b', 3: 'c', 4: 'd', 5: 'e', 6: 'f'}),
            long,
          );
        });
      });

      group('Len.range', () {
        final rangeOneFive = Len.range(1, 5, short: short, long: long);
        test('String', () {
          expect(rangeOneFive(null), null);
          expect(rangeOneFive(''), short);
          expect(rangeOneFive('a'), null);
          expect(rangeOneFive(12345), null);
          expect(rangeOneFive(123456), long);
        });
        test('num', () {
          expect(rangeOneFive(null), null);
          expect(rangeOneFive(0), null);
          expect(rangeOneFive(12345), null);
          expect(rangeOneFive(123456), long);
        });
        test('Iterable', () {
          expect(rangeOneFive(null), null);
          expect(rangeOneFive([]), short);
          expect(rangeOneFive(['a']), null);
          expect(rangeOneFive([1, 2, 3, 4, 5]), null);
          expect(rangeOneFive([1, 2, 3, 4, 5, 6]), long);
        });
        test('Map', () {
          expect(rangeOneFive(null), null);
          expect(rangeOneFive({}), short);
          expect(rangeOneFive({1: 'a'}), null);
          expect(rangeOneFive({1: 'a', 2: 'b', 3: 'c', 4: 'd', 5: 'e'}), null);
          expect(
            rangeOneFive({1: 'a', 2: 'b', 3: 'c', 4: 'd', 5: 'e', 6: 'f'}),
            long,
          );
        });
      });
    });
  });
}
