import 'package:formdator/core.dart';
import 'package:formdator/net.dart';
import 'package:formdator/type.dart';

/// Convenience validator for required MAC Addresses.
///
/// It is the composition between [Req] and [MacAddr].
class ReqMacAddr {
  /// Non-blank and well-formed MAC Addresses.
  ///
  /// [blank] the error message in case of an MAC Address left blank; if
  /// omitted, the default message will be 'required MAC Address'.
  /// [mal] the error message in case of a malformed MAC Address; if omitted,
  /// the default message will be 'malformed MAC Address'.
  ReqMacAddr({String? blank, String? mal})
      : this._set(MacAddr(mal: mal), blank: blank);

  /// Helper ctor.
  ReqMacAddr._set(MacAddr mac, {String? blank})
      : _reqMacAddr = Pair.str2(
          Req(blank: blank ?? 'required MAC Address'),
          mac,
        );

  // the required IPv4 logic.
  final ValObj _reqMacAddr;

  /// Valid — returns null — if [mac] is a non-blank, well-formed MAC Address;
  /// otherwise, returns the blank error message if [mac] is null, or the
  /// malformed error message if [mac] is malformed.
  String? call(String? mac) => _reqMacAddr(mac);
}
