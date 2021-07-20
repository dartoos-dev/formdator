## formdator

<img
src="https://user-images.githubusercontent.com/24878574/119563254-b2027800-bd7d-11eb-990f-e5602a0d77b7.png"
alt="EO-Color logo" width="101" height="48"/>

[![EO principles respected here](https://www.elegantobjects.org/badge.svg)](https://www.elegantobjects.org)
[![DevOps By Rultor.com](https://www.rultor.com/b/dartoos-dev/formdator)](https://www.rultor.com/p/dartoos-dev/formdator)

[![pub](https://img.shields.io/pub/v/formdator)](https://pub.dev/packages/formdator)
[![license](https://img.shields.io/badge/license-mit-green.svg)](https://github.com/dartoos-dev/formdator/blob/master/LICENSE)
[![PDD status](https://www.0pdd.com/svg?name=dartoos-dev/formdator)](https://www.0pdd.com/p?name=dartoos-dev/formdator)

[![build](https://github.com/dartoos-dev/formdator/actions/workflows/build.yml/badge.svg)](https://github.com/dartoos-dev/formdator/actions/)
[![codecov](https://codecov.io/gh/dartoos-dev/formdator/branch/master/graph/badge.svg?token=jYfO55O22s)](https://codecov.io/gh/dartoos-dev/formdator)
[![CodeFactor](https://www.codefactor.io/repository/github/rafamizes/formdator/badge)](https://www.codefactor.io/repository/github/rafamizes/formdator)
[![Hits-of-Code](https://hitsofcode.com/github/dartoos-dev/formdator?branch=master)](https://hitsofcode.com/github/dartoos-dev/formdator/view?branch=master)
[![style: lint](https://img.shields.io/badge/style-lint-4BC0F5.svg)](https://pub.dev/packages/lint)

**Form**idable Vali**dator** — Formdator is a fully object-oriented package for
validating Flutter form fields. Its key benefits, compared to all other similar
packages, include:

- Object-oriented mindset: there is no static functions, only trustworthy
  **immutable** objects.
- Classes with short — yet meaningful — names like `Req` for a required
  (non-blank) field; `ReqEmail` for a non-blank and well-formed email; `Len.min`
  for a minimum number of characters; and so on.
- Easy-to-compose validators, e.g., `Trim(Email())` produces a validator that
  trims the entered email before validating it.
- Contains a built-in set of ready-to-use compound validators: if you need to
  validate an email and limit its length to, say, 50 chars, simply pass an
  `Email.len(50)` or `ReqEmail.len(50)` object as the validation argument.
- You can apply multiple validation rules at once by using the `Pair` or `Rules`
  classes.

For easier integration with Flutter form fields, each validator implements the
`call()` method so that any validator object can be called like a function —
Callable classes.

## Getting Started

A flexible package provides components that can be selected and grouped in
various combinations so that user requirements can be fulfilled.

The code below shows how you can easily group the `Rules`, `Req`, `Len`, and
`Email` validators to form a 'trimmed-required-max-50-chars-email' constraint.

```dart
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: _onSaved,
      validator: Rules<String>([
        Req(),
        Len.max(50),
        Email(),
      ]),
      keyboardType: TextInputType.emailAddress,
    );
  }
```

Or — even better — if the compound validator `ReqEmail` is used to perform the
same task.

```dart
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: _onSaved,
      validator: ReqEmail.len(50),
      keyboardType: TextInputType.emailAddress,
    );
  }
```

The shorter command `ReqEmail.len(50)` is equivalent to the much longer command
`Rules<String>([Req(), Len.max(50), Email()])`.

### Demo application

The demo application provides a fully working example, focused on demonstrating
exactly four validators in action — Pair, ReqLen, ReqEmail, and Equal. You can
take the code in this demo and experiment with it.

To run the demo application:

```shell
git clone https://github.com/dartoos-dev/formdator.git
cd formdator/example/
flutter run -d chrome
```

This should launch the demo application on Chrome in debug mode.

![formdator_demo_app](https://user-images.githubusercontent.com/24878574/122138029-49f2ff00-ce1c-11eb-9fe4-8c9bde2ce25e.png)
