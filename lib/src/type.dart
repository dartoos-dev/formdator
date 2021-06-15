/// **Callor** - **Call**able Validat**or**.

/// According to the Flutter form standards, a validator must return the null
/// value to indicate that an input is **valid**. On the other hand, to indicate
/// a **valid** input, a validator must return a message, which in turn will be
/// displayed to the user by the field with wrong data.

/// String value validator.
typedef StrVal = String? Function(String? value);
