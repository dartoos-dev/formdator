import 'cpf_strip.dart';

/// CPF Validity — it checks the validity of the provided CPF.
class CpfVal {
  /// Validates both masked and non-masked (plain) CPF values.
  CpfVal(String cpf) : this._strip(CpfStrip(cpf));

  /// Helper ctor.
  const CpfVal._strip(this._cpfStrip);

  final CpfStrip _cpfStrip;

  static const _blackList = {
    '00000000000',
    '11111111111',
    '22222222222',
    '33333333333',
    '44444444444',
    '55555555555',
    '66666666666',
    '77777777777',
    '88888888888',
    '99999999999',
  };

  /// Returs true if the given CPF is valid; false otherwise.
  bool get isOk {
    final plain = _cpfStrip.value;
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

/// The check digit of a CPF.
class _CheckDigit {
  /// The first check digit.
  const _CheckDigit.first(this._cpf) : _index = 9;

  /// The second check digit.
  const _CheckDigit.second(this._cpf) : _index = 10;

  final String _cpf;
  final int _index;

  /// The check digit as [int].
  int call() => int.parse(_cpf[_index]);
}

/// The calculated check digit of a CPF
class _CalcCheckDigit {
  const _CalcCheckDigit(this._sum);

  /// [cpf] the cpf from which the digits will be calculated.
  _CalcCheckDigit.first(String cpf) : this(_SumOfDig.first(cpf));

  /// [cpf] the cpf from which the digits will be calculated.
  _CalcCheckDigit.second(String cpf) : this(_SumOfDig.second(cpf));

  final _SumOfDig _sum;

  int call() => ((_sum() * 10) % 11) % 10;
}

/// Helper class for summing up the digits of a CPF.
class _SumOfDig {
  /// [init] the initial index.
  const _SumOfDig(this._cpf, this._init);

  /// The sum for checking the first check digit of the CPF.
  const _SumOfDig.first(String cpf) : this(cpf, 10);

  /// The sum for checking the second check digit of the CPF.
  const _SumOfDig.second(String cpf) : this(cpf, 11);

  final String _cpf;
  final int _init;

  /// Computes the sum of the [cpf] digits.
  int call() {
    int sum = 0;
    for (int i = _init; i > 1; i--) {
      sum += int.parse(_cpf[_init - i]) * i;
    }
    return sum;
  }
}
