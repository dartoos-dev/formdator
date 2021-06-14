import 'package:callor/callor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DemoApp());
}

/// Demo purposes app widget.
///
/// The widget displays a simple registration form in which the user enters an
/// email, password and password confirmation.
class DemoApp extends StatelessWidget {
  /// Ctor.
  const DemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple form demo',
      home: SafeArea(
        child: RegForm(
          title: 'Enter an email, password and password confirmation',
        ),
      ),
    );
  }
}

/// A simple registration form widget.
class RegForm extends StatelessWidget {
  /// Ctor.
  RegForm({required String title, Key? key})
      : _title = title,
        super(key: key);

  final String _title;
  // the input data.
  final Map<String, dynamic> _data = {};
  // the form's mandatory key.
  final _fkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(_title),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: 500,
            child: Form(
              key: _fkey,
              child: Column(
                children: [
                  EmailField(onSaved: _saveEmail),
                  SecretField(
                    label: 'Password',
                    onChanged: _refreshPass,
                  ),
                  SecretField(
                    label: 'Confirm password',
                    onChanged: _refreshConfirm,
                    onSaved: _savePass,
                    extra: Equal(_enteredPass, diff: 'does not match.'),
                  ),
                  ClearSubmitBar(fkey: _fkey, data: _data),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// The current entered password value.
  String _enteredPass() => (_data['pass'] as String?) ?? '';

  /// Refreshes the password value.
  void _refreshPass(String value) => _data['pass'] = value;

  /// Refreshes the password confirmation value.
  void _refreshConfirm(String value) => _data['confirm'] = value;

  void _saveEmail(String? email) {
    if (email != null && email.isNotEmpty) {
      _data['email'] = email;
    }
  }

  void _savePass(String? pass) {
    if (pass != null && pass.isNotEmpty) {
      _data['pass'] = pass;
    }
  }
}

/// Callback form onChange event.
typedef OnChanged = void Function(String);

/// Callback for onSave event.
typedef OnSaved = void Function(String?);

/// Convenient form field for sensitive data.
class SecretField extends StatelessWidget {
  /// A form field suitable for entering sensitive data.
  ///
  /// [label] descriptive text for the field.
  /// [onChange] callback for data chage event.
  /// [onSaved] callback for data saved event.
  /// [extra] an optional extra validation step.
  SecretField({
    required String label,
    OnChanged? onChanged,
    OnSaved? onSaved,
    Callor? extra,
    Key? key,
  })  : _label = label,
        _onChanged = onChanged,
        _onSaved = onSaved,
        _extra = extra ?? const Ok().call, // dummy validator as default
        super(key: key);

  final String _label;
  final OnChanged? _onChanged;
  final OnSaved? _onSaved;
  final Callor _extra;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: _onSaved,
      onChanged: _onChanged,
      validator: Rules([
        const Req(blank: 'cannot be blank.'),
        const MinLen(4, short: 'too short; min length is 4.'),
        const MaxLen(8, long: 'too long; max length is 8.'),
        _extra,
      ]),
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: _label,
        filled: true,
        icon: const Icon(Icons.password),
        hintText: 'between 4 and 8 characters',
      ),
    );
  }
}

/// Email field widget - ensures a trimmed non-blank well-formed email value.
class EmailField extends StatelessWidget {
  /// Non-blank well-formed email with an optional [extra] validation step.
  ///
  /// [onSaved] callback for email saved event.
  EmailField({OnSaved? onSaved, Callor? extra, Key? key})
      : _onSaved = onSaved,
        _extra = extra ?? const Ok().call, // defaults to dummy validator.
        super(key: key);

  final OnSaved? _onSaved;
  final Callor _extra;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: _onSaved,
      validator: Rules([
        // ignore: prefer_const_constructors
        Trim(const Req(blank: 'required.')),
        const Email(mal: 'malformed.'),
        _extra,
      ]),
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email',
        filled: true,
        icon: Icon(Icons.email),
        hintText: 'anuser@aprovider.com',
      ),
    );
  }
}

/// Row with convenient clear and submit buttons.
class ClearSubmitBar extends StatelessWidget {
  /// Encapsulates the form state.
  const ClearSubmitBar({
    required GlobalKey<FormState> fkey,
    required Map<String, dynamic> data,
    Key? key,
  })  : _fkey = fkey,
        _data = data,
        super(key: key);

  final GlobalKey<FormState> _fkey;
  final Map<String, dynamic> _data;

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: <Widget>[
        TextButton(
          onPressed: () {
            _data.clear();
            _fkey.currentState?.reset();
          },
          child: const Text('Clear'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_fkey.currentState?.validate() ?? false) {
              _fkey.currentState?.save();
              _showDialog(context);
            }
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }

  void _showDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Success'),
        content: const Text('Your information has been submitted.'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Ok'),
            child: const Text('Thanks'),
          ),
        ],
      ),
    );
  }
}
