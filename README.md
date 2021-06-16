## callor

<img
src="https://user-images.githubusercontent.com/24878574/119563254-b2027800-bd7d-11eb-990f-e5602a0d77b7.png"
alt="EO-Color logo" width="101" height="48"/>

[![EO principles respected here](https://www.elegantobjects.org/badge.svg)](https://www.elegantobjects.org)
[![DevOps By Rultor.com](https://www.rultor.com/b/dartoos-dev/callor)](https://www.rultor.com/p/dartoos-dev/callor)

[![pub](https://img.shields.io/pub/v/callor)](https://pub.dev/packages/callor)
[![license](https://img.shields.io/badge/license-mit-green.svg)](https://github.com/dartoos-dev/callor/blob/master/LICENSE)
[![style: lint](https://img.shields.io/badge/style-lint-4BC0F5.svg)](https://pub.dev/packages/lint)
[![PDD status](https://www.0pdd.com/svg?name=dartoos-dev/callor)](https://www.0pdd.com/p?name=dartoos-dev/callor)
[![build](https://github.com/dartoos-dev/callor/actions/workflows/build.yml/badge.svg)](https://github.com/dartoos-dev/callor/actions/)
[![codecov](https://codecov.io/gh/dartoos-dev/callor/branch/master/graph/badge.svg?token=jYfO55O22s)](https://codecov.io/gh/dartoos-dev/callor)
[![Hits-of-Code](https://hitsofcode.com/github/dartoos-dev/callor?branch=master)](https://hitsofcode.com/github/dartoos-dev/callor/view?branch=master)

**Call**able Validat**or** - Callor is a fully object-oriented package for
validating form fields before they get processed. Its key benefits, compared to
all other similar packages, include:

- Object-oriented mindset: no static functions; only trustworthy **immutable**
  objects.
- Easy-to-compose validators. E.g., for a "trimmed-required-email":
  `Trim(ReqEmail(blank:'required field', mal:'malformed email'))`.
- You can compose your own multi-rule validation logic - via the `Rules` class.
- Classes with short - yet meaningful - names. E.g: `Req` for a
  required (non-blank) field; `ReqEmail` for a non-blank, well-formed email;
  `MinLen` for a minimum number of characters.
- No complex class hierarchy: the validator classes just implement the
  Dart's built-in `call()` method.

For easier integration with the fields of a Flutter form, each validator
implements the `call()` method; therefore, any validator can be treated as if it
were an ordinary function.

Classes that implement the `call()` method are collectively known as
_Callable classes_; that's the reason for the name "Callor": **Call**able
Validat**or** :-).

## Getting Started

A flexible package provides components that can be selected and grouped in
various combinations so that user requirements can be fulfilled. The code below
shows how you can easily group `Trim` and `Email` to form a trimmed-email field:

```dart
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: _onSaved,
      validator: Trim(Email(mal: 'malformed email.')),
      keyboardType: TextInputType.emailAddress,
    );
  }
```

### Demo application

The demo application provides a fully working example, focused on demonstrating
exactly four validators in action - Rules, Req, Email, and Equal. You can take
the code in this demo and experiment with it.

To run the demo application:

```shell
git clone https://github.com/dartoos-dev/callor.git
cd callor/example/
flutter run -d chrome
```

This should launch the demo application on Chrome in debug mode.

![callor_demo_app](https://user-images.githubusercontent.com/24878574/122138029-49f2ff00-ce1c-11eb-9fe4-8c9bde2ce25e.png)
