import "package:equatable/equatable.dart";

class AbuseReportAvgAggregateOutputType extends Equatable {
  final double? number;
  AbuseReportAvgAggregateOutputType({this.number});

  static AbuseReportAvgAggregateOutputType fromJson(
      Map<dynamic, dynamic> json) {
    return AbuseReportAvgAggregateOutputType(
      number: json['number']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (number != null) _data['number'] = number;
    return _data;
  }

  AbuseReportAvgAggregateOutputType copyWith({double? number}) {
    return AbuseReportAvgAggregateOutputType(number: number ?? this.number);
  }

  List<Object?> get props => [number];
}
