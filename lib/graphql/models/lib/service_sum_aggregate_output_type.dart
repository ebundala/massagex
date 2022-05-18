import "package:equatable/equatable.dart";

class ServiceSumAggregateOutputType extends Equatable {
  final double? price;
  ServiceSumAggregateOutputType({this.price});

  static ServiceSumAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return ServiceSumAggregateOutputType(
      price: json['price']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (price != null) _data['price'] = price;
    return _data;
  }

  ServiceSumAggregateOutputType copyWith({double? price}) {
    return ServiceSumAggregateOutputType(price: price ?? this.price);
  }

  List<Object?> get props => [price];
}
