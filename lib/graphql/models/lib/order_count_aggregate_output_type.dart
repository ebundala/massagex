import "package:equatable/equatable.dart";

class OrderCountAggregateOutputType extends Equatable {
  final int? id;
  final int? quantity;
  final int? recordStatus;
  final int? orderStatus;
  final int? notes;
  final int? metadata;
  final int? createdAt;
  final int? updatedAt;
  final int? ownerId;
  final int? receiptId;
  final int? serviceId;
  final int? businessId;
  final int? $all;
  OrderCountAggregateOutputType(
      {this.id,
      this.quantity,
      this.recordStatus,
      this.orderStatus,
      this.notes,
      this.metadata,
      this.createdAt,
      this.updatedAt,
      this.ownerId,
      this.receiptId,
      this.serviceId,
      this.businessId,
      this.$all});

  static OrderCountAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return OrderCountAggregateOutputType(
      id: json['id'],
      quantity: json['quantity'],
      recordStatus: json['recordStatus'],
      orderStatus: json['orderStatus'],
      notes: json['notes'],
      metadata: json['metadata'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      ownerId: json['ownerId'],
      receiptId: json['receiptId'],
      serviceId: json['serviceId'],
      businessId: json['businessId'],
      $all: json['_all'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (quantity != null) _data['quantity'] = quantity;
    if (recordStatus != null) _data['recordStatus'] = recordStatus;
    if (orderStatus != null) _data['orderStatus'] = orderStatus;
    if (notes != null) _data['notes'] = notes;
    if (metadata != null) _data['metadata'] = metadata;
    if (createdAt != null) _data['createdAt'] = createdAt;
    if (updatedAt != null) _data['updatedAt'] = updatedAt;
    if (ownerId != null) _data['ownerId'] = ownerId;
    if (receiptId != null) _data['receiptId'] = receiptId;
    if (serviceId != null) _data['serviceId'] = serviceId;
    if (businessId != null) _data['businessId'] = businessId;
    if ($all != null) _data['_all'] = $all;
    return _data;
  }

  OrderCountAggregateOutputType copyWith(
      {int? id,
      int? quantity,
      int? recordStatus,
      int? orderStatus,
      int? notes,
      int? metadata,
      int? createdAt,
      int? updatedAt,
      int? ownerId,
      int? receiptId,
      int? serviceId,
      int? businessId,
      int? $all}) {
    return OrderCountAggregateOutputType(
        id: id ?? this.id,
        quantity: quantity ?? this.quantity,
        recordStatus: recordStatus ?? this.recordStatus,
        orderStatus: orderStatus ?? this.orderStatus,
        notes: notes ?? this.notes,
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        ownerId: ownerId ?? this.ownerId,
        receiptId: receiptId ?? this.receiptId,
        serviceId: serviceId ?? this.serviceId,
        businessId: businessId ?? this.businessId,
        $all: $all ?? this.$all);
  }

  List<Object?> get props => [
        id,
        quantity,
        recordStatus,
        orderStatus,
        notes,
        metadata,
        createdAt,
        updatedAt,
        ownerId,
        receiptId,
        serviceId,
        businessId,
        $all
      ];
}
