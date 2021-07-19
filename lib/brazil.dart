/// Brazil-related validators and utility classes.
///
/// - The validators [Cep] and [ReqCep] to validate optional and mandatory CEPs,
///   plus the [CepStrip] class to remove non-digit values from masked CEPs.
/// - The [Cpf] validator to validate optional CPFs, plus the CpfStrip class to
///   remove non-digit values from masked CPFs.
/// - The [Cnpj] validator to validate optional CNPJs, plus the CnpjStrip class to
///   remove non-digit values from masked CNPJs.
library brazil;

export 'src/brazil/cep.dart';
export 'src/brazil/cep_strip.dart';
export 'src/brazil/cnpj.dart';
export 'src/brazil/cnpj_strip.dart';
export 'src/brazil/cpf.dart';
export 'src/brazil/cpf_strip.dart';
export 'src/brazil/req_cep.dart';
