import 'package:formdator/formdator.dart';

/// Convenient validator for required hexadecimal fields.
class ReqHex {
  /// Constrains the input data to hexadecimal digits.
  ///
  /// [blank] the error message in case of a null or empty input value.
  /// [mal] the error message if non-hex characters are found.
  ReqHex({String? blank, String? mal})
      : _reqHex = Pair.str2(Req(blank: blank), Hex(mal: mal));

  /// Constrains the input data to hexadecimal digits and its length to [len]
  /// hex-digits.
  ///
  /// [len] the number of hex-digits; it must be > 0.
  /// [blank] the error message in case of a null or empty input value.
  /// [mal] the error message if non-hex-digit characters are found.
  /// [diff] the error message if the number of hex-digits is different from [len].
  ReqHex.len(int len, {String? blank, String? mal, String? diff})
      : _reqHex = Pair.str2(
          Req(blank: blank),
          Hex.len(len, mal: mal, diff: diff),
        );

  /// Constrains the input data to the hexadecimal digits and its length to a
  /// minimum of [min] hex-digits.
  ///
  /// [min] the minimum number of hex-digits; it must be > 0.
  /// [blank] the error message in case of a null or empty input value.
  /// [mal] the error message if non-hex-digit characters are found.
  /// [less] the error message if the number of hex-digits is less than [min].
  ReqHex.min(int min, {String? blank, String? mal, String? less})
      : _reqHex = Pair.str2(
          Req(blank: blank),
          Hex.min(min, mal: mal, less: less),
        );

  /// Constrains the input data to hexadecimal digits and its length to a
  /// maximum of [min] hex-digits.
  ///
  /// [max] the maximum number of hex-digits; it must be > 0.
  /// [blank] the error message in case of a null or empty input value.
  /// [mal] the error message if non-hex-digit characters are found.
  /// [great] the error message if the number of hex-digits is greater than [max].
  ReqHex.max(int max, {String? blank, String? mal, String? great})
      : _reqHex = Pair.str2(
          Req(blank: blank),
          Hex.max(max, mal: mal, great: great),
        );

  /// Constrains the input data to the hexadecimal digits and its length within
  /// the range [min–max].
  ///
  /// [min] the minimum number of hex-digits; it must be > 0 and < [max].
  /// [max] the maximum number of hex-digits; it must be > 0 and > [min].
  /// [blank] the error message in case of a null or empty input value.
  /// [mal] the error message if non-hex-digit characters are found.
  /// [less] the error message if the number of hex-digits is less than [min].
  /// [great] the error message if the number of hex-digits is greater than [max].
  ReqHex.range(
    int min,
    int max, {
    String? blank,
    String? mal,
    String? less,
    String? great,
  }) : _reqHex = Pair.str2(
          Req(blank: blank),
          Hex.range(min, max, mal: mal, less: less, great: great),
        );

  // the hex-digit-only validation logic.
  final Pair _reqHex;

  /// Valid - returns null - if [input] consists of hex-digits.
  String? call(String? input) => _reqHex(input);
}
