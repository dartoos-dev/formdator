/// Generic validator.
///
/// Function signature: String? Function(T?)
typedef ValType<T> = String? Function(T?);

/// Validator for [Iterable] input data.
///
/// Function signature: String? Function(Iterable?)
typedef ValIter<I extends Iterable> = String? Function(I?);

/// Validator for [Map] input data.
///
/// Function signature: String? Function(Map?)
typedef ValMap<M extends Map> = String? Function(M?);

/// Validator for [num] input data.
///
/// Function signature: String? Function(num?)
typedef ValNum<N extends num> = String? Function(N?);

/// Validator for non-specific type input data.
///
/// Function signature: String? Function(Object?)
typedef ValObj<O extends Object> = String? Function(O?);

/// Validator for [String] input data.
///
/// Function signature: String? Function(String?)
typedef ValStr<S extends String> = String? Function(S?);

/// Validator for [DateTime] input data.
///
/// Function signature: String? Function(DateTime?)
typedef ValDT<DT extends DateTime> = String? Function(DT?);
