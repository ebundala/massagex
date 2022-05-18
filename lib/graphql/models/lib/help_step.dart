import 'record_status.dart';
import 'attachment.dart';
import 'help.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class HelpStep extends Equatable {
  final String? id;
  final int? stepNumber;
  final String? title;
  final String? description;
  final RecordStatus? recordStatus;
  final List<Attachment>? attachments;
  final Help? help;
  final String? helpId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  HelpStep(
      {this.id,
      this.stepNumber,
      this.title,
      this.description,
      this.recordStatus,
      this.attachments,
      this.help,
      this.helpId,
      this.createdAt,
      this.updatedAt});

  static HelpStep fromJson(Map<dynamic, dynamic> json) {
    return HelpStep(
      id: json['id'],
      stepNumber: json['stepNumber'],
      title: json['title'],
      description: json['description'],
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      attachments: json['attachments'] != null
          ? List.generate(json['attachments'].length,
              (index) => Attachment.fromJson(json['attachments'][index]))
          : null,
      help: json['help'] != null ? Help.fromJson(json['help']) : null,
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
    if (attachments != null)
      _data['attachments'] = List.generate(
          attachments?.length ?? 0, (index) => attachments![index].toJson());
    if (help != null) _data['help'] = help!.toJson();
    if (helpId != null) _data['helpId'] = helpId;
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    return _data;
  }

  HelpStep copyWith(
      {String? id,
      int? stepNumber,
      String? title,
      String? description,
      RecordStatus? recordStatus,
      List<Attachment>? attachments,
      Help? help,
      String? helpId,
      DateTime? createdAt,
      DateTime? updatedAt}) {
    return HelpStep(
        id: id ?? this.id,
        stepNumber: stepNumber ?? this.stepNumber,
        title: title ?? this.title,
        description: description ?? this.description,
        recordStatus: recordStatus ?? this.recordStatus,
        attachments: attachments ?? this.attachments,
        help: help ?? this.help,
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
        List.from(attachments ?? []),
        help,
        helpId,
        createdAt,
        updatedAt
      ];
}

extension HelpStepExt on HelpStep {
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

class HelpStepController extends ValueNotifier<HelpStep> {
  TextEditingController? idController;

  TextEditingController? stepNumberController;

  TextEditingController? titleController;

  TextEditingController? descriptionController;

  void Function(RecordStatus value)? recordStatusChanged;
  final Map<String, Attachment> updatedAttachments = {};
  final Map<String, Attachment> deletedAttachments = {};
  void Function(Attachment value)? attachmentsChanged;
  void Function(Attachment value)? attachmentsRemoved;
  // Attachment controllers
  final Map<String, AttachmentController> attachmentsController = {};

  HelpController? helpController;
  void Function(Help value)? helpChanged;

  TextEditingController? helpIdController;

  TextEditingController? createdAtController;

  TextEditingController? updatedAtController;

  final HelpStep initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  HelpStepController({
    required this.initialValue,
    required this.selectionSet,
    this.recordStatusChanged,
    this.attachmentsChanged,
    this.attachmentsRemoved,
    this.helpChanged,
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
    if (isInSelectionSet('attachments')) {
      if (initialValue.attachments?.isNotEmpty == true) {
        var selection = getSelectionNodeData('attachments')?.selectionSet;
        attachmentsController.clear();
        var values = initialValue.attachments
            ?.map<MapEntry<String, AttachmentController>>((e) {
          var controller =
              AttachmentController(initialValue: e, selectionSet: selection!);
          controller.addListener(() {
            onAttachmentsChanged(controller.value);
          });
          return MapEntry<String, AttachmentController>(e.id!, controller);
        });
        attachmentsController.addEntries(values ?? Iterable.empty());
      }
    }
    if (isInSelectionSet('help')) {
      var selected = getSelectionNodeData('help')?.selectionSet;
      helpController = HelpController(
          initialValue: initialValue.help ?? Help(), selectionSet: selected!);
      helpController?.addListener(() {
        var v = helpController?.value;
        onHelpChanged(v!);
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
    if (isInSelectionSet('attachments')) {
      attachmentsController.values.map((v) => v.dispose()).toList();
    }
    if (isInSelectionSet('help')) {
      helpController?.dispose();
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

  void onAttachmentsChanged(Attachment v) {
    updatedAttachments[v.id!] = v;
    var i = value.attachments?.indexWhere((e) => e.id == v.id) ?? -1;
    var list = List<Attachment>.from(value.attachments ?? []);
    if (i >= 0) {
      list[i] = v;
    } else {
      list.add(v);
      var selection = getSelectionNodeData("attachments")?.selectionSet;
      attachmentsController[v.id!] =
          AttachmentController(initialValue: v, selectionSet: selection!);
    }
    value = value.copyWith(attachments: list);

    attachmentsChanged?.call(v);
  }

  void onAttachmentsRemoved(Attachment v) {
    if (!v.isNew) {
      deletedAttachments[v.id!] = v;
    }
    updatedAttachments.remove(v.id!);
    attachmentsController.remove(v.id!);
    value = value.copyWith(
        attachments:
            value.attachments?.where((e) => e.id != v.id).toList() ?? []);

    attachmentsRemoved?.call(v);
  }

  void onHelpChanged(Help v) {
    if (value.help != v) {
      value = value.copyWith(help: v);
      helpChanged?.call(v);
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
