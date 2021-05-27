import 'type.dart';

/// Trimmed value.
///
/// It does not validate anything! It just trims the incoming value and forwards
/// it to the encapsulated validator.
class Trim {
  /// The value to be trimmed - without any leading and trailing whitspace.
  const Trim(this._validator);

  final Callor _validator;

  /// Trims the value and forwards it.
  ///
  /// In another words, removes any leading and trailing whitespace.
  String? call(String? value) => _validator(value?.trim());
}
