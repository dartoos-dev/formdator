import 'package:formdator/formdator.dart';

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
  Hex({String? mal}) : _valHex = _HexImpl(mal, const Ok());

  /// Constrains the input data to the hexadecimal digits [0-9A–F] and its
  /// length (number of digits) to [len] hex-digits.
  ///
  /// [len] the number of hex-digits; it must be > 0.
  /// [mal] the error message if non-hex characters are found; the default value
  /// is 'non-hex-digit character(s) found'.
  /// [diff] the error message if the number of hex-digits is different from [len].
  Hex.len(int len, {String? mal, String? diff})
      : assert(len > 0),
        _valHex = _HexImpl(mal, Len(len, diff: diff));

  /// Constrains the input data to the hex-digits [0-9A–F] and its length
  /// (number of hex-digits) to a minimum of [min] hex-digits.
  ///
  /// [min] the minimum number of hex-digits; it must be > 0.
  /// [mal] the error message if non-hex characters are found; the default value
  /// is 'non-hex-digit character(s) found'.
  /// [less] the error message if the number of hex-digits is less than [min].
  Hex.min(int min, {String? mal, String? less})
      : assert(min > 0),
        _valHex = _HexImpl(mal, Len.min(min, less: less));

  /// Constrains the input data to the hex-digits [0-9A–F] and its length
  /// (number of hex-digits) to a maximum of [min] hex-digits.
  ///
  /// [max] the maximum number of hex-digits; it must be > 0.
  /// [mal] the error message if non-hex characters are found; the default value
  /// is 'non-hex-digit character(s) found'.
  /// [great] the error message if the number of hex-digits is greater than [max].
  Hex.max(int max, {String? mal, String? great})
      : assert(max > 0),
        _valHex = _HexImpl(mal, Len.max(max, great: great));

  /// Constrains the input data to the hex-digits [0-9A–F] and its length
  /// (number of hex-digits) within the range [min–max].
  ///
  /// [min] the minimum number of hex-digits; it must be > 0 and < [max].
  /// [max] the maximum number of hex-digits; it must be > 0 and > [min].
  /// [mal] the error message if non-hex characters are found; the default value
  /// is 'non-hex-digit character(s) found'.
  /// [less] the error message if the number of hex-digits is less than [min].
  /// [great] the error message if the number of hex-digits is greater than [max].
  Hex.range(int min, int max, {String? mal, String? less, String? great})
      : assert(min > 0),
        assert(max > 0),
        assert(max > min),
        _valHex = _HexImpl(
          mal,
          Len.range(min, max, less: less, great: great),
        );

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
