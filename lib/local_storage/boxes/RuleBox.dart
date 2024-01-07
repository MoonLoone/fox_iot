import 'package:fox_iot/local_storage/models/Rule.dart';
import 'package:hive/hive.dart';

class RuleBox {
  static const String _ruleBoxName = 'rule_box';

  Future<Box<Rule>> box = Hive.openBox(_ruleBoxName);
}
