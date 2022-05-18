import 'help_step.dart';
import 'record_status.dart';
import 'role.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class Help extends Equatable {
  final String? id;
  final String? topic;
  final String? description;
  final List<HelpStep>? steps;
  final RecordStatus? recordStatus;
  final Role? audience;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  Help(
      {this.id,
      this.topic,
      this.description,
      this.steps,
      this.recordStatus,
      this.audience,
      this.createdAt,
      this.updatedAt});

  static Help fromJson(Map<dynamic, dynamic> json) {
    return Help(
      id: json['id'],
      topic: json['topic'],
      description: json['description'],
      steps: json['steps'] != null
          ? List.generate(json['steps'].length,
              (index) => HelpStep.fromJson(json['steps'][index]))
          : null,
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      audience:
          json['audience'] != null ? RoleExt.fromJson(json['audience']) : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (topic != null) _data['topic'] = topic;
    if (description != null) _data['description'] = description;
    if (steps != null)
      _data['steps'] =
          List.generate(steps?.length ?? 0, (index) => steps![index].toJson());
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (audience != null) _data['audience'] = audience!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    return _data;
  }

  Help copyWith(
      {String? id,
      String? topic,
      String? description,
      List<HelpStep>? steps,
      RecordStatus? recordStatus,
      Role? audience,
      DateTime? createdAt,
      DateTime? updatedAt}) {
    return Help(
        id: id ?? this.id,
        topic: topic ?? this.topic,
        description: description ?? this.description,
        steps: steps ?? this.steps,
        recordStatus: recordStatus ?? this.recordStatus,
        audience: audience ?? this.audience,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props => [
        id,
        topic,
        description,
        List.from(steps ?? []),
        recordStatus,
        audience,
        createdAt,
        updatedAt
      ];
}

extension HelpExt on Help {
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

class HelpController extends ValueNotifier<Help> {
  TextEditingController? idController;

  TextEditingController? topicController;

  TextEditingController? descriptionController;

  final Map<String, HelpStep> updatedSteps = {};
  final Map<String, HelpStep> deletedSteps = {};
  void Function(HelpStep value)? stepsChanged;
  void Function(HelpStep value)? stepsRemoved;
  // HelpStep controllers
  final Map<String, HelpStepController> stepsController = {};

  void Function(RecordStatus value)? recordStatusChanged;
  void Function(Role value)? audienceChanged;
  TextEditingController? createdAtController;

  TextEditingController? updatedAtController;

  final Help initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  HelpController({
    required this.initialValue,
    required this.selectionSet,
    this.stepsChanged,
    this.stepsRemoved,
    this.recordStatusChanged,
    this.audienceChanged,
  }) : super(initialValue) {
    initSelectionData();
    if (isInSelectionSet('id')) {
      idController = TextEditingController(text: "${initialValue.id ?? ''}")
        ..addListener(() {
          value = value.copyWith(id: idController?.text);
        });
    }
    if (isInSelectionSet('topic')) {
      topicController =
          TextEditingController(text: "${initialValue.topic ?? ''}")
            ..addListener(() {
              value = value.copyWith(topic: topicController?.text);
            });
    }
    if (isInSelectionSet('description')) {
      descriptionController =
          TextEditingController(text: "${initialValue.description ?? ''}")
            ..addListener(() {
              value = value.copyWith(description: descriptionController?.text);
            });
    }
    if (isInSelectionSet('steps')) {
      if (initialValue.steps?.isNotEmpty == true) {
        var selection = getSelectionNodeData('steps')?.selectionSet;
        stepsController.clear();
        var values =
            initialValue.steps?.map<MapEntry<String, HelpStepController>>((e) {
          var controller =
              HelpStepController(initialValue: e, selectionSet: selection!);
          controller.addListener(() {
            onStepsChanged(controller.value);
          });
          return MapEntry<String, HelpStepController>(e.id!, controller);
        });
        stepsController.addEntries(values ?? Iterable.empty());
      }
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
    if (isInSelectionSet('topic')) {
      topicController?.dispose();
    }
    if (isInSelectionSet('description')) {
      descriptionController?.dispose();
    }
    if (isInSelectionSet('steps')) {
      stepsController.values.map((v) => v.dispose()).toList();
    }
    if (isInSelectionSet('createdAt')) {
      createdAtController?.dispose();
    }
    if (isInSelectionSet('updatedAt')) {
      updatedAtController?.dispose();
    }

    super.dispose();
  }

  void onStepsChanged(HelpStep v) {
    updatedSteps[v.id!] = v;
    var i = value.steps?.indexWhere((e) => e.id == v.id) ?? -1;
    var list = List<HelpStep>.from(value.steps ?? []);
    if (i >= 0) {
      list[i] = v;
    } else {
      list.add(v);
      var selection = getSelectionNodeData("steps")?.selectionSet;
      stepsController[v.id!] =
          HelpStepController(initialValue: v, selectionSet: selection!);
    }
    value = value.copyWith(steps: list);

    stepsChanged?.call(v);
  }

  void onStepsRemoved(HelpStep v) {
    if (!v.isNew) {
      deletedSteps[v.id!] = v;
    }
    updatedSteps.remove(v.id!);
    stepsController.remove(v.id!);
    value = value.copyWith(
        steps: value.steps?.where((e) => e.id != v.id).toList() ?? []);

    stepsRemoved?.call(v);
  }

  void onRecordStatusChanged(RecordStatus v) {
    if (value.recordStatus != v) {
      value = value.copyWith(recordStatus: v);
      recordStatusChanged?.call(v);
    }
  }

  void onAudienceChanged(Role v) {
    if (value.audience != v) {
      value = value.copyWith(audience: v);
      audienceChanged?.call(v);
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
