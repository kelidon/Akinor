import 'package:equatable/equatable.dart';

class Condition extends Equatable{
  String condition;
  String value;

  Condition({this.condition, this.value});

  Condition.fromJson(Map<String, dynamic> json) {
    condition = json['condition'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['condition'] = this.condition;
    data['value'] = this.value;
    return data;
  }

  @override
  // TODO: implement props
  List<Object> get props => [condition, value];

}
