## formdator

<img
src="https://user-images.githubusercontent.com/24878574/119563254-b2027800-bd7d-11eb-990f-e5602a0d77b7.png"
alt="EO-Color logo" width="101" height="48"/>

[![EO principles respected here](https://www.elegantobjects.org/badge.svg)](https://www.elegantobjects.org)
[![DevOps By Rultor.com](https://www.rultor.com/b/dartoos-dev/formdator)](https://www.rultor.com/p/dartoos-dev/formdator)

[![pub](https://img.shields.io/pub/v/formdator)](https://pub.dev/packages/formdator)
[![license](https://img.shields.io/badge/license-mit-green.svg)](https://github.com/dartoos-dev/formdator/blob/master/LICENSE)
[![style: lint](https://img.shields.io/badge/style-lint-4BC0F5.svg)](https://pub.dev/packages/lint)
[![PDD status](https://www.0pdd.com/svg?name=dartoos-dev/formdator)](https://www.0pdd.com/p?name=dartoos-dev/formdator)
[![build](https://github.com/dartoos-dev/formdator/actions/workflows/build.yml/badge.svg)](https://github.com/dartoos-dev/formdator/actions/)
[![codecov](https://codecov.io/gh/dartoos-dev/formdator/branch/master/graph/badge.svg?token=jYfO55O22s)](https://codecov.io/gh/dartoos-dev/formdator)
[![Hits-of-Code](https://hitsofcode.com/github/dartoos-dev/formdator?branch=master)](https://hitsofcode.com/github/dartoos-dev/formdator/view?branch=master)

**Form**idable Vali**dator** — Formdator is a fully object-oriented package for
validating form fields before they get processed. Its key benefits, compared to
all other similar packages, include:

- Object-oriented mindset: there is no static functions, only trustworthy
  **immutable** objects.
- Easy-to-compose validators, e.g.: `Trim(ReqEmail())` for a
  "trimmed-required-email", it trims the entered email before trying to validate
  it.
- You can apply multiple validation rules at once — `Rules` class.
- Classes with short — yet meaningful — names like `Req` for a required
  (non-blank) field; `ReqEmail` for a non-blank and well-formed email; `MinLen`
  for a minimum number of characters.
- No complex class hierarchy: each validator only implements the Dart's built-in
  `call()` method.

For easier integration with the fields of a Flutter form, each validator
implements the `call()` method; therefore, any validator can be treated as an
ordinary function.

## Getting Started

A flexible package provides components that can be selected and grouped in
various combinations so that user requirements can be fulfilled.

As a demonstration of such combinations of components, the code below shows how
you can easily group `Trim` and `Email` to form a trimmed-email field with a
custom error message in case of a malformed email.

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
exactly four validators in action — Rules, ReqEmail and Equal. You can take
the code in this demo and experiment with it.

To run the demo application:

```shell
git clone https://github.com/dartoos-dev/formdator.git
cd formdator/example/
flutter run -d chrome
```

This should launch the demo application on Chrome in debug mode.

![formdator_demo_app](https://user-images.githubusercontent.com/24878574/122138029-49f2ff00-ce1c-11eb-9fe4-8c9bde2ce25e.png)
