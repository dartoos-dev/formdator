import 'trimmed.dart';
import 'rules.dart';
import 'type.dart';

class TrimRules {
  final Trimmed _trimmed;

  TrimRules(List<Val> vals) : _trimmed = Trimmed(Rules(vals));

  String call(String value) => _trimmed(value);
}
