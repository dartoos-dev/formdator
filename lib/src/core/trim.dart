import 'package:formdator/formdator.dart';

/// Trims input data.
///
/// It does not validate anything! It just trims input data and forwards it.
class Trim {
  /// Will remove any leading or trailing whitspace from input before forwarding
  /// it to [val].
  ///
  /// [val] a validator for string input data.
  const Trim(ValStr val) : _val = val;

  final ValStr _val;

  /// Trims input data and forwards it.
  String? call(String? input) => _val(input?.trim());
}
