import 'package:formdator/brazil.dart';

/// CNPJ Validity — it checks the validity of the provided CNPJ.
class CnpjVal {
  /// Validates both masked and non-masked (plain) CNPJ values.
  CnpjVal(String cnpj) : this._strip(CnpjStrip(cnpj));

  /// Helper ctor.
  const CnpjVal._strip(this._cnpjStrip);

  final CnpjStrip _cnpjStrip;

  static const _blackList = {
    '00000000000000',
    '11111111111111',
    '22222222222222',
    '33333333333333',
    '44444444444444',
    '55555555555555',
    '66666666666666',
    '77777777777777',
    '88888888888888',
    '99999999999999',
  };

  /// Returs true if the given CNPJ is valid; false otherwise.
  bool get isOk {
    final plain = _cnpjStrip.value;
    if (plain == null) return false;
    if (_blackList.contains(plain)) return false;

    final check1st = _CheckDigit.first(plain);
    final calcCheck1st = _CalcCheckDigit.first(plain);
    if (check1st() != calcCheck1st()) return false;

    final check2nd = _CheckDigit.second(plain);
    final calcCheck2nd = _CalcCheckDigit.second(plain);
    return check2nd() == calcCheck2nd();
  }
}

/// The check digit of a CNPJ.
class _CheckDigit {
  /// The first check digit.
  const _CheckDigit.first(this._cpf) : _index = 12;

  /// The second check digit.
  const _CheckDigit.second(this._cpf) : _index = 13;

  final String _cpf;
  final int _index;

  /// The check digit as [int].
  int call() => int.parse(_cpf[_index]);
}

/// The calculated check digit of a CNPJ
class _CalcCheckDigit {
  const _CalcCheckDigit(this._sum);

  /// [cpf] the cpf from which the digits will be calculated.
  _CalcCheckDigit.first(String cpf) : this(_SumOfDig.first(cpf));

  /// [cpf] the cpf from which the digits will be calculated.
  _CalcCheckDigit.second(String cpf) : this(_SumOfDig.second(cpf));

  final _SumOfDig _sum;

  int call() {
    final check = 11 - _sum() % 11;
    return check >= 10 ? 0 : check;
  }
}

/// Conveniently overloads the [] operator.
class _CnpjDigits {
  /// Main ctor.
  const _CnpjDigits(this._cnpj);

  final String _cnpj;

  /// The digit at [i].
  int operator [](int i) => int.parse(_cnpj[i]);
}

/// Helper class for summing up the digits of a CNPJ.
///
/// [reference](https://pt.wikipedia.org/wiki/Cadastro_Nacional_da_Pessoa_Jur%C3%ADdica)
class _SumOfDig {
  /// Main ctor.
  _SumOfDig(this._cnpjSum);

  /// The sum for checking the first check digit of the CNPJ.
  _SumOfDig.first(String cnpjStr)
      : this(() {
          final cnpj = _CnpjDigits(cnpjStr);
          int check = 5 * cnpj[0] + 4 * cnpj[1] + 3 * cnpj[2] + 2 * cnpj[3];
          check += 9 * cnpj[4] + 8 * cnpj[5] + 7 * cnpj[6] + 6 * cnpj[7];
          check += 5 * cnpj[8] + 4 * cnpj[9] + 3 * cnpj[10] + 2 * cnpj[11];
          return check;
        });

  /// The sum for checking the second check digit of the CNPJ.
  _SumOfDig.second(String cnpjStr)
      : this(() {
          final cnpj = _CnpjDigits(cnpjStr);
          int check = 6 * cnpj[0] + 5 * cnpj[1] + 4 * cnpj[2] + 3 * cnpj[3];
          check += 2 * cnpj[4] + 9 * cnpj[5] + 8 * cnpj[6] + 7 * cnpj[7];
          check += 6 * cnpj[8] + 5 * cnpj[9] + 4 * cnpj[10] + 3 * cnpj[11];
          check += 2 * cnpj[12];
          return check;
        });

  final int Function() _cnpjSum;

  /// Calculates the sum of the cnpj digits according to the formula.
  int call() => _cnpjSum();
}
