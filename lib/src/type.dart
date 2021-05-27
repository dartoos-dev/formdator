/// **Callor** - **Call**able Validat**or**.

/// According to the Flutter form standards, a validator must return the null
/// value to indicate that an input is **valid**. On the other hand, to indicate an
/// **invalid** input, a validator must return a message, which in turn will be
/// displayed to the user by the field with wrong data.
typedef Callor = String? Function(String? value);
