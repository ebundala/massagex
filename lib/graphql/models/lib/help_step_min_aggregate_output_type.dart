import 'record_status.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class HelpStepMinAggregateOutputType extends Equatable {
  final String? id;
  final int? stepNumber;
  final String? title;
  final String? description;
  final RecordStatus? recordStatus;
  final String? helpId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  HelpStepMinAggregateOutputType(
      {this.id,
      this.stepNumber,
      this.title,
      this.description,
      this.recordStatus,
      this.helpId,
      this.createdAt,
      this.updatedAt});

  static HelpStepMinAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return HelpStepMinAggregateOutputType(
      id: json['id'],
      stepNumber: json['stepNumber'],
      title: json['title'],
      description: json['description'],
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      helpId: json['helpId'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (stepNumber != null) _data['stepNumber'] = stepNumber;
    if (title != null) _data['title'] = title;
    if (description != null) _data['description'] = description;
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (helpId != null) _data['helpId'] = helpId;
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    return _data;
  }

  HelpStepMinAggregateOutputType copyWith(
      {String? id,
      int? stepNumber,
      String? title,
      String? description,
      RecordStatus? recordStatus,
      String? helpId,
      DateTime? createdAt,
      DateTime? updatedAt}) {
    return HelpStepMinAggregateOutputType(
        id: id ?? this.id,
        stepNumber: stepNumber ?? this.stepNumber,
        title: title ?? this.title,
        description: description ?? this.description,
        recordStatus: recordStatus ?? this.recordStatus,
        helpId: helpId ?? this.helpId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props => [
        id,
        stepNumber,
        title,
        description,
        recordStatus,
        helpId,
        createdAt,
        updatedAt
      ];
}

extension HelpStepMinAggregateOutputTypeExt on HelpStepMinAggregateOutputType {
  bool get isInitialized {
    return isNew || isSaved;
  }

  bool get isSaved {
    return id?.isNotEmpty == true && id?.contains("new") != true;
  }

  bool get isNew {
    return id?.isNotEmpty == true && id?.contains("new") == true;
  }
}

class HelpStepMinAggregateOutputTypeController
    extends ValueNotifier<HelpStepMinAggregateOutputType> {
  TextEditingController? idController;

  TextEditingController? stepNumberController;

  TextEditingController? titleController;

  TextEditingController? descriptionController;

  void Function(RecordStatus value)? recordStatusChanged;
  TextEditingController? helpIdController;

  TextEditingController? createdAtController;

  TextEditingController? updatedAtController;

  final HelpStepMinAggregateOutputType initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  HelpStepMinAggregateOutputTypeController({
    required this.initialValue,
    required this.selectionSet,
    this.recordStatusChanged,
  }) : super(initialValue) {
    initSelectionData();
    if (isInSelectionSet('id')) {
      idController = TextEditingController(text: "${initialValue.id ?? ''}")
        ..addListener(() {
          value = value.copyWith(id: idController?.text);
        });
    }
    if (isInSelectionSet('stepNumber')) {
      stepNumberController =
          TextEditingController(text: "${initialValue.stepNumber ?? ''}")
            ..addListener(() {
              value = value.copyWith(
                  stepNumber: int.tryParse(stepNumberController?.text ?? ''));
            });
    }
    if (isInSelectionSet('title')) {
      titleController =
          TextEditingController(text: "${initialValue.title ?? ''}")
            ..addListener(() {
              value = value.copyWith(title: titleController?.text);
            });
    }
    if (isInSelectionSet('description')) {
      descriptionController =
          TextEditingController(text: "${initialValue.description ?? ''}")
            ..addListener(() {
              value = value.copyWith(description: descriptionController?.text);
            });
    }
    if (isInSelectionSet('helpId')) {
      helpIdController =
          TextEditingController(text: "${initialValue.helpId ?? ''}")
            ..addListener(() {
              value = value.copyWith(helpId: helpIdController?.text);
            });
    }
    if (isInSelectionSet('createdAt')) {
      createdAtController = TextEditingController(
          text: "${initialValue.createdAt ?? ''}")
        ..addListener(() {
          value = value.copyWith(
              createdAt: DateTime.tryParse(createdAtController?.text ?? ''));
        });
    }
    if (isInSelectionSet('updatedAt')) {
      updatedAtController = TextEditingController(
          text: "${initialValue.updatedAt ?? ''}")
        ..addListener(() {
          value = value.copyWith(
              updatedAt: DateTime.tryParse(updatedAtController?.text ?? ''));
        });
    }
  }
  @override
  dispose() {
    if (isInSelectionSet('id')) {
      idController?.dispose();
    }
    if (isInSelectionSet('stepNumber')) {
      stepNumberController?.dispose();
    }
    if (isInSelectionSet('title')) {
      titleController?.dispose();
    }
    if (isInSelectionSet('description')) {
      descriptionController?.dispose();
    }
    if (isInSelectionSet('helpId')) {
      helpIdController?.dispose();
    }
    if (isInSelectionSet('createdAt')) {
      createdAtController?.dispose();
    }
    if (isInSelectionSet('updatedAt')) {
      updatedAtController?.dispose();
    }

    super.dispose();
  }

  void onRecordStatusChanged(RecordStatus v) {
    if (value.recordStatus != v) {
      value = value.copyWith(recordStatus: v);
      recordStatusChanged?.call(v);
    }
  }

  bool isInSelectionSet(String field) {
    return selections.containsKey(field);
  }

  SelectionNodeData? getSelectionNodeData(String field) {
    return selections[field];
  }

  Map<String, SelectionNodeData> initSelectionData() {
    var sel = selectionSet.selections;
    sel.forEach((el) {
      var e = el as FieldNode;
      selections[e.name.value] =
          SelectionNodeData(selected: true, selectionSet: e.selectionSet);
    });
    return selections;
  }
}
