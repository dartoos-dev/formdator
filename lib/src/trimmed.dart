import 'type.dart';

/// Convenience trimmed value validator.

/// It does not validate anything! It just trims the incoming value
/// and forwards it to the encapsulated validator.
class Trimmed {

  final Val _validator;

  const Trimmed(this._validator);

  /// Trims the value before forwarding it.
  String call(String value) => _validator(value.trim());
}
