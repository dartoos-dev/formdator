import 'package:formdator/formdator.dart';

/// Numeric constraints — constraints relating to numbers.
///
/// For example, the values "1", "123", "-1" and "-9.99" are valid numbers;
/// whereas, "A", "12A" and "12.A3" are invalid.
class Num {
  /// Validation for optional, numeric-only inputs.
  ///
  /// Constrains (limits) the data type to numeric values.
  ///
  /// [nan] "Not-A-Number", error message in case of a non-numeric input.
  /// [min] optional minimum value.
  /// [small] error message in case of a too small input — ignored if [min] is
  /// not set.
  /// [max] optional maximum value.
  /// [long] error message in case of a too large input — ignored if [max] is
  /// not set.
  Num({
    String? nan,
    num? min,
    String? small,
    num? max,
    String? large,
  }) : _numVal = ((String? input) {
          if (input == null) return null;

          final inputAsNum = num.tryParse(input.toString());
          if (inputAsNum == null) return nan ?? 'non-numeric value';

          if (min != null && inputAsNum < min) return small ?? 'too small';

          if (max != null && inputAsNum > max) return large ?? 'too large';

          return null;
        });

  /// Validation for required, numeric-only inputs.
  ///
  /// Constrains (limits) the data type to numeric values.
  ///
  /// [blank] is the error message in case of a null or empty input.
  /// [nan] "Not-A-Number", error message in case of a non-numeric input.
  /// [min] optional minimum value.
  /// [small] error message in case of a too small input — ignored if [min] is
  /// not set.
  /// [max] optional maximum value.
  /// [long] error message in case of a too large input — ignored if [max] is
  /// not set.
  Num.req({
    String blank = 'required number',
    String? nan,
    num? min,
    String? small,
    num? max,
    String? large,
  }) : _numVal = Rules<String>([
          Req(blank: blank),
          Num(nan: nan, min: min, small: small, max: max, large: large),
        ]);

  // validates input values.
  final StrVal _numVal;

  /// Valid — returns null – if [input] is either numeric or null.
  String? call(String? input) => _numVal(input);
}
