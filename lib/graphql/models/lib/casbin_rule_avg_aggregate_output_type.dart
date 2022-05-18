import "package:equatable/equatable.dart";

class CasbinRuleAvgAggregateOutputType extends Equatable {
  final double? id;
  CasbinRuleAvgAggregateOutputType({this.id});

  static CasbinRuleAvgAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return CasbinRuleAvgAggregateOutputType(
      id: json['id']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    return _data;
  }

  CasbinRuleAvgAggregateOutputType copyWith({double? id}) {
    return CasbinRuleAvgAggregateOutputType(id: id ?? this.id);
  }

  List<Object?> get props => [id];
}
