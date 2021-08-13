# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Dart Package Versioning](https://dart.dev/tools/pub/versioning).

## [Unreleased]

### Added

- BrPhone class to validate both masked and unmasked Brazilian landline numbers
  — [108](https://github.com/dartoos-dev/formdator/issues/108).

## [0.10.0] - 2021-08-10

### Changed

- rename the parameter "non" to "mal" in classes that use it —
  [122](https://github.com/dartoos-dev/formdator/issues/122) **BREAKING
  CHANGE**.
- turn this package into a dependency-free package; it doesn't even depend on
  the Flutter SDK — [120](https://github.com/dartoos-dev/formdator/issues/120).

## [0.9.0] - 2021-08-10

### Added

- Integer Constraint Validators, Int and ReqInt —
  [113](https://github.com/dartoos-dev/formdator/issues/113).
- Num.pos (numbers >= 0) and Num.neg (numbers < 0) constructors —
  [117](https://github.com/dartoos-dev/formdator/issues/117).

### Changed

- stricter lint rules
  [111](https://github.com/dartoos-dev/formdator/issues/111).
- rename the error message of Num and ReqNum from "nan" to "non" —
  [115](https://github.com/dartoos-dev/formdator/issues/115) **BREAKING
  CHANGE**.

## [0.8.2] - 2021-07-30

### Changed

- drop the dependency on the "cpf_cnpj_validator" package —
  [104](https://github.com/dartoos-dev/formdator/issues/104).

## [0.8.1] - 2021-07-26

### Added

- Hex and ReqHex for validating hexadecimal input values
  [93](https://github.com/dartoos-dev/formdator/issues/93).
- Match and ReqMatch for string pattern validations —
  [94](https://github.com/dartoos-dev/formdator/issues/94).

## [0.8.0] - 2021-07-23

### Changed

- Reorganization of the validator categories —
  [92](https://github.com/dartoos-dev/formdator/issues/92) **BREAKING CHANGES**.

## [0.7.3] - 2021-07-23

### Changed

- Some improvements to the README's content —
  [89](https://github.com/dartoos-dev/formdator/issues/89).

## [0.7.2] - 2021-07-22

### Added

- 'ReqCnpj' which is the composition between the validators 'Req' and 'Cnpj' —
  [65](https://github.com/dartoos-dev/formdator/issues/65).
- 'ReqCpf' which is the composition between the validators 'Req' and 'Cpf' —
  [65](https://github.com/dartoos-dev/formdator/issues/66).

### Changed

- better README content —
  [86](https://github.com/dartoos-dev/formdator/issues/86).

## [0.7.1] - 2021-07-21

### Added

- 'ReqDigit' which is the composition between the validators 'Req' and 'Digit' —
  [64](https://github.com/dartoos-dev/formdator/issues/64).
- 'ReqNum' which is the composition between the validators 'Req' and 'Num' —
  [66](https://github.com/dartoos-dev/formdator/issues/66).

### Changed

- more elaborate content in the README file.

## [0.7.0] - 2021-07-20

### Added

- 'Digit.len', 'Digit.min', 'Digit.max', and 'Digit.range' constructors —
  [63](https://github.com/dartoos-dev/formdator/issues/63).
- 'Cep' and 'ReqCep' validators along with the 'CepStrip' utility class —
  [71](https://github.com/dartoos-dev/formdator/issues/71).
- 'ReqLen' class — [62](https://github.com/dartoos-dev/formdator/issues/62).

### Changed

- The 'Digit' constructor is no longer const — **BREAKING CHANGE**.
- The name of Len's parameters. The 'short' param. was renamed to
  'less'; the 'long' param., to 'great'. **BREAKING CHANGE**.
- Len's default error messages —
  [69](https://github.com/dartoos-dev/formdator/issues/69).
- Refactoring of classes CnpjStrip, CpfStrip, and CepStrip —
  [73](https://github.com/dartoos-dev/formdator/issues/73).
- Optimization of the Pair aggregator —
  [75](https://github.com/dartoos-dev/formdator/issues/75) **BREAKING CHANGES**.

### Removed

- Superfluous constructos —
  [78](https://github.com/dartoos-dev/formdator/issues/78) **BREAKING CHANGES**.

## [0.6.0] - 2021-07-15

### Changed

- 'Req' validator accept an additional validation step as a parameter —
  [56](https://github.com/dartoos-dev/formdator/issues/56).
- 'Req' validator constructors are no longer const — **BREAKING CHANGE**.

### Added

- 'Pair' validator that groups two validators as if they were only one.
- 'ToValObj' adapter that restricts the input data type to String.
- 'ReqEmail.len' constructor —
  [60](https://github.com/dartoos-dev/formdator/issues/60).

## [0.5.1] - 2021-07-08

### Added

- the 'len' named constructor to the Email validator class —
  [53](https://github.com/dartoos-dev/formdator/issues/53).

## [0.5.0] - 2021-07-06

### Changed

- Update the validators error message type to 'String?' —
  [43](https://github.com/dartoos-dev/formdator/issues/43) **BREAKING CHANGES**.
- Rename the validator types aliases —
  [49](https://github.com/dartoos-dev/formdator/issues/49) **BREAKING CHANGES**.
- Len class refactoring —
  [47](https://github.com/dartoos-dev/formdator/issues/47) **BREAKING CHANGES**.
- Num class refactoring —
  [45](https://github.com/dartoos-dev/formdator/issues/45) **BREAKING CHANGES**.

## [0.4.1] - 2021-07-02

### Added

- Num class for number relating validation —
  [35](https://github.com/dartoos-dev/formdator/issues/35).

## [0.4.0] - 2021-07-01

### Added

- Len class for field length validation —
  [34](https://github.com/dartoos-dev/formdator/issues/34).

### Changed

- move all functionality from the MaxLen and MinLen classes to Len the class.

### Removed

- MaxLen and MinLen classes — **BREAKING CHANGE**.

## [0.3.1] - 2021-06-19

### Added

- _ReqEmail_ class — Convenient validator for required email fields -
  [28](https://github.com/dartoos-dev/formdator/issues/28).

### Changed

- shorter package description.

## [0.3.0] - 2021-06-16

### Changed - BREAKING

- rename this package to formdator - Formidable form validator.

## [0.2.1] - 2021-06-16

### Fixed

- create section 0.2.0 in this CHANGELOG.

## [0.2.0] - 2021-06-16

### Added

- Demo app as an example of how to use this package effectively.
- unit tests so that each validator is fully covered by tests.
- Brazil-related classes:
  - **Cpf validator:** _"Cadastro da Pessoa Física"_, kind of brazilian SSN - Social
    Security Number.
  - **CpfStripped:** helper class that removes from a properly masked CPF
    field the two dots '.' and the dash '-'.
  - **Cnpj validator:** _"Cadastro Nacional de Pessoa Jurídica"_, kind of _"National
    Registry of Legal Entities"_.
  - **CnpjStripped:** helper class that removes from a properly masked CNPJ the
    two dots '.', the slash '/', and the dash '-'.

### Changed - BREAKING

- add an optional extra step validation parameter to Req -
  [17](https://github.com/dartoos-dev/callor/pull/17)
- classes renaming - [13](https://github.com/dartoos-dev/callor/pull/13)
- lint as the linter tool - [10](https://github.com/dartoos-dev/callor/pull/10)
- null-safety migration - [11](https://github.com/dartoos-dev/callor/pull/11)
- huge refactoring.
- rearrangement in directories structure.

### Removed - BREAKING

- OkDt and any other DateTime-related validator.
- The validator classes:
  - ReqCnpj, ReqCpf, ReqDigit, ReqEmail, TrimReq, TrimReq, TrimReqCpf,
    TrimReqEmail, TrimRules.

## [0.1.3] - 2020-23-01

### Added

- OkDt -- DateTime validator that always validates the incoming datetime value.

## [0.1.2] - 2020-22-01

### Added

- ReqNum (Required Numeric) convenience validator.

### Fixed

- Removed unused import from ReqEmail class.

## [0.1.1] - 2020-22-01

### Changed

- Equal validator has a "to" method in addition to overloading the "call" operator.

## [0.1.0] - 2020-22-01

### Changed

- Equal validator message parameter name to "diff".

### Fixed

- Equal validator bug.

## [0.0.4] - 2020-22-01

### Added

- "Tautological" Ok validator -- it always validates the incoming value.
- Required DateTime validator.
- Wellformed DateTime validator.
- Multiple rules DateTime validator.

## [0.0.3] - 2020-04-01

### Added

- Trimmer validators -- validators that trims the value before validating it.
- Set of required and well formed special case classes.

### Changed

- Equal validator code reformatted.
- Equal validator docoment comments enhanced.

### Fixed

- Created the "unreleased" section to this CHANGELOG file.

## [0.0.2] - 2019-12-23

### Added

- Cpf(Cadastro da Pessoa Física) validator -- Brazil's version of ssn (Social Security Number).
- Cnpj(Cadastro Nacional da Pessoa Jurídica) validator -- brazilian National Registry of Legal Entities.

## [0.0.1] - 2019-12-23

### Added

- Required validator -- for mandatory fields.
- Rules validator -- applies multiple validity rules.
- Email validator -- checks whether the email is well formed.
- MinLength validator -- mininum number of characteres.
- MaxLength validator -- maximum number of characteres.
- Numberic validator -- for digit only fields.
- Equal validator -- ensures equality with a given value.
