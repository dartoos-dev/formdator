import 'type.dart';

/// Trimmed value.
///
/// It does not validate anything! It just trims the input value and forwards
/// it.
class Trim {
  /// The value to be trimmed - remove any leading and trailing whitspace.
  const Trim(this._val);

  final Callor _val;

  /// Trims the value and forwards it.
  ///
  /// In other words, removes any leading and trailing whitespace.
  String? call(String? value) => _val(value?.trim());
}
