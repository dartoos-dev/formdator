/// Represents a callable Flutter form field validator.

/// According to the Flutter form standards, a field validator
/// must return a descriptive String message to indicate that the
/// given value is valid; null otherwise.
typedef Val = String? Function(String? value);

/// DateTime validator
typedef DtValidator = String? Function(DateTime?);
