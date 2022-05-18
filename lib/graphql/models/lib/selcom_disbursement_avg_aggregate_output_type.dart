import "package:equatable/equatable.dart";

class SelcomDisbursementAvgAggregateOutputType extends Equatable {
  final double? amount;
  final double? userId;
  SelcomDisbursementAvgAggregateOutputType({this.amount, this.userId});

  static SelcomDisbursementAvgAggregateOutputType fromJson(
      Map<dynamic, dynamic> json) {
    return SelcomDisbursementAvgAggregateOutputType(
      amount: json['amount']?.toDouble(),
      userId: json['userId']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (amount != null) _data['amount'] = amount;
    if (userId != null) _data['userId'] = userId;
    return _data;
  }

  SelcomDisbursementAvgAggregateOutputType copyWith(
      {double? amount, double? userId}) {
    return SelcomDisbursementAvgAggregateOutputType(
        amount: amount ?? this.amount, userId: userId ?? this.userId);
  }

  List<Object?> get props => [amount, userId];
}
