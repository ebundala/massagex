import "package:equatable/equatable.dart";

class HelpStepAvgAggregateOutputType extends Equatable {
  final double? stepNumber;
  HelpStepAvgAggregateOutputType({this.stepNumber});

  static HelpStepAvgAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return HelpStepAvgAggregateOutputType(
      stepNumber: json['stepNumber']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (stepNumber != null) _data['stepNumber'] = stepNumber;
    return _data;
  }

  HelpStepAvgAggregateOutputType copyWith({double? stepNumber}) {
    return HelpStepAvgAggregateOutputType(
        stepNumber: stepNumber ?? this.stepNumber);
  }

  List<Object?> get props => [stepNumber];
}
