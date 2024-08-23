import 'package:formdator/formdator.dart';

/// Validator of optional MAC Addresses.
///
/// Blank field - null value - is a valid input!
///
/// If the MAC address is required, see [ReqMacAddr] or [Req].
///
/// Either colon ':' or hyphen '-' can be used as separators. The user should
/// use one or the other, but never mix them in a single written MAC Address.
///
/// Examples of valid input:
///
/// - 02:42:d5:e7:db:7e ':' as separator
/// - 11-d4-aa-73-ba-88 '-' as separator
class MacAddr {
  /// Validates MAC Addresses using a regular expression that enforces either
  /// all colons ':' or all dashes (hyphens) '-' for the MAC Address notation.
  ///
  /// If the MAC Address field is mandatory, see [ReqMacAddr] or [Req].
  ///
  /// [mal] the error message in case of a malformed MAC Address; if omitted,
  /// the default message will be 'malformed MAC Address'.
  MacAddr({String? mal})
      : _macAddrVal = ((String? mac) {
          return (mac == null || _matcher.hasMatch(mac))
              ? null
              : mal ?? 'malformed MAC Address';
        });

  // Validation logic.
  final ValStr _macAddrVal;

  // lazy loading (on-demand) initialization.
  static final RegExp _matcher = _macAddrPattern();

  /// A suitable pattern for  MAC Addresses.
  ///
  /// Enforces either all colons or all dashes (hyphens) for the MAC Address
  /// notation.
  static RegExp _macAddrPattern() {
    return RegExp(
      r'^[0-9A-Fa-f]{2}([-:])([0-9A-Fa-f]{2}\1){4}[0-9A-Fa-f]{2}$',
    );
  }

  /// Valid - returns null - if [mac] is either a well-formed MAC Address or
  /// null.
  String? call(String? mac) => _macAddrVal(mac);
}
