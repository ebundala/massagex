import "package:equatable/equatable.dart";

class CasbinRuleSumAggregateOutputType extends Equatable {
  final int? id;
  CasbinRuleSumAggregateOutputType({this.id});

  static CasbinRuleSumAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return CasbinRuleSumAggregateOutputType(
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    return _data;
  }

  CasbinRuleSumAggregateOutputType copyWith({int? id}) {
    return CasbinRuleSumAggregateOutputType(id: id ?? this.id);
  }

  List<Object?> get props => [id];
}
