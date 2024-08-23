import 'package:formdator/formdator.dart';

/// Convenient validator for required fields with length (number of items)
/// constraints.
///
/// It is the composite of [Req] and [Len] validators.
class ReqLen {
  /// Constrains the length (number of items).
  ///
  /// [len] the length or number of items; it must be >= 0.
  /// [blank] the error message in case of a null or empty input value.
  /// [diff] the error message if the length is different from [len].
  ReqLen(int len, {String? blank, String? diff})
      : _reqLenVal =
            Pair(Req(blank: blank).call, Len(len, diff: diff).call).call;

  /// Constrains the length (number of items) to a minimum amount.
  ///
  /// [min] the minimum number of items; it must be > 0.
  /// [blank] the error message in case of a null or empty input value.
  /// [short] the error message if the length < [min].
  ReqLen.min(int min, {String? blank, String? short})
      : _reqLenVal =
            Pair(Req(blank: blank).call, Len.min(min, short: short).call).call;

  /// Constrains the length or number of data items to a maximum amount.
  ///
  /// [max] the minimum number of items; it must be > 0.
  /// [blank] the error message in case of a null or empty input value.
  /// [long] the error message if the length > [max].
  ReqLen.max(int max, {String? blank, String? long})
      : _reqLenVal =
            Pair(Req(blank: blank).call, Len.max(max, long: long).call).call;

  /// Constrains the length (number of items) within the range [min–max].
  ///
  /// [min] the lower limit; it must be > 0 and < [max].
  /// [max] the upper limit; it must be > 0 and > [min].
  /// [blank] the error message in case of a null or empty input value.
  /// [short] the error message if the length < [min].
  /// [long] the error message if the length > [max].
  ReqLen.range(int min, int max, {String? blank, String? short, String? long})
      : _reqLenVal = Pair(
          Req(blank: blank).call,
          Len.range(min, max, short: short, long: long).call,
        ).call;

  // Performs length-related validation.
  final ValObj _reqLenVal;

  /// Valid - returns null - if [input] is neither null nor empty, and if its
  /// length is in a valid range.
  ///
  /// **Note:** the type of [input] must be [String], [num], [Iterable] or
  /// [Map].
  String? call(Object? input) => _reqLenVal(input);
}
