import "package:equatable/equatable.dart";

class SelcomPaymentCountAggregateOutputType extends Equatable {
  final int? id;
  final int? transId;
  final int? amount;
  final int? msisdn;
  final int? operator$;
  final int? reference;
  final int? resultCode;
  final int? status;
  final int? utilityref;
  final int? validation;
  final int? state;
  final int? recordStatus;
  final int? metadata;
  final int? createdAt;
  final int? updatedAt;
  final int? $all;
  SelcomPaymentCountAggregateOutputType(
      {this.id,
      this.transId,
      this.amount,
      this.msisdn,
      this.operator$,
      this.reference,
      this.resultCode,
      this.status,
      this.utilityref,
      this.validation,
      this.state,
      this.recordStatus,
      this.metadata,
      this.createdAt,
      this.updatedAt,
      this.$all});

  static SelcomPaymentCountAggregateOutputType fromJson(
      Map<dynamic, dynamic> json) {
    return SelcomPaymentCountAggregateOutputType(
      id: json['id'],
      transId: json['transId'],
      amount: json['amount'],
      msisdn: json['msisdn'],
      operator$: json['operator'],
      reference: json['reference'],
      resultCode: json['resultCode'],
      status: json['status'],
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
    if (transId != null) _data['transId'] = transId;
    if (amount != null) _data['amount'] = amount;
    if (msisdn != null) _data['msisdn'] = msisdn;
    if (operator$ != null) _data['operator'] = operator$;
    if (reference != null) _data['reference'] = reference;
    if (resultCode != null) _data['resultCode'] = resultCode;
    if (status != null) _data['status'] = status;
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

  SelcomPaymentCountAggregateOutputType copyWith(
      {int? id,
      int? transId,
      int? amount,
      int? msisdn,
      int? operator$,
      int? reference,
      int? resultCode,
      int? status,
      int? utilityref,
      int? validation,
      int? state,
      int? recordStatus,
      int? metadata,
      int? createdAt,
      int? updatedAt,
      int? $all}) {
    return SelcomPaymentCountAggregateOutputType(
        id: id ?? this.id,
        transId: transId ?? this.transId,
        amount: amount ?? this.amount,
        msisdn: msisdn ?? this.msisdn,
        operator$: operator$ ?? this.operator$,
        reference: reference ?? this.reference,
        resultCode: resultCode ?? this.resultCode,
        status: status ?? this.status,
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
        transId,
        amount,
        msisdn,
        operator$,
        reference,
        resultCode,
        status,
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
