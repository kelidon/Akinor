import 'package:Akinor/model/condition.dart';

enum Status { TRUE, FALSE, INDEFINITE }

class Rule {
  List<Condition> conditions;
  Condition result;

  Rule({this.conditions, this.result});

  Rule.fromJson(Map<String, dynamic> json) {
    if (json['if'] != null) {
      conditions = new List<Condition>();
      json['if'].forEach((v) {
        conditions.add(new Condition.fromJson(v));
      });
    }
    result = json['then'] != null
        ? new Condition.fromJson(json['then'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.conditions != null) {
      data['if'] = this.conditions.map((v) => v.toJson()).toList();
    }
    if (this.result != null) {
      data['then'] = this.result.toJson();
    }
    return data;
  }
}
