import 'type.dart';

/// Mandatory field.
///
/// **Note:** both the **null** value and the empty string **''** are **invalid inputs**.
class Req {
  /// Non-blank field.
  ///
  /// [field] an optional extra validation step. E.g.:
  ///   _Req(field:Email(mal:'malformed email'), blank:'email is required')_
  /// for a required email.
  /// [blank] is the error message in case of a null or empty input.
  const Req({Callor field = _ok, required String blank})
      : _val = field,
        _blank = blank;

  final String _blank;
  // optional extra validation.
  final Callor _val;

  // always ok validation.
  static String? _ok(String? v) => null;

  /// Valid - returns null - if [value] is neither null nor empty.
  // String? call(String? value) => value == null || value.isEmpty ? _blank : null;
  String? call(String? value) =>
      value == null || value.isEmpty ? _blank : _val(value);
}
