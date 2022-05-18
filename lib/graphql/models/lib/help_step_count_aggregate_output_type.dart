import "package:equatable/equatable.dart";

class HelpStepCountAggregateOutputType extends Equatable {
  final int? id;
  final int? stepNumber;
  final int? title;
  final int? description;
  final int? recordStatus;
  final int? helpId;
  final int? createdAt;
  final int? updatedAt;
  final int? $all;
  HelpStepCountAggregateOutputType(
      {this.id,
      this.stepNumber,
      this.title,
      this.description,
      this.recordStatus,
      this.helpId,
      this.createdAt,
      this.updatedAt,
      this.$all});

  static HelpStepCountAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return HelpStepCountAggregateOutputType(
      id: json['id'],
      stepNumber: json['stepNumber'],
      title: json['title'],
      description: json['description'],
      recordStatus: json['recordStatus'],
      helpId: json['helpId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      $all: json['_all'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (stepNumber != null) _data['stepNumber'] = stepNumber;
    if (title != null) _data['title'] = title;
    if (description != null) _data['description'] = description;
    if (recordStatus != null) _data['recordStatus'] = recordStatus;
    if (helpId != null) _data['helpId'] = helpId;
    if (createdAt != null) _data['createdAt'] = createdAt;
    if (updatedAt != null) _data['updatedAt'] = updatedAt;
    if ($all != null) _data['_all'] = $all;
    return _data;
  }

  HelpStepCountAggregateOutputType copyWith(
      {int? id,
      int? stepNumber,
      int? title,
      int? description,
      int? recordStatus,
      int? helpId,
      int? createdAt,
      int? updatedAt,
      int? $all}) {
    return HelpStepCountAggregateOutputType(
        id: id ?? this.id,
        stepNumber: stepNumber ?? this.stepNumber,
        title: title ?? this.title,
        description: description ?? this.description,
        recordStatus: recordStatus ?? this.recordStatus,
        helpId: helpId ?? this.helpId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        $all: $all ?? this.$all);
  }

  List<Object?> get props => [
        id,
        stepNumber,
        title,
        description,
        recordStatus,
        helpId,
        createdAt,
        updatedAt,
        $all
      ];
}
