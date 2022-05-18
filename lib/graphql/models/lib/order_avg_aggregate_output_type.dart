import "package:equatable/equatable.dart";

class OrderAvgAggregateOutputType extends Equatable {
  final double? quantity;
  OrderAvgAggregateOutputType({this.quantity});

  static OrderAvgAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return OrderAvgAggregateOutputType(
      quantity: json['quantity']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (quantity != null) _data['quantity'] = quantity;
    return _data;
  }

  OrderAvgAggregateOutputType copyWith({double? quantity}) {
    return OrderAvgAggregateOutputType(quantity: quantity ?? this.quantity);
  }

  List<Object?> get props => [quantity];
}
