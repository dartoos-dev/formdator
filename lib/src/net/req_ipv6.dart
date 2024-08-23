import 'package:formdator/core.dart';
import 'package:formdator/net.dart';
import 'package:formdator/type.dart';

/// Convenience validator for required IPv6 addresses.
///
/// It is the composition between [Req] and [IPv6].
class ReqIPv6 {
  /// Non-blank and well-formed IPv6 values.
  ///
  /// [blank] the error message in case of an IPv6 address left blank; if
  /// omitted, the default message will be 'required IP'.
  /// [mal] the error message in case of a malformed IP address; if omitted, the
  /// default message will be 'malformed IPv6 address'.
  ReqIPv6({String? blank, String? mal})
      : this._set(IPv6(mal: mal), blank: blank);

  /// Helper ctor.
  ReqIPv6._set(IPv6 ip, {String? blank})
      : _reqIPv6 = Pair.str2(
          Req(blank: blank ?? 'required IPv6 address').call,
          ip.call,
        ).call;

  // the required IPv6 logic.
  final ValObj _reqIPv6;

  /// Valid — returns null — if [ipv6] is a non-blank, well-formed IPv6;
  /// otherwise, returns the blank error message if [ipv6] is null, or the
  /// malformed error message if [ipv6] is malformed.
  String? call(String? ipv6) => _reqIPv6(ipv6);
}
