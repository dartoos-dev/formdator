/// Set of validator types.

/// Generic validator.
///
/// Function signature: String? Function(T?)
typedef ValType<T> = String? Function(T? t);

/// Validator for [Iterable] input data.
///
/// Function signature: String? Function(Iterable?)
typedef ValIter = String? Function(Iterable? i);

/// Validator for [Map] input data.
///
/// Function signature: String? Function(Map?)
typedef ValMap = String? Function(Map? m);

/// Validator for [num] input data.
///
/// Function signature: String? Function(num?)
typedef ValNum = String? Function(num? n);

/// Validator for non-specific input data.
///
/// Function signature: String? Function(Object?)
typedef ValObj = String? Function(Object? o);

/// Validator for [String] input data.
///
/// Function signature: String? Function(String?)
typedef ValStr = String? Function(String? s);

/// Validator for [DateTime] input data.
///
/// Function signature: String? Function(DateTime?)
typedef ValDT = String? Function(DateTime? dt);
