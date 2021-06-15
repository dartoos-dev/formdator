/// Type value validator ّ≡ T? Function(T? value).
typedef TypeVal<T> = String? Function(T?);

/// Iterable value validator ≡ Iterable? Function(Iterable? value).
typedef IterVal<I extends Iterable> = String? Function(I?);

/// Map value validator ≡ Map? Function(Map? value).
typedef MapVal<M extends Map> = String? Function(M?);

/// Numeric value validator ≡ num? Function(num? value).
typedef NumVal<N extends num> = String? Function(N?);

/// Object value validator ≡ Object? Function(Object? value).
typedef ObjVal<O extends Object> = String? Function(O?);

/// String value validator ≡ String? Function(String? value).
typedef StrVal<S extends String> = String? Function(S?);

/// DateTime value validator ≡ DateTime? Function(DateTime? value).
typedef DTVal<DT extends DateTime> = String? Function(DT?);
