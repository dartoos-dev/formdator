import 'package:formdator/formdator.dart';

/// A pair of validators.
class Pair {
  /// A pair of heterogeneous validators.
  ///
  /// The first type of validator is [ValObj], while the second is [ValStr]. For
  /// example:
  /// - ```Pair(Req(), Email());```
  Pair(ValObj first, ValStr second) : this.obj(first, ToValObj(second));

  /// A pair of [ValObj] validators.
  ///
  /// For example:
  /// - ```Pair.obj(Req(), Len.max(30));```
  Pair.obj(ValObj first, ValObj second)
      : _pair = Rules<Object>([first, second]);

  /// A pair of [ValStr] validators.
  ///
  /// For example:
  /// - ```
  ///   String? noUpperCase(String? input) {
  ///     return (input != null && input.contains(RegExp('[A-Z]')))
  ///         ? 'there must be no uppercase letters'
  ///         : null;
  ///     }
  ///   Pair.str(noUpperCase, Email());
  ///   ```
  Pair.str(ValStr first, ValStr second)
      : this.obj(ToValObj(first), ToValObj(second));

  // The pair.
  final Rules<Object> _pair;

  /// Valid — returns null — if [input] if valid for both validators.
  String? call(Object? input) => _pair(input);
}
