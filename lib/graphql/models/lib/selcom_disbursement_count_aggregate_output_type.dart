import "package:equatable/equatable.dart";

class SelcomDisbursementCountAggregateOutputType extends Equatable {
  final int? id;
  final int? amount;
  final int? reference;
  final int? resultCode;
  final int? status;
  final int? transId;
  final int? userId;
  final int? utilitycode;
  final int? utilityref;
  final int? validation;
  final int? state;
  final int? recordStatus;
  final int? metadata;
  final int? createdAt;
  final int? updatedAt;
  final int? $all;
  SelcomDisbursementCountAggregateOutputType(
      {this.id,
      this.amount,
      this.reference,
      this.resultCode,
      this.status,
      this.transId,
      this.userId,
      this.utilitycode,
      this.utilityref,
      this.validation,
      this.state,
      this.recordStatus,
      this.metadata,
      this.createdAt,
      this.updatedAt,
      this.$all});

  static SelcomDisbursementCountAggregateOutputType fromJson(
      Map<dynamic, dynamic> json) {
    return SelcomDisbursementCountAggregateOutputType(
      id: json['id'],
      amount: json['amount'],
      reference: json['reference'],
      resultCode: json['resultCode'],
      status: json['status'],
      transId: json['transId'],
      userId: json['userId'],
      utilitycode: json['utilitycode'],
      utilityref: json['utilityref'],
      validation: json['validation'],
      state: json['state'],
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
    if (amount != null) _data['amount'] = amount;
    if (reference != null) _data['reference'] = reference;
    if (resultCode != null) _data['resultCode'] = resultCode;
    if (status != null) _data['status'] = status;
    if (transId != null) _data['transId'] = transId;
    if (userId != null) _data['userId'] = userId;
    if (utilitycode != null) _data['utilitycode'] = utilitycode;
    if (utilityref != null) _data['utilityref'] = utilityref;
    if (validation != null) _data['validation'] = validation;
    if (state != null) _data['state'] = state;
    if (recordStatus != null) _data['recordStatus'] = recordStatus;
    if (metadata != null) _data['metadata'] = metadata;
    if (createdAt != null) _data['createdAt'] = createdAt;
    if (updatedAt != null) _data['updatedAt'] = updatedAt;
    if ($all != null) _data['_all'] = $all;
    return _data;
  }

  SelcomDisbursementCountAggregateOutputType copyWith(
      {int? id,
      int? amount,
      int? reference,
      int? resultCode,
      int? status,
      int? transId,
      int? userId,
      int? utilitycode,
      int? utilityref,
      int? validation,
      int? state,
      int? recordStatus,
      int? metadata,
      int? createdAt,
      int? updatedAt,
      int? $all}) {
    return SelcomDisbursementCountAggregateOutputType(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        reference: reference ?? this.reference,
        resultCode: resultCode ?? this.resultCode,
        status: status ?? this.status,
        transId: transId ?? this.transId,
        userId: userId ?? this.userId,
        utilitycode: utilitycode ?? this.utilitycode,
        utilityref: utilityref ?? this.utilityref,
        validation: validation ?? this.validation,
        state: state ?? this.state,
        recordStatus: recordStatus ?? this.recordStatus,
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        $all: $all ?? this.$all);
  }

  List<Object?> get props => [
        id,
        amount,
        reference,
        resultCode,
        status,
        transId,
        userId,
        utilitycode,
        utilityref,
        validation,
        state,
        recordStatus,
        metadata,
        createdAt,
        updatedAt,
        $all
      ];
}
