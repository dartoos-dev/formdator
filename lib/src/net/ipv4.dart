import 'package:formdator/formdator.dart';

/// Validator of optional IP (version 4) addresses.
///
/// Blank field - null value - is a valid input!
///
/// If the IP address is required, see [ReqIPv4] or [Req].
///
/// It uses the "Dot-decimal notation", which consists of four octets of the
/// address expressed individually in decimal numbers and separated by periods.
/// Examples of valid input:
///
/// - 192.0.2.235
/// - 172.16.254.1
/// - 127.0.0.1
/// - 10.0.0.1
/// - 0.0.0.0
///
/// See also:
/// - [Dot Decimal Notation](https://en.wikipedia.org/wiki/Dot-decimal_notation)
class IPv4 {
  /// Validates IPv4 addresses using a regular expression that is suitable for
  /// manually entered IP's. Examples:
  ///
  ///
  /// If the ipv4 field is mandatory, see [ReqIPv4] or [Req].
  ///
  /// [mal] the error message in case of a malformed IP address; if omitted, the
  /// default message will be 'malformed IP address'.
  IPv4({String? mal})
      : _ipv4Val = ((String? ipv4) {
          return (ipv4 == null || _matcher.hasMatch(ipv4))
              ? null
              : mal ?? 'malformed IP address';
        });

  // email validation logic.
  final ValStr _ipv4Val;

  // lazy loading (on-demand) initialization.
  static final RegExp _matcher = _ipv4Pattern();

  /// a suitable pattern for  IPv4 addresses.
  static RegExp _ipv4Pattern() {
    return RegExp(
      r'^(?:(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])$',
    );
  }

  /// Valid - returns null - if [ipv4] is either a well-formed IPV4 address or
  /// null.
  String? call(String? ipv4) => _ipv4Val(ipv4);
}
