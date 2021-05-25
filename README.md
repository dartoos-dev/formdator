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
- Classes with short - yet meaningful - names. Ex: ```Req``` for a
  required(non-blank) field; ```ReqEmail``` for a non-blank, well-formed email;
  ```MinLen``` for a minimum number of characters; ```Equal``` for equality
  rules; and so on.
- No complex class hierarchy: the validator classes just implement the
  Dart's built-in ```call()``` method.
- Ready-to-use compound validators such as the ```TrimReqEmail``` class, which,
  in turn, trims the email before checking whether it is blank or malformed.
- You can compose your own multi rules validator - using the ```Rules``` class.

For easier integration with the fields of a Flutter form, the validator classes
implement the ```call()``` method; therefore, any validator object can be called
like a function.

Classes that implement the ```call()``` method are colectively known as
_Callable classes_; that's the reason for the name "Callor": **Call**able
Validat**or** :-).

## Getting Started

A composable package should provide components that can be selected and grouped
in various combinations so that user requirements can be fulfilled.

<!-- @todo #6 Insert usage examples -->
