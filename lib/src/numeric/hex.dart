import 'package:formdator/core.dart';
import 'package:formdator/logic.dart';
import 'package:formdator/numeric.dart';
import 'package:formdator/type.dart';

/// Hex - any one of the sixteen hexadecimal digits 0 to F.
///
/// For example, the values "1", "123", "1B", and "CAFEBABE" are valid; "AG",
/// "12@", "123.34", "9.99" are invalid.
///
/// Blank field — null or empty — is a valid input.
///
/// If the field is mandatory, see [ReqHex] or [Req].
class Hex {
  /// Constrains the input data to hexadecimal digits [0-9A-F].
  ///
  /// [mal] the error message if non-hex characters are found; the default value
  /// is 'non-hex-digit character(s) found'.
  Hex({String? mal}) : _valHex = _HexImpl(mal, const Ok().call).call;

  /// Constrains the input data to the hexadecimal digits [0-9A–F] and its
  /// length (number of digits) to [len] hex-digits.
  ///
  /// [len] the number of hex-digits; it must be > 0.
  /// [mal] the error message if non-hex characters are found; if omitted, the
  /// default value is 'non-hex-digit character(s) found'.
  /// [diff] the error message if the number of hex-digits is different from
  /// [len].
  Hex.len(int len, {String? mal, String? diff})
      : assert(len > 0),
        _valHex = _HexImpl(mal, Len(len, diff: diff).call).call;

  /// Constrains the input data to the hex-digits [0-9A–F] and its length
  /// (number of hex-digits) to a minimum of [min] hex-digits.
  ///
  /// [min] the minimum number of hex-digits; it must be > 0.
  /// [mal] the error message if non-hex characters are found; the default value
  /// is 'non-hex-digit character(s) found'.
  /// [short] the error message if the input length is shorter than [min]
  /// digits.
  Hex.min(int min, {String? mal, String? short})
      : assert(min > 0),
        _valHex = _HexImpl(mal, Len.min(min, short: short).call).call;

  /// Constrains the input data to the hex-digits [0-9A–F] and its length
  /// (number of hex-digits) to a maximum of [max] hex-digits.
  ///
  /// [max] the maximum number of hex-digits; it must be > 0.
  /// [mal] the error message if non-hex characters are found; the default value
  /// is 'non-hex-digit character(s) found'.
  /// [long] the error message if the input length is longer than [max] digits.
  Hex.max(int max, {String? mal, String? long})
      : assert(max > 0),
        _valHex = _HexImpl(mal, Len.max(max, long: long).call).call;

  /// Constrains the input data to the hex-digits [0-9A–F] and its length
  /// (number of hex-digits) within the range [min–max].
  ///
  /// [min] the minimum number of hex-digits; it must be > 0 and < [max].
  /// [max] the maximum number of hex-digits; it must be > 0 and > [min].
  /// [mal] the error message if non-hex characters are found; the default value
  /// is 'non-hex-digit character(s) found'.
  /// [short] the error message if the input length is shorter than [min]
  /// digits.
  /// [long] the error message if the input length is longer than [max] digits.
  Hex.range(int min, int max, {String? mal, String? short, String? long})
      : assert(min > 0),
        assert(max > 0),
        assert(max > min),
        _valHex = _HexImpl(
          mal,
          Len.range(min, max, short: short, long: long).call,
        ).call;

  // the hex-digit-only validation logic.
  final ValStr _valHex;

  /// Valid - returns null - if [input] is either null or consists of
  /// hex-digits.
  String? call(String? input) => _valHex(input);
}

/// Helper implementation class.
class _HexImpl {
  /// [mal] non-hex-digit error message; [extra] additional validation step.
  _HexImpl(String? mal, ValObj extra)
      : _nonHex = mal ?? 'non-hex-digit character(s) found',
        _extra = extra;

  final String _nonHex;
  // extra validation step.
  final ValObj _extra;

  static final _hexDigitsOnly = RegExp(r'^[0-9a-fA-F]+$');

  String? call(String? input) {
    return (input != null && !_hexDigitsOnly.hasMatch(input))
        ? _nonHex
        : _extra(input);
  }
}
