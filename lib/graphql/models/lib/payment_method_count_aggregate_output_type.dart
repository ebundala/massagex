import "package:equatable/equatable.dart";

class PaymentMethodCountAggregateOutputType extends Equatable {
  final int? id;
  final int? name;
  final int? description;
  final int? attachmentId;
  final int? code;
  final int? recordStatus;
  final int? status;
  final int? metadata;
  final int? createdAt;
  final int? updatedAt;
  final int? $all;
  PaymentMethodCountAggregateOutputType(
      {this.id,
      this.name,
      this.description,
      this.attachmentId,
      this.code,
      this.recordStatus,
      this.status,
      this.metadata,
      this.createdAt,
      this.updatedAt,
      this.$all});

  static PaymentMethodCountAggregateOutputType fromJson(
      Map<dynamic, dynamic> json) {
    return PaymentMethodCountAggregateOutputType(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      attachmentId: json['attachmentId'],
      code: json['code'],
      recordStatus: json['recordStatus'],
      status: json['status'],
      metadata: json['metadata'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      $all: json['_all'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (name != null) _data['name'] = name;
    if (description != null) _data['description'] = description;
    if (attachmentId != null) _data['attachmentId'] = attachmentId;
    if (code != null) _data['code'] = code;
    if (recordStatus != null) _data['recordStatus'] = recordStatus;
    if (status != null) _data['status'] = status;
    if (metadata != null) _data['metadata'] = metadata;
    if (createdAt != null) _data['createdAt'] = createdAt;
    if (updatedAt != null) _data['updatedAt'] = updatedAt;
    if ($all != null) _data['_all'] = $all;
    return _data;
  }

  PaymentMethodCountAggregateOutputType copyWith(
      {int? id,
      int? name,
      int? description,
      int? attachmentId,
      int? code,
      int? recordStatus,
      int? status,
      int? metadata,
      int? createdAt,
      int? updatedAt,
      int? $all}) {
    return PaymentMethodCountAggregateOutputType(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        attachmentId: attachmentId ?? this.attachmentId,
        code: code ?? this.code,
        recordStatus: recordStatus ?? this.recordStatus,
        status: status ?? this.status,
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        $all: $all ?? this.$all);
  }

  List<Object?> get props => [
        id,
        name,
        description,
        attachmentId,
        code,
        recordStatus,
        status,
        metadata,
        createdAt,
        updatedAt,
        $all
      ];
}
