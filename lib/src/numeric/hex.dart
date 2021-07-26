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
  /// [non] the error message if a non-hex character is found; the default value
  /// is 'non-hex digit'.
  Hex({String? non}) : _valHex = _HexImpl(non, const Ok());

  /// Constrains the input data to the hexadecimal digits [0-9A–F] and its
  /// length (number of digits) to [len] hex-digits.
  ///
  /// [len] the number of hex-digits; it must be > 0.
  /// [non] the error message if a non-hex-digit character is found.
  /// [diff] the error message if the number of hex-digits is different from [len].
  Hex.len(int len, {String? non, String? diff})
      : assert(len > 0),
        _valHex = _HexImpl(non, Len(len, diff: diff));

  /// Constrains the input data to the hex-digits [0-9A–F] and its length
  /// (number of hex-digits) to a minimum of [min] hex-digits.
  ///
  /// [min] the minimum number of hex-digits; it must be > 0.
  /// [non] the error message if a non-hex-digit character is found.
  /// [less] the error message if the number of hex-digits is less than [min].
  Hex.min(int min, {String? non, String? less})
      : assert(min > 0),
        _valHex = _HexImpl(non, Len.min(min, less: less));

  /// Constrains the input data to the hex-digits [0-9A–F] and its length
  /// (number of hex-digits) to a maximum of [min] hex-digits.
  ///
  /// [max] the maximum number of hex-digits; it must be > 0.
  /// [non] the error message if a non-hex-digit character is found.
  /// [great] the error message if the number of hex-digits is greater than [max].
  Hex.max(int max, {String? non, String? great})
      : assert(max > 0),
        _valHex = _HexImpl(non, Len.max(max, great: great));

  /// Constrains the input data to the hex-digits [0-9A–F] and its length
  /// (number of hex-digits) within the range [min–max].
  ///
  /// [min] the minimum number of hex-digits; it must be > 0 and < [max].
  /// [max] the maximum number of hex-digits; it must be > 0 and > [min].
  /// [non] the error message if a non-hex-digit character is found.
  /// [less] the error message if the number of hex-digits is less than [min].
  /// [great] the error message if the number of hex-digits is greater than [max].
  Hex.range(int min, int max, {String? non, String? less, String? great})
      : assert(min > 0),
        assert(max > 0),
        assert(max > min),
        _valHex = _HexImpl(
          non,
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
  /// [non] non-hex-digit error message; [extra] additional validation step.
  _HexImpl(String? non, ValObj extra)
      : _nonHex = non ?? 'non-hex-digit character',
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
