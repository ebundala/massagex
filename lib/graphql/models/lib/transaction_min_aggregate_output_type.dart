import 'transaction_type.dart';
import 'transaction_status.dart';
import 'record_status.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class TransactionMinAggregateOutputType extends Equatable {
  final String? id;
  final String? paymentMethodId;
  final TransactionType? type;
  final String? orderId;
  final String? mpesaPaymentId;
  final String? selcomPaymentId;
  final String? selcomDisbursementId;
  final TransactionStatus? status;
  final RecordStatus? recordStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  TransactionMinAggregateOutputType(
      {this.id,
      this.paymentMethodId,
      this.type,
      this.orderId,
      this.mpesaPaymentId,
      this.selcomPaymentId,
      this.selcomDisbursementId,
      this.status,
      this.recordStatus,
      this.createdAt,
      this.updatedAt});

  static TransactionMinAggregateOutputType fromJson(
      Map<dynamic, dynamic> json) {
    return TransactionMinAggregateOutputType(
      id: json['id'],
      paymentMethodId: json['paymentMethodId'],
      type: json['type'] != null
          ? TransactionTypeExt.fromJson(json['type'])
          : null,
      orderId: json['orderId'],
      mpesaPaymentId: json['mpesaPaymentId'],
      selcomPaymentId: json['selcomPaymentId'],
      selcomDisbursementId: json['selcomDisbursementId'],
      status: json['status'] != null
          ? TransactionStatusExt.fromJson(json['status'])
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
    if (paymentMethodId != null) _data['paymentMethodId'] = paymentMethodId;
    if (type != null) _data['type'] = type!.toJson();
    if (orderId != null) _data['orderId'] = orderId;
    if (mpesaPaymentId != null) _data['mpesaPaymentId'] = mpesaPaymentId;
    if (selcomPaymentId != null) _data['selcomPaymentId'] = selcomPaymentId;
    if (selcomDisbursementId != null)
      _data['selcomDisbursementId'] = selcomDisbursementId;
    if (status != null) _data['status'] = status!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    return _data;
  }

  TransactionMinAggregateOutputType copyWith(
      {String? id,
      String? paymentMethodId,
      TransactionType? type,
      String? orderId,
      String? mpesaPaymentId,
      String? selcomPaymentId,
      String? selcomDisbursementId,
      TransactionStatus? status,
      RecordStatus? recordStatus,
      DateTime? createdAt,
      DateTime? updatedAt}) {
    return TransactionMinAggregateOutputType(
        id: id ?? this.id,
        paymentMethodId: paymentMethodId ?? this.paymentMethodId,
        type: type ?? this.type,
        orderId: orderId ?? this.orderId,
        mpesaPaymentId: mpesaPaymentId ?? this.mpesaPaymentId,
        selcomPaymentId: selcomPaymentId ?? this.selcomPaymentId,
        selcomDisbursementId: selcomDisbursementId ?? this.selcomDisbursementId,
        status: status ?? this.status,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props => [
        id,
        paymentMethodId,
        type,
        orderId,
        mpesaPaymentId,
        selcomPaymentId,
        selcomDisbursementId,
        status,
        recordStatus,
        createdAt,
        updatedAt
      ];
}

extension TransactionMinAggregateOutputTypeExt
    on TransactionMinAggregateOutputType {
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

class TransactionMinAggregateOutputTypeController
    extends ValueNotifier<TransactionMinAggregateOutputType> {
  TextEditingController? idController;

  TextEditingController? paymentMethodIdController;

  void Function(TransactionType value)? typeChanged;
  TextEditingController? orderIdController;

  TextEditingController? mpesaPaymentIdController;

  TextEditingController? selcomPaymentIdController;

  TextEditingController? selcomDisbursementIdController;

  void Function(TransactionStatus value)? statusChanged;
  void Function(RecordStatus value)? recordStatusChanged;
  TextEditingController? createdAtController;

  TextEditingController? updatedAtController;

  final TransactionMinAggregateOutputType initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  TransactionMinAggregateOutputTypeController({
    required this.initialValue,
    required this.selectionSet,
    this.typeChanged,
    this.statusChanged,
    this.recordStatusChanged,
  }) : super(initialValue) {
    initSelectionData();
    if (isInSelectionSet('id')) {
      idController = TextEditingController(text: "${initialValue.id ?? ''}")
        ..addListener(() {
          value = value.copyWith(id: idController?.text);
        });
    }
    if (isInSelectionSet('paymentMethodId')) {
      paymentMethodIdController = TextEditingController(
          text: "${initialValue.paymentMethodId ?? ''}")
        ..addListener(() {
          value =
              value.copyWith(paymentMethodId: paymentMethodIdController?.text);
        });
    }
    if (isInSelectionSet('orderId')) {
      orderIdController =
          TextEditingController(text: "${initialValue.orderId ?? ''}")
            ..addListener(() {
              value = value.copyWith(orderId: orderIdController?.text);
            });
    }
    if (isInSelectionSet('mpesaPaymentId')) {
      mpesaPaymentIdController = TextEditingController(
          text: "${initialValue.mpesaPaymentId ?? ''}")
        ..addListener(() {
          value =
              value.copyWith(mpesaPaymentId: mpesaPaymentIdController?.text);
        });
    }
    if (isInSelectionSet('selcomPaymentId')) {
      selcomPaymentIdController = TextEditingController(
          text: "${initialValue.selcomPaymentId ?? ''}")
        ..addListener(() {
          value =
              value.copyWith(selcomPaymentId: selcomPaymentIdController?.text);
        });
    }
    if (isInSelectionSet('selcomDisbursementId')) {
      selcomDisbursementIdController = TextEditingController(
          text: "${initialValue.selcomDisbursementId ?? ''}")
        ..addListener(() {
          value = value.copyWith(
              selcomDisbursementId: selcomDisbursementIdController?.text);
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
    if (isInSelectionSet('paymentMethodId')) {
      paymentMethodIdController?.dispose();
    }
    if (isInSelectionSet('orderId')) {
      orderIdController?.dispose();
    }
    if (isInSelectionSet('mpesaPaymentId')) {
      mpesaPaymentIdController?.dispose();
    }
    if (isInSelectionSet('selcomPaymentId')) {
      selcomPaymentIdController?.dispose();
    }
    if (isInSelectionSet('selcomDisbursementId')) {
      selcomDisbursementIdController?.dispose();
    }
    if (isInSelectionSet('createdAt')) {
      createdAtController?.dispose();
    }
    if (isInSelectionSet('updatedAt')) {
      updatedAtController?.dispose();
    }

    super.dispose();
  }

  void onTypeChanged(TransactionType v) {
    if (value.type != v) {
      value = value.copyWith(type: v);
      typeChanged?.call(v);
    }
  }

  void onStatusChanged(TransactionStatus v) {
    if (value.status != v) {
      value = value.copyWith(status: v);
      statusChanged?.call(v);
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
