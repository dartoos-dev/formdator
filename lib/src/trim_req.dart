import 'required.dart';
import 'trimmed.dart';

/// Convenience trimmed required validator.
class TrimReq {
  /// Trimmed mandatory with [blank] as the erro message.
  TrimReq({String blank = 'Non-blank field.'})
      : _trimmed = Trimmed(Required(blank: blank));

  final Trimmed _trimmed;

  /// Trims the value before validating for blankness.
  String? call(String? value) => _trimmed(value);
}
