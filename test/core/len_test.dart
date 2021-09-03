import 'package:formdator/formdator.dart';
import 'package:test/test.dart';

void main() {
  group('Len —', () {
    const diff = 'value length diff';
    const short = 'the value is too small';
    const long = 'the value is too large';
    group('assertions and error:', () {
      test('invalid length', () {
        expect(() => Len(-1), throwsA(isA<AssertionError>()));
        expect(() => Len.min(-1), throwsA(isA<AssertionError>()));
        expect(() => Len.min(0), throwsA(isA<AssertionError>()));
        expect(() => Len.max(-1), throwsA(isA<AssertionError>()));
        expect(() => Len.max(0), throwsA(isA<AssertionError>()));
        expect(() => Len.range(4, 2), throwsA(isA<AssertionError>()));
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
        final zeroLen = Len(0, diff: diff);
        test('String', () {
          expect(zeroLen(null), null);
          expect(zeroLen(''), null);
          expect(zeroLen('a'), diff);
        });
        test('num', () {
          expect(zeroLen(null), null);
          expect(zeroLen(1), diff);
        });
        test('Iterable', () {
          expect(zeroLen(null), null);
          expect(zeroLen(<String>[]), null);
          expect(zeroLen(['a']), diff);
        });
        test('Map', () {
          expect(zeroLen(null), null);
          expect(zeroLen(<int, int>{}), null);
          expect(zeroLen({1: 'a'}), diff);
        });
      });
    });

    group('input length = 5', () {
      group('Len ctor', () {
        final five = Len(5, diff: diff);
        test('String', () {
          expect(five(null), null);
          expect(five(''), diff);
          expect(five('a'), diff);
          expect(five('12345'), null);
          expect(five('123456'), diff);
        });
        test('num', () {
          expect(five(null), null);
          expect(five(1), diff);
          expect(five(012345), null);
          expect(five(12345), null);
          expect(five(123456), diff);
        });
        test('Iterable', () {
          expect(five(null), null);
          expect(five(<String>[]), diff);
          expect(five(['1']), diff);
          expect(five(['1', '2', '3', '4', '5']), null);
          expect(five(['1', '2', '3', '4', '5', '6']), diff);
        });
        test('Map', () {
          expect(five(null), null);
          expect(five(<int, int>{}), diff);
          expect(five({1: 'a'}), diff);
          expect(five({1: 'a', 2: 'b', 3: 'c', 4: 'd', 5: 'e'}), null);
          expect(five({1: 'a', 2: 'b', 3: 'c', 4: 'd', 5: 'e', 6: 'f'}), diff);
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
          expect(minFive(<String>[]), short);
          expect(minFive(['1']), short);
          expect(minFive([1, 2, 3, 4, 5]), null);
          expect(minFive([1, 2, 3, 4, 5, 6]), null);
        });
        test('Map', () {
          expect(minFive(null), null);
          expect(minFive(<int, int>{}), short);
          expect(minFive({1: 'a'}), short);
          expect(minFive({1: 'a', 2: 'b', 3: 'c', 4: 'd', 5: 'e'}), null);
          expect(
            minFive({1: 'a', 2: 'b', 3: 'c', 4: 'd', 5: 'e', 6: 'f'}),
            null,
          );
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
          expect(maxFive(<String>[]), null);
          expect(maxFive(['a']), null);
          expect(maxFive([1, 2, 3, 4, 5]), null);
          expect(maxFive([1, 2, 3, 4, 5, 6]), long);
        });
        test('Map', () {
          expect(maxFive(null), null);
          expect(maxFive(<int, int>{}), null);
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
          expect(rangeOneFive(<String>[]), short);
          expect(rangeOneFive(['a']), null);
          expect(rangeOneFive([1, 2, 3, 4, 5]), null);
          expect(rangeOneFive([1, 2, 3, 4, 5, 6]), long);
        });
        test('Map', () {
          expect(rangeOneFive(null), null);
          expect(rangeOneFive(<int, int>{}), short);
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
