# formdator

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
[![CodeFactor Grade](https://img.shields.io/codefactor/grade/github/rafamizes/formdator)](https://www.codefactor.io/repository/github/rafamizes/formdator)
[![style: lint](https://img.shields.io/badge/style-lint-4BC0F5.svg)](https://pub.dev/packages/lint)
[![Hits-of-Code](https://hitsofcode.com/github/dartoos-dev/formdator?branch=master)](https://hitsofcode.com/github/dartoos-dev/formdator/view?branch=master)

## Contents

- [Overview](#overview)
- [Getting Started](#getting-started)
- [List of Validators](#list-of-validators)
- [Demo Application](#demo-application)
- [References](#references)

## Overview

**Form**idable Vali**dator** — Formdator is a fully object-oriented package for
validating Flutter form fields. Its key benefits, compared to all other similar
packages, include:

- An object-oriented mindset: the elements for validation are **immutable**,
  flexible objects that can be combined in various configurations.
- Classes with short - yet meaningful - names like `Req` for a required field;
  `ReqEmail` for a non-empty, well-formed email; `Len.max` for a maximum number
  of characters; and so on.
- Easy-to-compose validators: the command `Trim(Email())` produces a validator
  that trims the entered email before validating it.
- A built-in set of ready-to-use compound validators: if you need to
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
`Email` validators to create a kind of _'required-max-50-chars-email'_
constraint.

```dart
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: Rules<String>([
        Req(),
        Len.max(50),
        Email(),
      ]),
      keyboardType: TextInputType.emailAddress,
    );
  }
```

Or — even better — use the compound validator `ReqEmail` to perform the same
task.

```dart
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: ReqEmail.len(50),
      keyboardType: TextInputType.emailAddress,
    );
  }
```

The shorter command `ReqEmail.len(50)` is equivalent to the much longer command
`Rules<String>([Req(), Len.max(50), Email()])`.

## List of validators

For a complete list of validators or more detailed information about any
validator (constructors, parameters, examples, etc.):

[formdator-doc](https://pub.dev/documentation/formdator/latest/formdator/formdator-library.html)

## Demo application

The demo application provides a fully working example, focused on demonstrating
exactly four validators in action — _Pair, ReqLen, ReqEmail, and Equal_. You can
take the code in this demo and experiment with it.

To run the demo application:

```shell
git clone https://github.com/dartoos-dev/formdator.git
cd formdator/example/
flutter run -d chrome
```

This should launch the demo application on Chrome in debug mode.

![formdator-demo-app](https://user-images.githubusercontent.com/24878574/126716646-07cb5d58-f8da-4030-a829-2038946b5941.png)

## References

- [Dart Callable classes](https://dart.dev/guides/language/language-tour#callable-classes)
- [TextFormField](https://api.flutter.dev/flutter/material/TextFormField-class.html)
- [build a Flutter form](https://flutter.dev/docs/cookbook/forms/validation)
- [Mozilla input types](https://developer.mozilla.org/en-US/docs/Learn/Forms/HTML5_input_types)
- [brazilian form masks](http://opensource.locaweb.com.br/locawebstyle-v2/manual/formularios/mascaras-forms/)
