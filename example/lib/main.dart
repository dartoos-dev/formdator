import 'package:callor/callor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

/// Example app widget.
class ExampleApp extends StatelessWidget {
  /// Ctor.
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Callor Demo',
      home: Demo(title: 'Callor - Callable Validator'),
    );
  }
}

/// Demo widget.
class Demo extends StatelessWidget {
  /// Ctor.
  Demo({required String title, Key? key})
      : _title = title,
        super(key: key);

  final String _title;
  final _fkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(_title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: StatefulBuilder(
              builder: (context, state) {
                return SizedBox(
                  width: 500,
                  child: Form(
                    key: _fkey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: Trim(
                            // ignore: prefer_const_constructors
                            Req(
                              val: const Email(mal: 'malformed'),
                              blank: 'required',
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'email',
                            filled: true,
                            icon: Icon(Icons.email),
                            hintText: 'enter email',
                          ),
                        ),
                        ButtonBar(
                          children: <Widget>[
                            TextButton(
                              onPressed: () =>
                                  state(() => _fkey.currentState?.reset()),
                              child: const Text('Clear'),
                            ),
                            ElevatedButton(
                              onPressed: () => _fkey.currentState?.validate(),
                              child: const Text('Submit'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
