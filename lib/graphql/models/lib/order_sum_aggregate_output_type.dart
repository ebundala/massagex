import "package:equatable/equatable.dart";

class OrderSumAggregateOutputType extends Equatable {
  final int? quantity;
  OrderSumAggregateOutputType({this.quantity});

  static OrderSumAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return OrderSumAggregateOutputType(
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (quantity != null) _data['quantity'] = quantity;
    return _data;
  }

  OrderSumAggregateOutputType copyWith({int? quantity}) {
    return OrderSumAggregateOutputType(quantity: quantity ?? this.quantity);
  }

  List<Object?> get props => [quantity];
}
