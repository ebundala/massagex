import "package:equatable/equatable.dart";

class ServiceAvgAggregateOutputType extends Equatable {
  final double? price;
  ServiceAvgAggregateOutputType({this.price});

  static ServiceAvgAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return ServiceAvgAggregateOutputType(
      price: json['price']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (price != null) _data['price'] = price;
    return _data;
  }

  ServiceAvgAggregateOutputType copyWith({double? price}) {
    return ServiceAvgAggregateOutputType(price: price ?? this.price);
  }

  List<Object?> get props => [price];
}
