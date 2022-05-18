import 'record_status.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class DeviceMinAggregateOutputType extends Equatable {
  final String? id;
  final String? fcm$id;
  final String? type;
  final String? userId;
  final RecordStatus? recordStatus;
  DeviceMinAggregateOutputType(
      {this.id, this.fcm$id, this.type, this.userId, this.recordStatus});

  static DeviceMinAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return DeviceMinAggregateOutputType(
      id: json['id'],
      fcm$id: json['fcm_id'],
      type: json['type'],
      userId: json['userId'],
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (fcm$id != null) _data['fcm_id'] = fcm$id;
    if (type != null) _data['type'] = type;
    if (userId != null) _data['userId'] = userId;
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    return _data;
  }

  DeviceMinAggregateOutputType copyWith(
      {String? id,
      String? fcm$id,
      String? type,
      String? userId,
      RecordStatus? recordStatus}) {
    return DeviceMinAggregateOutputType(
        id: id ?? this.id,
        fcm$id: fcm$id ?? this.fcm$id,
        type: type ?? this.type,
        userId: userId ?? this.userId,
        recordStatus: recordStatus ?? this.recordStatus);
  }

  List<Object?> get props => [id, fcm$id, type, userId, recordStatus];
}

extension DeviceMinAggregateOutputTypeExt on DeviceMinAggregateOutputType {
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

class DeviceMinAggregateOutputTypeController
    extends ValueNotifier<DeviceMinAggregateOutputType> {
  TextEditingController? idController;

  TextEditingController? fcm$idController;

  TextEditingController? typeController;

  TextEditingController? userIdController;

  void Function(RecordStatus value)? recordStatusChanged;
  final DeviceMinAggregateOutputType initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  DeviceMinAggregateOutputTypeController({
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
    if (isInSelectionSet('fcm_id')) {
      fcm$idController =
          TextEditingController(text: "${initialValue.fcm$id ?? ''}")
            ..addListener(() {
              value = value.copyWith(fcm$id: fcm$idController?.text);
            });
    }
    if (isInSelectionSet('type')) {
      typeController = TextEditingController(text: "${initialValue.type ?? ''}")
        ..addListener(() {
          value = value.copyWith(type: typeController?.text);
        });
    }
    if (isInSelectionSet('userId')) {
      userIdController =
          TextEditingController(text: "${initialValue.userId ?? ''}")
            ..addListener(() {
              value = value.copyWith(userId: userIdController?.text);
            });
    }
  }
  @override
  dispose() {
    if (isInSelectionSet('id')) {
      idController?.dispose();
    }
    if (isInSelectionSet('fcm_id')) {
      fcm$idController?.dispose();
    }
    if (isInSelectionSet('type')) {
      typeController?.dispose();
    }
    if (isInSelectionSet('userId')) {
      userIdController?.dispose();
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
