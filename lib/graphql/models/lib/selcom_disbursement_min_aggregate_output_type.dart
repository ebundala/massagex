import 'payment_status.dart';
import 'selcom_utility_code.dart';
import 'record_status.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class SelcomDisbursementMinAggregateOutputType extends Equatable {
  final String? id;
  final int? amount;
  final String? reference;
  final String? resultCode;
  final PaymentStatus? status;
  final String? transId;
  final int? userId;
  final SelcomUtilityCode? utilitycode;
  final String? utilityref;
  final PaymentStatus? validation;
  final PaymentStatus? state;
  final RecordStatus? recordStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  SelcomDisbursementMinAggregateOutputType(
      {this.id,
      this.amount,
      this.reference,
      this.resultCode,
      this.status,
      this.transId,
      this.userId,
      this.utilitycode,
      this.utilityref,
      this.validation,
      this.state,
      this.recordStatus,
      this.createdAt,
      this.updatedAt});

  static SelcomDisbursementMinAggregateOutputType fromJson(
      Map<dynamic, dynamic> json) {
    return SelcomDisbursementMinAggregateOutputType(
      id: json['id'],
      amount: json['amount'],
      reference: json['reference'],
      resultCode: json['resultCode'],
      status: json['status'] != null
          ? PaymentStatusExt.fromJson(json['status'])
          : null,
      transId: json['transId'],
      userId: json['userId'],
      utilitycode: json['utilitycode'] != null
          ? SelcomUtilityCodeExt.fromJson(json['utilitycode'])
          : null,
      utilityref: json['utilityref'],
      validation: json['validation'] != null
          ? PaymentStatusExt.fromJson(json['validation'])
          : null,
      state: json['state'] != null
          ? PaymentStatusExt.fromJson(json['state'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
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
    if (amount != null) _data['amount'] = amount;
    if (reference != null) _data['reference'] = reference;
    if (resultCode != null) _data['resultCode'] = resultCode;
    if (status != null) _data['status'] = status!.toJson();
    if (transId != null) _data['transId'] = transId;
    if (userId != null) _data['userId'] = userId;
    if (utilitycode != null) _data['utilitycode'] = utilitycode!.toJson();
    if (utilityref != null) _data['utilityref'] = utilityref;
    if (validation != null) _data['validation'] = validation!.toJson();
    if (state != null) _data['state'] = state!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    return _data;
  }

  SelcomDisbursementMinAggregateOutputType copyWith(
      {String? id,
      int? amount,
      String? reference,
      String? resultCode,
      PaymentStatus? status,
      String? transId,
      int? userId,
      SelcomUtilityCode? utilitycode,
      String? utilityref,
      PaymentStatus? validation,
      PaymentStatus? state,
      RecordStatus? recordStatus,
      DateTime? createdAt,
      DateTime? updatedAt}) {
    return SelcomDisbursementMinAggregateOutputType(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        reference: reference ?? this.reference,
        resultCode: resultCode ?? this.resultCode,
        status: status ?? this.status,
        transId: transId ?? this.transId,
        userId: userId ?? this.userId,
        utilitycode: utilitycode ?? this.utilitycode,
        utilityref: utilityref ?? this.utilityref,
        validation: validation ?? this.validation,
        state: state ?? this.state,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props => [
        id,
        amount,
        reference,
        resultCode,
        status,
        transId,
        userId,
        utilitycode,
        utilityref,
        validation,
        state,
        recordStatus,
        createdAt,
        updatedAt
      ];
}

extension SelcomDisbursementMinAggregateOutputTypeExt
    on SelcomDisbursementMinAggregateOutputType {
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

class SelcomDisbursementMinAggregateOutputTypeController
    extends ValueNotifier<SelcomDisbursementMinAggregateOutputType> {
  TextEditingController? idController;

  TextEditingController? amountController;

  TextEditingController? referenceController;

  TextEditingController? resultCodeController;

  void Function(PaymentStatus value)? statusChanged;
  TextEditingController? transIdController;

  TextEditingController? userIdController;

  void Function(SelcomUtilityCode value)? utilitycodeChanged;
  TextEditingController? utilityrefController;

  void Function(PaymentStatus value)? validationChanged;
  void Function(PaymentStatus value)? stateChanged;
  void Function(RecordStatus value)? recordStatusChanged;
  TextEditingController? createdAtController;

  TextEditingController? updatedAtController;

  final SelcomDisbursementMinAggregateOutputType initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  SelcomDisbursementMinAggregateOutputTypeController({
    required this.initialValue,
    required this.selectionSet,
    this.statusChanged,
    this.utilitycodeChanged,
    this.validationChanged,
    this.stateChanged,
    this.recordStatusChanged,
  }) : super(initialValue) {
    initSelectionData();
    if (isInSelectionSet('id')) {
      idController = TextEditingController(text: "${initialValue.id ?? ''}")
        ..addListener(() {
          value = value.copyWith(id: idController?.text);
        });
    }
    if (isInSelectionSet('amount')) {
      amountController =
          TextEditingController(text: "${initialValue.amount ?? ''}")
            ..addListener(() {
              value = value.copyWith(
                  amount: int.tryParse(amountController?.text ?? ''));
            });
    }
    if (isInSelectionSet('reference')) {
      referenceController =
          TextEditingController(text: "${initialValue.reference ?? ''}")
            ..addListener(() {
              value = value.copyWith(reference: referenceController?.text);
            });
    }
    if (isInSelectionSet('resultCode')) {
      resultCodeController =
          TextEditingController(text: "${initialValue.resultCode ?? ''}")
            ..addListener(() {
              value = value.copyWith(resultCode: resultCodeController?.text);
            });
    }
    if (isInSelectionSet('transId')) {
      transIdController =
          TextEditingController(text: "${initialValue.transId ?? ''}")
            ..addListener(() {
              value = value.copyWith(transId: transIdController?.text);
            });
    }
    if (isInSelectionSet('userId')) {
      userIdController =
          TextEditingController(text: "${initialValue.userId ?? ''}")
            ..addListener(() {
              value = value.copyWith(
                  userId: int.tryParse(userIdController?.text ?? ''));
            });
    }
    if (isInSelectionSet('utilityref')) {
      utilityrefController =
          TextEditingController(text: "${initialValue.utilityref ?? ''}")
            ..addListener(() {
              value = value.copyWith(utilityref: utilityrefController?.text);
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
    if (isInSelectionSet('amount')) {
      amountController?.dispose();
    }
    if (isInSelectionSet('reference')) {
      referenceController?.dispose();
    }
    if (isInSelectionSet('resultCode')) {
      resultCodeController?.dispose();
    }
    if (isInSelectionSet('transId')) {
      transIdController?.dispose();
    }
    if (isInSelectionSet('userId')) {
      userIdController?.dispose();
    }
    if (isInSelectionSet('utilityref')) {
      utilityrefController?.dispose();
    }
    if (isInSelectionSet('createdAt')) {
      createdAtController?.dispose();
    }
    if (isInSelectionSet('updatedAt')) {
      updatedAtController?.dispose();
    }

    super.dispose();
  }

  void onStatusChanged(PaymentStatus v) {
    if (value.status != v) {
      value = value.copyWith(status: v);
      statusChanged?.call(v);
    }
  }

  void onUtilitycodeChanged(SelcomUtilityCode v) {
    if (value.utilitycode != v) {
      value = value.copyWith(utilitycode: v);
      utilitycodeChanged?.call(v);
    }
  }

  void onValidationChanged(PaymentStatus v) {
    if (value.validation != v) {
      value = value.copyWith(validation: v);
      validationChanged?.call(v);
    }
  }

  void onStateChanged(PaymentStatus v) {
    if (value.state != v) {
      value = value.copyWith(state: v);
      stateChanged?.call(v);
    }
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
