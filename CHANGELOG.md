# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Dart Package Versioning](https://dart.dev/tools/pub/versioning).

## [unreleased]

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
