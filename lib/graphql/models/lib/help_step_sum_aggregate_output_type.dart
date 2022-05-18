import "package:equatable/equatable.dart";

class HelpStepSumAggregateOutputType extends Equatable {
  final int? stepNumber;
  HelpStepSumAggregateOutputType({this.stepNumber});

  static HelpStepSumAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return HelpStepSumAggregateOutputType(
      stepNumber: json['stepNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (stepNumber != null) _data['stepNumber'] = stepNumber;
    return _data;
  }

  HelpStepSumAggregateOutputType copyWith({int? stepNumber}) {
    return HelpStepSumAggregateOutputType(
        stepNumber: stepNumber ?? this.stepNumber);
  }

  List<Object?> get props => [stepNumber];
}
