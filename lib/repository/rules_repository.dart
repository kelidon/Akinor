import 'package:Akinor/model/condition.dart';
import 'package:Akinor/model/rule.dart';
import 'package:Akinor/repository/rules_data.dart';

class RulesRepository {
  static final RulesRepository _repository = RulesRepository._internal();

  factory RulesRepository() {
    return _repository;
  }

  RulesRepository._internal();

  List<Rule> getAllRules() {
    List<Rule> rules = [];
    for(var rule in RULES_DATA){
      rules.add(Rule.fromJson(rule));
    }
    return rules;
  }

  Map<String, List<Condition>> getFinalRules(){
    var resultMap = getAllRules().where((element) => element.result.condition == "instrument").toList()..shuffle();
    return Map.fromEntries(resultMap.map((e) => MapEntry(e.result.value, e.conditions)));
  }
}
