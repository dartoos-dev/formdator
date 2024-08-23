import 'package:formdator/formdator.dart';

/// A pair of validators.
class Pair {
  /// A pair of validators of type [ValObj].
  ///
  /// For example:
  ///
  /// - a required field with up to 30 characters: `Pair(Req(), Len.max(30));`
  const Pair(this._first, this._second);

  /// A pair of validators of which the first one is of type [ValStr].
  ///
  /// Example:
  ///
  /// - an email with up to 50 characters: `Pair.str1st(Email(), Len.max(50));`
  Pair.str1(ValStr first, ValObj second) : this(ToValObj(first).call, second);

  /// A pair of validators of which the second one is of type [ValStr].
  ///
  /// Example:
  ///
  /// - a mandatory email: `Pair.str2nd(Req(), Email());`
  Pair.str2(ValObj first, ValStr second) : this(first, ToValObj(second).call);

  /// A pair of validators of type [ValStr].
  ///
  /// **Note:** the validators can be of either [ValStr] or [ValObj] type due to
  /// the fact that a [String] value is also an [Object] value.
  ///
  /// Examples:
  ///
  /// - a mandatory email: `Pair.str(Req(), Email());`
  /// - an email with no uppercase letters: `Pair.str(NoUpperCase(), Email());`
  Pair.str(ValStr first, ValStr second)
      : this(ToValObj(first).call, ToValObj(second).call);

  // The pair of validators.
  final ValObj _first;
  final ValObj _second;

  /// Valid — returns null — if [input] if valid for both validators.
  String? call(Object? input) => _first(input) ?? _second(input);
}
