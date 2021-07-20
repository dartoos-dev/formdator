import 'package:formdator/formdator.dart';

/// A pair of validators.
class Pair {
  /// A pair of validators of type [ValObj].
  ///
  /// For example, for a mandatory length of 30 characters:
  ///
  /// - ```Pair(Req(), Len.max(30));```
  Pair(ValObj first, ValObj second)
      : _pair = ((Object? input) => first(input) ?? second(input));

  /// A pair of validators of type [ValStr].
  ///
  /// **Note:** the validators can be of either [ValStr] or [ValObj] type due to
  /// the fact that a [String] value is also an [Object] value.
  ///
  /// Examples:
  ///
  /// - A mandatory email: ```Pair.str(Req(), Email());```
  /// - A email that contains only lowercase letters:
  /// ```Pair.str(NoUpperCase(), Email());```
  Pair.str(ValStr first, ValStr second)
      : this(ToValObj(first), ToValObj(second));

  // The pair.
  final ValObj _pair;

  /// Valid — returns null — if [input] if valid for both validators.
  String? call(Object? input) => _pair(input);
}
