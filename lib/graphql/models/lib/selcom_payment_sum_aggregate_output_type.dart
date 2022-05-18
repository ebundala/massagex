import "package:equatable/equatable.dart";

class SelcomPaymentSumAggregateOutputType extends Equatable {
  final int? amount;
  final int? utilityref;
  SelcomPaymentSumAggregateOutputType({this.amount, this.utilityref});

  static SelcomPaymentSumAggregateOutputType fromJson(
      Map<dynamic, dynamic> json) {
    return SelcomPaymentSumAggregateOutputType(
      amount: json['amount'],
      utilityref: json['utilityref'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (amount != null) _data['amount'] = amount;
    if (utilityref != null) _data['utilityref'] = utilityref;
    return _data;
  }

  SelcomPaymentSumAggregateOutputType copyWith({int? amount, int? utilityref}) {
    return SelcomPaymentSumAggregateOutputType(
        amount: amount ?? this.amount,
        utilityref: utilityref ?? this.utilityref);
  }

  List<Object?> get props => [amount, utilityref];
}
