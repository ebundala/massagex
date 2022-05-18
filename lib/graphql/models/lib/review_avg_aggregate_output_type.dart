import "package:equatable/equatable.dart";

class ReviewAvgAggregateOutputType extends Equatable {
  final double? value;
  ReviewAvgAggregateOutputType({this.value});

  static ReviewAvgAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return ReviewAvgAggregateOutputType(
      value: json['value']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (value != null) _data['value'] = value;
    return _data;
  }

  ReviewAvgAggregateOutputType copyWith({double? value}) {
    return ReviewAvgAggregateOutputType(value: value ?? this.value);
  }

  List<Object?> get props => [value];
}
