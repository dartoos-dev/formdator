import 'package:formdator/formdator.dart';

/// Validator for mandatory input data.
///
/// It will reject null or empty input values.
///
/// **Note:** the accepted input types are String, Iterable, and Map.
class Req {
  /// Checks whether an input value is blank — that is, whether the input value
  /// is null or empty.
  ///
  /// [blank] the error message in case of a null or empty input value; the
  /// default is 'required'.
  Req({String? blank}) : this.val(const Ok(), blank: blank);

  /// Checks whether an input value is blank. If it is not blank, then the
  /// additional validation step will be performed on the input value.
  ///
  /// [val] the additional validation step.
  /// [blank] the error message in case of a null or empty input value; the
  /// default is 'required'.
  Req.val(ValObj val, {String? blank})
      : _val = val,
        _blank = blank ?? 'required';

  /// Performs the same as the [Req.val] constructor, but tries to convert the
  /// input values to '[String]?'.
  ///
  /// [val] the additional validation step.
  /// [blank] the error message in case of a null or empty input value; the
  /// default value is 'required'.
  ///
  /// Throws an [ArgumentError] if an input value is not of type 'String?'.
  Req.str(ValStr val, {String? blank}) : this.val(ToValObj(val), blank: blank);

  /// It performs the same task as the [Req.val] constructor, but for many
  /// validators at once.
  Req.many(Iterable<ValObj> vals, {String? blank})
      : this.val(Rules<Object>(vals), blank: blank);

  final String _blank;
  final ValObj _val;

  /// Valid - returns null - if [input] is neither null nor empty.
  String? call(Object? input) =>
      (input == null || _isEmpty(input)) ? _blank : _val(input);

  bool _isEmpty(Object input) {
    return (input is String && input.isEmpty) ||
        (input is Iterable && input.isEmpty) ||
        (input is Map && input.isEmpty);
  }
}
