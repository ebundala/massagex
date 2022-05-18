import "package:equatable/equatable.dart";

class AbuseReportSumAggregateOutputType extends Equatable {
  final int? number;
  AbuseReportSumAggregateOutputType({this.number});

  static AbuseReportSumAggregateOutputType fromJson(
      Map<dynamic, dynamic> json) {
    return AbuseReportSumAggregateOutputType(
      number: json['number'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (number != null) _data['number'] = number;
    return _data;
  }

  AbuseReportSumAggregateOutputType copyWith({int? number}) {
    return AbuseReportSumAggregateOutputType(number: number ?? this.number);
  }

  List<Object?> get props => [number];
}
