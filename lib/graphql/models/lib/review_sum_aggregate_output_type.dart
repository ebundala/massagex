import "package:equatable/equatable.dart";

class ReviewSumAggregateOutputType extends Equatable {
  final int? value;
  ReviewSumAggregateOutputType({this.value});

  static ReviewSumAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return ReviewSumAggregateOutputType(
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (value != null) _data['value'] = value;
    return _data;
  }

  ReviewSumAggregateOutputType copyWith({int? value}) {
    return ReviewSumAggregateOutputType(value: value ?? this.value);
  }

  List<Object?> get props => [value];
}
