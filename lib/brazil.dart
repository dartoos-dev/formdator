/// Brazil-related validators.
///
/// - Use [Cep] or [ReqCep] to validate CEP values, and [CepStrip] to remove
///   non-digit characters from masked CEPs.
/// - Use [Cpf] or [ReqCpf] to validate CPF values, and [CpfStrip] to remove
///   non-digit characters from masked CPFs.
/// - Use [Cnpj] or [ReqCnpj] to validate CNPJ values, and [CnpjStrip] to remove
///   non-digit characters from masked CNPJs.
library brazil;

export 'src/brazil/cep.dart';
export 'src/brazil/cep_strip.dart';
export 'src/brazil/cnpj.dart';
export 'src/brazil/cnpj_strip.dart';
export 'src/brazil/cpf.dart';
export 'src/brazil/cpf_strip.dart';
export 'src/brazil/req_cep.dart';
export 'src/brazil/req_cnpj.dart';
export 'src/brazil/req_cpf.dart';
