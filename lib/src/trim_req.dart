import 'required.dart';
import 'trimmed.dart';

/// Convenience trimmed required validator.
class TrimReq {
  final Trimmed _trimmed;

  TrimReq({String blank = 'Non-blank field.'})
      : _trimmed = Trimmed(Required(msg: blank));

  /// Trims the value before validating agains blankness.
  String call(String value) => _trimmed(value);
}
