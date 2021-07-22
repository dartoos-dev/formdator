/// Validators related to Brazil and utility classes.
///
/// - Use the [Cep] class to validate optional CEPs, the [ReqCep] class to
///   validate required CEPs, and the [CepStrip] class to remove non-digit
///   characters from masked CEPs.
/// - Use the [Cpf] class to validate optional CPFs, the [ReqCpf] class to
///   validate required CPFs, and the [CpfStrip] class to remove non-digit
///   characters from masked CPFs.
/// - Use the [Cnpj] class to validate optional CNPJs, the [ReqCnpj] class to
///   validate required CNPJs, and the [CnpjStrip] class to remove non-digit
///   characters from masked CPFs.
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
