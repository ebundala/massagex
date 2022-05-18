import "package:equatable/equatable.dart";

class TransactionCountAggregateOutputType extends Equatable {
  final int? id;
  final int? paymentMethodId;
  final int? type;
  final int? orderId;
  final int? mpesaPaymentId;
  final int? selcomPaymentId;
  final int? selcomDisbursementId;
  final int? status;
  final int? recordStatus;
  final int? metadata;
  final int? createdAt;
  final int? updatedAt;
  final int? $all;
  TransactionCountAggregateOutputType(
      {this.id,
      this.paymentMethodId,
      this.type,
      this.orderId,
      this.mpesaPaymentId,
      this.selcomPaymentId,
      this.selcomDisbursementId,
      this.status,
      this.recordStatus,
      this.metadata,
      this.createdAt,
      this.updatedAt,
      this.$all});

  static TransactionCountAggregateOutputType fromJson(
      Map<dynamic, dynamic> json) {
    return TransactionCountAggregateOutputType(
      id: json['id'],
      paymentMethodId: json['paymentMethodId'],
      type: json['type'],
      orderId: json['orderId'],
      mpesaPaymentId: json['mpesaPaymentId'],
      selcomPaymentId: json['selcomPaymentId'],
      selcomDisbursementId: json['selcomDisbursementId'],
      status: json['status'],
      recordStatus: json['recordStatus'],
      metadata: json['metadata'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      $all: json['_all'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (paymentMethodId != null) _data['paymentMethodId'] = paymentMethodId;
    if (type != null) _data['type'] = type;
    if (orderId != null) _data['orderId'] = orderId;
    if (mpesaPaymentId != null) _data['mpesaPaymentId'] = mpesaPaymentId;
    if (selcomPaymentId != null) _data['selcomPaymentId'] = selcomPaymentId;
    if (selcomDisbursementId != null)
      _data['selcomDisbursementId'] = selcomDisbursementId;
    if (status != null) _data['status'] = status;
    if (recordStatus != null) _data['recordStatus'] = recordStatus;
    if (metadata != null) _data['metadata'] = metadata;
    if (createdAt != null) _data['createdAt'] = createdAt;
    if (updatedAt != null) _data['updatedAt'] = updatedAt;
    if ($all != null) _data['_all'] = $all;
    return _data;
  }

  TransactionCountAggregateOutputType copyWith(
      {int? id,
      int? paymentMethodId,
      int? type,
      int? orderId,
      int? mpesaPaymentId,
      int? selcomPaymentId,
      int? selcomDisbursementId,
      int? status,
      int? recordStatus,
      int? metadata,
      int? createdAt,
      int? updatedAt,
      int? $all}) {
    return TransactionCountAggregateOutputType(
        id: id ?? this.id,
        paymentMethodId: paymentMethodId ?? this.paymentMethodId,
        type: type ?? this.type,
        orderId: orderId ?? this.orderId,
        mpesaPaymentId: mpesaPaymentId ?? this.mpesaPaymentId,
        selcomPaymentId: selcomPaymentId ?? this.selcomPaymentId,
        selcomDisbursementId: selcomDisbursementId ?? this.selcomDisbursementId,
        status: status ?? this.status,
        recordStatus: recordStatus ?? this.recordStatus,
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        $all: $all ?? this.$all);
  }

  List<Object?> get props => [
        id,
        paymentMethodId,
        type,
        orderId,
        mpesaPaymentId,
        selcomPaymentId,
        selcomDisbursementId,
        status,
        recordStatus,
        metadata,
        createdAt,
        updatedAt,
        $all
      ];
}
