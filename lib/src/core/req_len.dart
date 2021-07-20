import 'package:formdator/formdator.dart';

/// Convenient validator for required fields with length/quantity constraints.
///
/// It is the composite of [Req] and [Len] validators.
class ReqLen {
  /// Constrains the length or quantity of data items.
  ///
  /// [len] the length or number of items; it must be >= 0.
  /// [blank] the error message in case of a null or empty input value.
  /// [diff] the error message if the length or number of data items is
  /// different from [len].
  ReqLen(int len, {String? blank, String? diff})
      : _reqLenVal = Pair(Req(blank: blank), Len(len, diff: diff));

  /// Constrains the length or number of data items to a minimum amount.
  ///
  /// [min] the minimum number of items; it must be > 0.
  /// [blank] the error message in case of a null or empty input value.
  /// [less] the error message if the length or number of items is < [min].
  ReqLen.min(int min, {String? blank, String? less})
      : _reqLenVal = Pair(Req(blank: blank), Len.min(min, less: less));

  /// Constrains the length or number of data items to a maximum amount.
  ///
  /// [max] the minimum number of items; it must be > 0.
  /// [blank] the error message in case of a null or empty input value.
  /// [great] the error message if the length or number of items is > [max].
  ReqLen.max(int max, {String? blank, String? great})
      : _reqLenVal = Pair(Req(blank: blank), Len.max(max, great: great));

  /// Constrains the length or number of data items within the range [min–max].
  ///
  /// [min] the lower limit; it must be > 0 and < [max].
  /// [max] the upper limit; it must be > 0 and > [min].
  /// [blank] the error message in case of a null or empty input value.
  /// [less] the error message if the length or number of items is < [min].
  /// [great] the error message if the length or number of items is > [max].
  ReqLen.range(int min, int max, {String? blank, String? less, String? great})
      : _reqLenVal = Pair(
          Req(blank: blank),
          Len.range(min, max, less: less, great: great),
        );

  // Performs length-related validation.
  final ValObj _reqLenVal;

  /// Valid - returns null - if [input] is neither null nor empty, and if its
  /// length is in a valid range.
  ///
  /// **Note:** the type of [input] must be [String], [num], [Iterable] or
  /// [Map].
  String? call(Object? input) => _reqLenVal(input);
}
