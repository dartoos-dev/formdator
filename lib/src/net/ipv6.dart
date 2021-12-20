import 'package:formdator/formdator.dart';

/// Validator of optional IP (version 6) addresses.
///
/// Blank field - null value - is a valid input!
///
/// If the IP address is required, see [ReqIPv6] or [Req].
///
/// IPv6 addresses are represented as eight groups of four hexadecimal digits
/// each, separated by colons. The full representation may be shortened; for
/// example, 2001:0db8:0000:0000:0000:8a2e:0370:7334 becomes
/// 2001:db8::8a2e:370:7334
///
/// See also:
/// - [IPv6](https://en.wikipedia.org/wiki/IPv6)
class IPv6 {
  /// Validates IPv4 addresses using a regular expression that is suitable for
  /// manually entered IP's. Examples:
  ///
  ///
  /// If the ipv4 field is mandatory, see [ReqIPv4] or [Req].
  ///
  /// [mal] the error message in case of a malformed IP address; if omitted, the
  /// default message will be 'malformed IPv6 address'.
  IPv6({String? mal})
      : _ipv6Val = ((String? ipv6) {
          return (ipv6 == null || _matcher.hasMatch(ipv6))
              ? null
              : mal ?? 'malformed IPv6 address';
        });

  // email validation logic.
  final ValStr _ipv6Val;

  // lazy loading (on-demand) initialization.
  static late final RegExp _matcher = _ipv6Pattern();

  /// a suitable pattern for  IPv6 addresses.
  static RegExp _ipv6Pattern() {
    return RegExp(
      r'^(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))$',
    );
  }

  /// Valid - returns null - if [ipv6] is either a well-formed IPV6 address or
  /// null.
  String? call(String? ipv6) => _ipv6Val(ipv6);
}
