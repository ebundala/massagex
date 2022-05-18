import 'selcom_utility_code.dart';
import 'record_status.dart';
import 'payment_method_status.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class PaymentMethodMinAggregateOutputType extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final String? attachmentId;
  final SelcomUtilityCode? code;
  final RecordStatus? recordStatus;
  final PaymentMethodStatus? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  PaymentMethodMinAggregateOutputType(
      {this.id,
      this.name,
      this.description,
      this.attachmentId,
      this.code,
      this.recordStatus,
      this.status,
      this.createdAt,
      this.updatedAt});

  static PaymentMethodMinAggregateOutputType fromJson(
      Map<dynamic, dynamic> json) {
    return PaymentMethodMinAggregateOutputType(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      attachmentId: json['attachmentId'],
      code: json['code'] != null
          ? SelcomUtilityCodeExt.fromJson(json['code'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      status: json['status'] != null
          ? PaymentMethodStatusExt.fromJson(json['status'])
          : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (name != null) _data['name'] = name;
    if (description != null) _data['description'] = description;
    if (attachmentId != null) _data['attachmentId'] = attachmentId;
    if (code != null) _data['code'] = code!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (status != null) _data['status'] = status!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    return _data;
  }

  PaymentMethodMinAggregateOutputType copyWith(
      {String? id,
      String? name,
      String? description,
      String? attachmentId,
      SelcomUtilityCode? code,
      RecordStatus? recordStatus,
      PaymentMethodStatus? status,
      DateTime? createdAt,
      DateTime? updatedAt}) {
    return PaymentMethodMinAggregateOutputType(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        attachmentId: attachmentId ?? this.attachmentId,
        code: code ?? this.code,
        recordStatus: recordStatus ?? this.recordStatus,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props => [
        id,
        name,
        description,
        attachmentId,
        code,
        recordStatus,
        status,
        createdAt,
        updatedAt
      ];
}

extension PaymentMethodMinAggregateOutputTypeExt
    on PaymentMethodMinAggregateOutputType {
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

class PaymentMethodMinAggregateOutputTypeController
    extends ValueNotifier<PaymentMethodMinAggregateOutputType> {
  TextEditingController? idController;

  TextEditingController? nameController;

  TextEditingController? descriptionController;

  TextEditingController? attachmentIdController;

  void Function(SelcomUtilityCode value)? codeChanged;
  void Function(RecordStatus value)? recordStatusChanged;
  void Function(PaymentMethodStatus value)? statusChanged;
  TextEditingController? createdAtController;

  TextEditingController? updatedAtController;

  final PaymentMethodMinAggregateOutputType initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  PaymentMethodMinAggregateOutputTypeController({
    required this.initialValue,
    required this.selectionSet,
    this.codeChanged,
    this.recordStatusChanged,
    this.statusChanged,
  }) : super(initialValue) {
    initSelectionData();
    if (isInSelectionSet('id')) {
      idController = TextEditingController(text: "${initialValue.id ?? ''}")
        ..addListener(() {
          value = value.copyWith(id: idController?.text);
        });
    }
    if (isInSelectionSet('name')) {
      nameController = TextEditingController(text: "${initialValue.name ?? ''}")
        ..addListener(() {
          value = value.copyWith(name: nameController?.text);
        });
    }
    if (isInSelectionSet('description')) {
      descriptionController =
          TextEditingController(text: "${initialValue.description ?? ''}")
            ..addListener(() {
              value = value.copyWith(description: descriptionController?.text);
            });
    }
    if (isInSelectionSet('attachmentId')) {
      attachmentIdController =
          TextEditingController(text: "${initialValue.attachmentId ?? ''}")
            ..addListener(() {
              value =
                  value.copyWith(attachmentId: attachmentIdController?.text);
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
    if (isInSelectionSet('name')) {
      nameController?.dispose();
    }
    if (isInSelectionSet('description')) {
      descriptionController?.dispose();
    }
    if (isInSelectionSet('attachmentId')) {
      attachmentIdController?.dispose();
    }
    if (isInSelectionSet('createdAt')) {
      createdAtController?.dispose();
    }
    if (isInSelectionSet('updatedAt')) {
      updatedAtController?.dispose();
    }

    super.dispose();
  }

  void onCodeChanged(SelcomUtilityCode v) {
    if (value.code != v) {
      value = value.copyWith(code: v);
      codeChanged?.call(v);
    }
  }

  void onRecordStatusChanged(RecordStatus v) {
    if (value.recordStatus != v) {
      value = value.copyWith(recordStatus: v);
      recordStatusChanged?.call(v);
    }
  }

  void onStatusChanged(PaymentMethodStatus v) {
    if (value.status != v) {
      value = value.copyWith(status: v);
      statusChanged?.call(v);
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
