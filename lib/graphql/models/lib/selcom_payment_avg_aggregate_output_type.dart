import "package:equatable/equatable.dart";

class SelcomPaymentAvgAggregateOutputType extends Equatable {
  final double? amount;
  final double? utilityref;
  SelcomPaymentAvgAggregateOutputType({this.amount, this.utilityref});

  static SelcomPaymentAvgAggregateOutputType fromJson(
      Map<dynamic, dynamic> json) {
    return SelcomPaymentAvgAggregateOutputType(
      amount: json['amount']?.toDouble(),
      utilityref: json['utilityref']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (amount != null) _data['amount'] = amount;
    if (utilityref != null) _data['utilityref'] = utilityref;
    return _data;
  }

  SelcomPaymentAvgAggregateOutputType copyWith(
      {double? amount, double? utilityref}) {
    return SelcomPaymentAvgAggregateOutputType(
        amount: amount ?? this.amount,
        utilityref: utilityref ?? this.utilityref);
  }

  List<Object?> get props => [amount, utilityref];
}
