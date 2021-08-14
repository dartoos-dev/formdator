/// Brazil-related validators.
///
/// - Use [BrPhone] or [ReqBrPhone] to validate Brazilian landline telephone
///   numbers; [BrPhoneStrip] to remove non-digit characters from masked numbers.
/// - Use [Cep] or [ReqCep] to validate CEP values; [CepStrip] to remove
///   non-digit characters from masked CEPs.
/// - Use [CpfVal], [ReqCpf] or [Cpf] to validate CPF values; [CpfStrip] to
///   remove non-digit characters from masked CPFs.
/// - Use [CnpjVal],  [ReqCnpj] or [Cnpj] to validate CNPJ values; [CnpjStrip] to
///   remove non-digit characters from masked CNPJs.
library brazil;

export 'src/brazil/br_mobile.dart';
export 'src/brazil/br_mobile_strip.dart';
export 'src/brazil/br_phone.dart';
export 'src/brazil/br_phone_strip.dart';
export 'src/brazil/cep.dart';
export 'src/brazil/cep_strip.dart';
export 'src/brazil/cnpj.dart';
export 'src/brazil/cnpj_strip.dart';
export 'src/brazil/cnpj_val.dart';
export 'src/brazil/cpf.dart';
export 'src/brazil/cpf_strip.dart';
export 'src/brazil/cpf_val.dart';
export 'src/brazil/req_cep.dart';
export 'src/brazil/req_cnpj.dart';
export 'src/brazil/req_cpf.dart';
