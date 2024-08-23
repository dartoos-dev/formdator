import 'package:formdator/core.dart';
import 'package:formdator/numeric.dart';

/// Convenient validator for required hexadecimal fields.
class ReqHex {
  /// Constrains the input data to hexadecimal digits.
  ///
  /// [blank] the error message in case of a null or empty input value.
  /// [mal] the error message if non-hex characters are found.
  ReqHex({String? blank, String? mal})
      : _reqHex = Pair.str2(Req(blank: blank).call, Hex(mal: mal).call);

  /// Constrains the input data to hexadecimal digits and its length to [len]
  /// hex-digits.
  ///
  /// [len] the number of hex-digits; it must be > 0.
  /// [blank] the error message in case of a null or empty input value.
  /// [mal] the error message if non-hex-digit characters are found.
  /// [diff] the error message if the number of hex-digits is different from
  /// [len].
  ReqHex.len(int len, {String? blank, String? mal, String? diff})
      : _reqHex = Pair.str2(
          Req(blank: blank).call,
          Hex.len(len, mal: mal, diff: diff).call,
        );

  /// Constrains the input data to the hexadecimal digits and its length to a
  /// minimum of [min] hex-digits.
  ///
  /// [min] the minimum number of hex-digits; it must be > 0.
  /// [blank] the error message in case of a null or empty input value.
  /// [mal] the error message if non-hex-digit characters are found.
  /// [short] the error message if the input length is shorter than [min]
  /// digits.
  ReqHex.min(int min, {String? blank, String? mal, String? short})
      : _reqHex = Pair.str2(
          Req(blank: blank).call,
          Hex.min(min, mal: mal, short: short).call,
        );

  /// Constrains the input data to hexadecimal digits and its length to a
  /// maximum of [max] hex-digits.
  ///
  /// [max] the maximum number of hex-digits; it must be > 0.
  /// [blank] the error message in case of a null or empty input value.
  /// [mal] the error message if non-hex-digit characters are found.
  /// [long] the error message if the input length is longer than [max] digits.
  ReqHex.max(int max, {String? blank, String? mal, String? long})
      : _reqHex = Pair.str2(
          Req(blank: blank).call,
          Hex.max(max, mal: mal, long: long).call,
        );

  /// Constrains the input data to the hexadecimal digits and its length within
  /// the range [min–max].
  ///
  /// [min] the minimum number of hex-digits; it must be > 0 and < [max].
  /// [max] the maximum number of hex-digits; it must be > 0 and > [min].
  /// [blank] the error message in case of a null or empty input value.
  /// [mal] the error message if non-hex-digit characters are found.
  /// [short] the error message if the input length is shorter than [min]
  /// digits.
  /// [long] the error message if the number of hex-digits is longer than [max].
  ReqHex.range(
    int min,
    int max, {
    String? blank,
    String? mal,
    String? short,
    String? long,
  }) : _reqHex = Pair.str2(
          Req(blank: blank).call,
          Hex.range(min, max, mal: mal, short: short, long: long).call,
        );

  // the hex-digit-only validation logic.
  final Pair _reqHex;

  /// Valid - returns null - if [input] consists of hex-digits.
  String? call(String? input) => _reqHex(input);
}
