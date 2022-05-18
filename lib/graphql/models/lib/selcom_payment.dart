import 'payment_status.dart';
import 'transaction.dart';
import 'record_status.dart';
import 'scalars/json_object.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class SelcomPayment extends Equatable {
  final String? id;
  final String? transId;
  final int? amount;
  final String? msisdn;
  final String? operator$;
  final String? reference;
  final String? resultCode;
  final PaymentStatus? status;
  final int? utilityref;
  final PaymentStatus? validation;
  final Transaction? transaction;
  final PaymentStatus? state;
  final RecordStatus? recordStatus;
  final JSONObject? metadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  SelcomPayment(
      {this.id,
      this.transId,
      this.amount,
      this.msisdn,
      this.operator$,
      this.reference,
      this.resultCode,
      this.status,
      this.utilityref,
      this.validation,
      this.transaction,
      this.state,
      this.recordStatus,
      this.metadata,
      this.createdAt,
      this.updatedAt});

  static SelcomPayment fromJson(Map<dynamic, dynamic> json) {
    return SelcomPayment(
      id: json['id'],
      transId: json['transId'],
      amount: json['amount'],
      msisdn: json['msisdn'],
      operator$: json['operator'],
      reference: json['reference'],
      resultCode: json['resultCode'],
      status: json['status'] != null
          ? PaymentStatusExt.fromJson(json['status'])
          : null,
      utilityref: json['utilityref'],
      validation: json['validation'] != null
          ? PaymentStatusExt.fromJson(json['validation'])
          : null,
      transaction: json['transaction'] != null
          ? Transaction.fromJson(json['transaction'])
          : null,
      state: json['state'] != null
          ? PaymentStatusExt.fromJson(json['state'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      metadata: json['metadata'] != null
          ? JSONObject.fromJson(json['metadata'])
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
    if (transId != null) _data['transId'] = transId;
    if (amount != null) _data['amount'] = amount;
    if (msisdn != null) _data['msisdn'] = msisdn;
    if (operator$ != null) _data['operator'] = operator$;
    if (reference != null) _data['reference'] = reference;
    if (resultCode != null) _data['resultCode'] = resultCode;
    if (status != null) _data['status'] = status!.toJson();
    if (utilityref != null) _data['utilityref'] = utilityref;
    if (validation != null) _data['validation'] = validation!.toJson();
    if (transaction != null) _data['transaction'] = transaction!.toJson();
    if (state != null) _data['state'] = state!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    return _data;
  }

  SelcomPayment copyWith(
      {String? id,
      String? transId,
      int? amount,
      String? msisdn,
      String? operator$,
      String? reference,
      String? resultCode,
      PaymentStatus? status,
      int? utilityref,
      PaymentStatus? validation,
      Transaction? transaction,
      PaymentStatus? state,
      RecordStatus? recordStatus,
      JSONObject? metadata,
      DateTime? createdAt,
      DateTime? updatedAt}) {
    return SelcomPayment(
        id: id ?? this.id,
        transId: transId ?? this.transId,
        amount: amount ?? this.amount,
        msisdn: msisdn ?? this.msisdn,
        operator$: operator$ ?? this.operator$,
        reference: reference ?? this.reference,
        resultCode: resultCode ?? this.resultCode,
        status: status ?? this.status,
        utilityref: utilityref ?? this.utilityref,
        validation: validation ?? this.validation,
        transaction: transaction ?? this.transaction,
        state: state ?? this.state,
        recordStatus: recordStatus ?? this.recordStatus,
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props => [
        id,
        transId,
        amount,
        msisdn,
        operator$,
        reference,
        resultCode,
        status,
        utilityref,
        validation,
        transaction,
        state,
        recordStatus,
        metadata,
        createdAt,
        updatedAt
      ];
}

extension SelcomPaymentExt on SelcomPayment {
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

class SelcomPaymentController extends ValueNotifier<SelcomPayment> {
  TextEditingController? idController;

  TextEditingController? transIdController;

  TextEditingController? amountController;

  TextEditingController? msisdnController;

  TextEditingController? operator$Controller;

  TextEditingController? referenceController;

  TextEditingController? resultCodeController;

  void Function(PaymentStatus value)? statusChanged;
  TextEditingController? utilityrefController;

  void Function(PaymentStatus value)? validationChanged;
  TransactionController? transactionController;
  void Function(Transaction value)? transactionChanged;

  void Function(PaymentStatus value)? stateChanged;
  void Function(RecordStatus value)? recordStatusChanged;
  TextEditingController? metadataController;

  TextEditingController? createdAtController;

  TextEditingController? updatedAtController;

  final SelcomPayment initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  SelcomPaymentController({
    required this.initialValue,
    required this.selectionSet,
    this.statusChanged,
    this.validationChanged,
    this.transactionChanged,
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
    if (isInSelectionSet('transId')) {
      transIdController =
          TextEditingController(text: "${initialValue.transId ?? ''}")
            ..addListener(() {
              value = value.copyWith(transId: transIdController?.text);
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
    if (isInSelectionSet('msisdn')) {
      msisdnController =
          TextEditingController(text: "${initialValue.msisdn ?? ''}")
            ..addListener(() {
              value = value.copyWith(msisdn: msisdnController?.text);
            });
    }
    if (isInSelectionSet('operator')) {
      operator$Controller =
          TextEditingController(text: "${initialValue.operator$ ?? ''}")
            ..addListener(() {
              value = value.copyWith(operator$: operator$Controller?.text);
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
    if (isInSelectionSet('utilityref')) {
      utilityrefController =
          TextEditingController(text: "${initialValue.utilityref ?? ''}")
            ..addListener(() {
              value = value.copyWith(
                  utilityref: int.tryParse(utilityrefController?.text ?? ''));
            });
    }
    if (isInSelectionSet('transaction')) {
      var selected = getSelectionNodeData('transaction')?.selectionSet;
      transactionController = TransactionController(
          initialValue: initialValue.transaction ?? Transaction(),
          selectionSet: selected!);
      transactionController?.addListener(() {
        var v = transactionController?.value;
        onTransactionChanged(v!);
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
    if (isInSelectionSet('transId')) {
      transIdController?.dispose();
    }
    if (isInSelectionSet('amount')) {
      amountController?.dispose();
    }
    if (isInSelectionSet('msisdn')) {
      msisdnController?.dispose();
    }
    if (isInSelectionSet('operator')) {
      operator$Controller?.dispose();
    }
    if (isInSelectionSet('reference')) {
      referenceController?.dispose();
    }
    if (isInSelectionSet('resultCode')) {
      resultCodeController?.dispose();
    }
    if (isInSelectionSet('utilityref')) {
      utilityrefController?.dispose();
    }
    if (isInSelectionSet('transaction')) {
      transactionController?.dispose();
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

  void onValidationChanged(PaymentStatus v) {
    if (value.validation != v) {
      value = value.copyWith(validation: v);
      validationChanged?.call(v);
    }
  }

  void onTransactionChanged(Transaction v) {
    if (value.transaction != v) {
      value = value.copyWith(transaction: v);
      transactionChanged?.call(v);
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
