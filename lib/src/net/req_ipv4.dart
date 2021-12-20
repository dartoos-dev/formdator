import 'package:formdator/core.dart';
import 'package:formdator/net.dart';
import 'package:formdator/type.dart';

/// Convenience validator for required IPv4 addresses.
///
/// It is the composition between the validators [Req] and [IPv4].
class ReqIPv4 {
  /// Non-blank and well-formed IPv4 values.
  ///
  /// [blank] the error message in case of an IPv4 address left blank; if
  /// omitted, the default message will be 'required IP'.
  /// [mal] the error message in case of a malformed IP address; if omitted, the
  /// default message will be 'malformed IP address'.
  ReqIPv4({String? blank, String? mal})
      : this._set(IPv4(mal: mal), blank: blank);

  /// Helper ctor.
  ReqIPv4._set(IPv4 ip, {String? blank})
      : _reqIPv4 = Pair.str2(Req(blank: blank ?? 'required IP address'), ip);

  // the required IPv4 logic.
  final ValObj _reqIPv4;

  /// Valid — returns null — if [ipv4] is a non-blank well-formed IPv4;
  /// otherwise, returns the blank error message if [ipv4] is null, or the
  /// malformed error message if [ipv4] is malformed.
  String? call(String? ipv4) => _reqIPv4(ipv4);
}
