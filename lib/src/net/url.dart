import 'package:formdator/formdator.dart';

/// URL Validator.
///
/// Blank field - null value - is a valid input!
///
/// If the URL is required, see [ReqUrl] or [Req].
///
/// Notes on possible differences from a standard/generic validation:
///
/// - utf-8 char class take in consideration the full Unicode range
/// - Top-level domains (TLDs) have been made mandatory so single names like
///   "localhost" fails
/// - protocols have been restricted to ftp, http and https
/// - IP address dotted notation validation, range: 1.0.0.0 - 223.255.255.255
///   first and last IP address of each class is considered invalid (since they
///   are broadcast/network addresses)
///
/// - Made starting path slash optional (http://example.com?foo=bar)
/// - Allow a dot (.) at the end of hostnames (http://example.com.)
/// - Allow an underscore (_) character in host/domain_names
/// - Check dot delimited parts length and total length
/// - Made protocol optional, allowed short syntax //
class Url {
  /// Validates URL values using a regular expression.
  ///
  /// If the URL field is mandatory, see [ReqUrl] or [Req].
  const Url({this.mal = 'malformed URL'});

  /// The error message in case of a malformed URL value.
  final String mal;

  /// A suitable pattern for  URL values.
  ///
  /// Reference: [gist](https://gist.github.com/dperini/729294)
  static final RegExp urlPattern = RegExp(
    r'^(?:(?:(?:https?|ftp):)?\/\/)(?:\S+(?::\S*)?@)?(?:(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z0-9\u00a1-\uffff][a-z0-9\u00a1-\uffff_-]{0,62})?[a-z0-9\u00a1-\uffff]\.)+(?:[a-z\u00a1-\uffff]{2,}\.?))(?::\d{2,5})?(?:[/?#]\S*)?$',
    caseSensitive: false,
    unicode: true,
  );

  /// Returns `null` if [value] is `null` or a valid URL; returns [mal]
  /// otherwise.
  String? call(String? value) {
    return value == null || urlPattern.hasMatch(value) ? null : mal;
  }
}
