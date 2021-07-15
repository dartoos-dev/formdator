import 'package:formdator/formdator.dart';

/// [ToValObj] adapter — Turns an [Object?] input into a suitable type.
class ToValObj {
  /// Converts input data of type [Object] into [String] and forwards it to the
  /// [single] validator.
  ///
  /// [single] the [ValStr] validator.
  ToValObj(ValStr single) : this.many([single]);

  /// Converts input data of type [Object] into [String] and forwards it to each
  /// instance within the [vals] collection.
  ///
  /// [vals] multiple instances of [ValStr].
  ToValObj.many(Iterable<ValStr> vals)
      : _rules = Rules<Object>(
          vals
              .map((valStr) => (Object? input) => valStr(input?.toString()))
              .toList(growable: false),
        );

  final Rules<Object> _rules;

  /// Forwards [input] as [String].
  String? call(Object? input) => _rules(input);
}
