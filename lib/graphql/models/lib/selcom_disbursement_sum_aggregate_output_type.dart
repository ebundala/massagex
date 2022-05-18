import "package:equatable/equatable.dart";

class SelcomDisbursementSumAggregateOutputType extends Equatable {
  final int? amount;
  final int? userId;
  SelcomDisbursementSumAggregateOutputType({this.amount, this.userId});

  static SelcomDisbursementSumAggregateOutputType fromJson(
      Map<dynamic, dynamic> json) {
    return SelcomDisbursementSumAggregateOutputType(
      amount: json['amount'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (amount != null) _data['amount'] = amount;
    if (userId != null) _data['userId'] = userId;
    return _data;
  }

  SelcomDisbursementSumAggregateOutputType copyWith(
      {int? amount, int? userId}) {
    return SelcomDisbursementSumAggregateOutputType(
        amount: amount ?? this.amount, userId: userId ?? this.userId);
  }

  List<Object?> get props => [amount, userId];
}
