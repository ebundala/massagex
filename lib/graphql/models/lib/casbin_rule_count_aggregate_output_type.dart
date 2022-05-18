import "package:equatable/equatable.dart";

class CasbinRuleCountAggregateOutputType extends Equatable {
  final int? id;
  final int? ptype;
  final int? v0;
  final int? v1;
  final int? v2;
  final int? v3;
  final int? v4;
  final int? v5;
  final int? createdAt;
  final int? updatedAt;
  final int? $all;
  CasbinRuleCountAggregateOutputType(
      {this.id,
      this.ptype,
      this.v0,
      this.v1,
      this.v2,
      this.v3,
      this.v4,
      this.v5,
      this.createdAt,
      this.updatedAt,
      this.$all});

  static CasbinRuleCountAggregateOutputType fromJson(
      Map<dynamic, dynamic> json) {
    return CasbinRuleCountAggregateOutputType(
      id: json['id'],
      ptype: json['ptype'],
      v0: json['v0'],
      v1: json['v1'],
      v2: json['v2'],
      v3: json['v3'],
      v4: json['v4'],
      v5: json['v5'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      $all: json['_all'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (ptype != null) _data['ptype'] = ptype;
    if (v0 != null) _data['v0'] = v0;
    if (v1 != null) _data['v1'] = v1;
    if (v2 != null) _data['v2'] = v2;
    if (v3 != null) _data['v3'] = v3;
    if (v4 != null) _data['v4'] = v4;
    if (v5 != null) _data['v5'] = v5;
    if (createdAt != null) _data['createdAt'] = createdAt;
    if (updatedAt != null) _data['updatedAt'] = updatedAt;
    if ($all != null) _data['_all'] = $all;
    return _data;
  }

  CasbinRuleCountAggregateOutputType copyWith(
      {int? id,
      int? ptype,
      int? v0,
      int? v1,
      int? v2,
      int? v3,
      int? v4,
      int? v5,
      int? createdAt,
      int? updatedAt,
      int? $all}) {
    return CasbinRuleCountAggregateOutputType(
        id: id ?? this.id,
        ptype: ptype ?? this.ptype,
        v0: v0 ?? this.v0,
        v1: v1 ?? this.v1,
        v2: v2 ?? this.v2,
        v3: v3 ?? this.v3,
        v4: v4 ?? this.v4,
        v5: v5 ?? this.v5,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        $all: $all ?? this.$all);
  }

  List<Object?> get props =>
      [id, ptype, v0, v1, v2, v3, v4, v5, createdAt, updatedAt, $all];
}
