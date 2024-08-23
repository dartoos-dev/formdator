import 'package:formdator/formdator.dart';

/// Transforms an input value of type 'Object?' into a more suitable type.
class ToValObj {
  /// Tries to convert an input value of type Object? into a value of type
  /// String?.
  ///
  /// **Note:** If you do not want an exception whenever an input value is not
  /// of type [String]?, see [ToValObj.toStr].
  ///
  /// Throws an [ArgumentError] if an input value is not of type 'String?'.
  ToValObj(ValStr valStr)
      : _asValObj = ((Object? input) {
          if (input is String?) return valStr(input);
          throw ArgumentError.value(
            input,
            'input',
            'input type other than String?',
          );
        });

  /// Transforms an input value of type 'Object?' to a value of type 'String?'
  /// by invoking the [toString] method of the input value.
  ToValObj.toStr(ValStr valStr)
      : _asValObj = ((Object? input) => valStr(input?.toString()));

  /// Tries to convert an input value of type Object? into a value of type
  /// String? and forwards it to each instance within the [vals] iterable.
  ///
  /// [vals] the collection of [ValStr] instances.
  /// Throws an [ArgumentError] if the input value is not of type 'String?'.
  ToValObj.many(Iterable<ValStr> vals)
      : _asValObj = Rules<Object>(
          vals.map((valStr) => ToValObj(valStr).call).toList(growable: false),
        ).call;

  /// The conversion logic.
  final ValObj _asValObj;

  /// Forwards [input] as a value of type [String].
  String? call(Object? input) => _asValObj(input);
}
