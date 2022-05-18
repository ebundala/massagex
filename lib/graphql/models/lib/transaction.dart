import 'payment_method.dart';
import 'transaction_type.dart';
import 'order.dart';
import 'mpesa_payment.dart';
import 'selcom_payment.dart';
import 'selcom_disbursement.dart';
import 'transaction_status.dart';
import 'record_status.dart';
import 'scalars/json_object.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class Transaction extends Equatable {
  final String? id;
  final PaymentMethod? paymentMethod;
  final String? paymentMethodId;
  final TransactionType? type;
  final Order? order;
  final String? orderId;
  final MpesaPayment? mpesaPayment;
  final String? mpesaPaymentId;
  final SelcomPayment? selcomPayment;
  final String? selcomPaymentId;
  final SelcomDisbursement? selcomDisbursement;
  final String? selcomDisbursementId;
  final TransactionStatus? status;
  final RecordStatus? recordStatus;
  final JSONObject? metadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  Transaction(
      {this.id,
      this.paymentMethod,
      this.paymentMethodId,
      this.type,
      this.order,
      this.orderId,
      this.mpesaPayment,
      this.mpesaPaymentId,
      this.selcomPayment,
      this.selcomPaymentId,
      this.selcomDisbursement,
      this.selcomDisbursementId,
      this.status,
      this.recordStatus,
      this.metadata,
      this.createdAt,
      this.updatedAt});

  static Transaction fromJson(Map<dynamic, dynamic> json) {
    return Transaction(
      id: json['id'],
      paymentMethod: json['paymentMethod'] != null
          ? PaymentMethod.fromJson(json['paymentMethod'])
          : null,
      paymentMethodId: json['paymentMethodId'],
      type: json['type'] != null
          ? TransactionTypeExt.fromJson(json['type'])
          : null,
      order: json['order'] != null ? Order.fromJson(json['order']) : null,
      orderId: json['orderId'],
      mpesaPayment: json['mpesaPayment'] != null
          ? MpesaPayment.fromJson(json['mpesaPayment'])
          : null,
      mpesaPaymentId: json['mpesaPaymentId'],
      selcomPayment: json['selcomPayment'] != null
          ? SelcomPayment.fromJson(json['selcomPayment'])
          : null,
      selcomPaymentId: json['selcomPaymentId'],
      selcomDisbursement: json['selcomDisbursement'] != null
          ? SelcomDisbursement.fromJson(json['selcomDisbursement'])
          : null,
      selcomDisbursementId: json['selcomDisbursementId'],
      status: json['status'] != null
          ? TransactionStatusExt.fromJson(json['status'])
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
    if (paymentMethod != null) _data['paymentMethod'] = paymentMethod!.toJson();
    if (paymentMethodId != null) _data['paymentMethodId'] = paymentMethodId;
    if (type != null) _data['type'] = type!.toJson();
    if (order != null) _data['order'] = order!.toJson();
    if (orderId != null) _data['orderId'] = orderId;
    if (mpesaPayment != null) _data['mpesaPayment'] = mpesaPayment!.toJson();
    if (mpesaPaymentId != null) _data['mpesaPaymentId'] = mpesaPaymentId;
    if (selcomPayment != null) _data['selcomPayment'] = selcomPayment!.toJson();
    if (selcomPaymentId != null) _data['selcomPaymentId'] = selcomPaymentId;
    if (selcomDisbursement != null)
      _data['selcomDisbursement'] = selcomDisbursement!.toJson();
    if (selcomDisbursementId != null)
      _data['selcomDisbursementId'] = selcomDisbursementId;
    if (status != null) _data['status'] = status!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    return _data;
  }

  Transaction copyWith(
      {String? id,
      PaymentMethod? paymentMethod,
      String? paymentMethodId,
      TransactionType? type,
      Order? order,
      String? orderId,
      MpesaPayment? mpesaPayment,
      String? mpesaPaymentId,
      SelcomPayment? selcomPayment,
      String? selcomPaymentId,
      SelcomDisbursement? selcomDisbursement,
      String? selcomDisbursementId,
      TransactionStatus? status,
      RecordStatus? recordStatus,
      JSONObject? metadata,
      DateTime? createdAt,
      DateTime? updatedAt}) {
    return Transaction(
        id: id ?? this.id,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        paymentMethodId: paymentMethodId ?? this.paymentMethodId,
        type: type ?? this.type,
        order: order ?? this.order,
        orderId: orderId ?? this.orderId,
        mpesaPayment: mpesaPayment ?? this.mpesaPayment,
        mpesaPaymentId: mpesaPaymentId ?? this.mpesaPaymentId,
        selcomPayment: selcomPayment ?? this.selcomPayment,
        selcomPaymentId: selcomPaymentId ?? this.selcomPaymentId,
        selcomDisbursement: selcomDisbursement ?? this.selcomDisbursement,
        selcomDisbursementId: selcomDisbursementId ?? this.selcomDisbursementId,
        status: status ?? this.status,
        recordStatus: recordStatus ?? this.recordStatus,
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props => [
        id,
        paymentMethod,
        paymentMethodId,
        type,
        order,
        orderId,
        mpesaPayment,
        mpesaPaymentId,
        selcomPayment,
        selcomPaymentId,
        selcomDisbursement,
        selcomDisbursementId,
        status,
        recordStatus,
        metadata,
        createdAt,
        updatedAt
      ];
}

extension TransactionExt on Transaction {
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

class TransactionController extends ValueNotifier<Transaction> {
  TextEditingController? idController;

  PaymentMethodController? paymentMethodController;
  void Function(PaymentMethod value)? paymentMethodChanged;

  TextEditingController? paymentMethodIdController;

  void Function(TransactionType value)? typeChanged;
  OrderController? orderController;
  void Function(Order value)? orderChanged;

  TextEditingController? orderIdController;

  MpesaPaymentController? mpesaPaymentController;
  void Function(MpesaPayment value)? mpesaPaymentChanged;

  TextEditingController? mpesaPaymentIdController;

  SelcomPaymentController? selcomPaymentController;
  void Function(SelcomPayment value)? selcomPaymentChanged;

  TextEditingController? selcomPaymentIdController;

  SelcomDisbursementController? selcomDisbursementController;
  void Function(SelcomDisbursement value)? selcomDisbursementChanged;

  TextEditingController? selcomDisbursementIdController;

  void Function(TransactionStatus value)? statusChanged;
  void Function(RecordStatus value)? recordStatusChanged;
  TextEditingController? metadataController;

  TextEditingController? createdAtController;

  TextEditingController? updatedAtController;

  final Transaction initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  TransactionController({
    required this.initialValue,
    required this.selectionSet,
    this.paymentMethodChanged,
    this.typeChanged,
    this.orderChanged,
    this.mpesaPaymentChanged,
    this.selcomPaymentChanged,
    this.selcomDisbursementChanged,
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
    if (isInSelectionSet('paymentMethod')) {
      var selected = getSelectionNodeData('paymentMethod')?.selectionSet;
      paymentMethodController = PaymentMethodController(
          initialValue: initialValue.paymentMethod ?? PaymentMethod(),
          selectionSet: selected!);
      paymentMethodController?.addListener(() {
        var v = paymentMethodController?.value;
        onPaymentMethodChanged(v!);
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
    if (isInSelectionSet('order')) {
      var selected = getSelectionNodeData('order')?.selectionSet;
      orderController = OrderController(
          initialValue: initialValue.order ?? Order(), selectionSet: selected!);
      orderController?.addListener(() {
        var v = orderController?.value;
        onOrderChanged(v!);
      });
    }
    if (isInSelectionSet('orderId')) {
      orderIdController =
          TextEditingController(text: "${initialValue.orderId ?? ''}")
            ..addListener(() {
              value = value.copyWith(orderId: orderIdController?.text);
            });
    }
    if (isInSelectionSet('mpesaPayment')) {
      var selected = getSelectionNodeData('mpesaPayment')?.selectionSet;
      mpesaPaymentController = MpesaPaymentController(
          initialValue: initialValue.mpesaPayment ?? MpesaPayment(),
          selectionSet: selected!);
      mpesaPaymentController?.addListener(() {
        var v = mpesaPaymentController?.value;
        onMpesaPaymentChanged(v!);
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
    if (isInSelectionSet('selcomPayment')) {
      var selected = getSelectionNodeData('selcomPayment')?.selectionSet;
      selcomPaymentController = SelcomPaymentController(
          initialValue: initialValue.selcomPayment ?? SelcomPayment(),
          selectionSet: selected!);
      selcomPaymentController?.addListener(() {
        var v = selcomPaymentController?.value;
        onSelcomPaymentChanged(v!);
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
    if (isInSelectionSet('selcomDisbursement')) {
      var selected = getSelectionNodeData('selcomDisbursement')?.selectionSet;
      selcomDisbursementController = SelcomDisbursementController(
          initialValue: initialValue.selcomDisbursement ?? SelcomDisbursement(),
          selectionSet: selected!);
      selcomDisbursementController?.addListener(() {
        var v = selcomDisbursementController?.value;
        onSelcomDisbursementChanged(v!);
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
    if (isInSelectionSet('paymentMethod')) {
      paymentMethodController?.dispose();
    }
    if (isInSelectionSet('paymentMethodId')) {
      paymentMethodIdController?.dispose();
    }
    if (isInSelectionSet('order')) {
      orderController?.dispose();
    }
    if (isInSelectionSet('orderId')) {
      orderIdController?.dispose();
    }
    if (isInSelectionSet('mpesaPayment')) {
      mpesaPaymentController?.dispose();
    }
    if (isInSelectionSet('mpesaPaymentId')) {
      mpesaPaymentIdController?.dispose();
    }
    if (isInSelectionSet('selcomPayment')) {
      selcomPaymentController?.dispose();
    }
    if (isInSelectionSet('selcomPaymentId')) {
      selcomPaymentIdController?.dispose();
    }
    if (isInSelectionSet('selcomDisbursement')) {
      selcomDisbursementController?.dispose();
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

  void onPaymentMethodChanged(PaymentMethod v) {
    if (value.paymentMethod != v) {
      value = value.copyWith(paymentMethod: v);
      paymentMethodChanged?.call(v);
    }
  }

  void onTypeChanged(TransactionType v) {
    if (value.type != v) {
      value = value.copyWith(type: v);
      typeChanged?.call(v);
    }
  }

  void onOrderChanged(Order v) {
    if (value.order != v) {
      value = value.copyWith(order: v);
      orderChanged?.call(v);
    }
  }

  void onMpesaPaymentChanged(MpesaPayment v) {
    if (value.mpesaPayment != v) {
      value = value.copyWith(mpesaPayment: v);
      mpesaPaymentChanged?.call(v);
    }
  }

  void onSelcomPaymentChanged(SelcomPayment v) {
    if (value.selcomPayment != v) {
      value = value.copyWith(selcomPayment: v);
      selcomPaymentChanged?.call(v);
    }
  }

  void onSelcomDisbursementChanged(SelcomDisbursement v) {
    if (value.selcomDisbursement != v) {
      value = value.copyWith(selcomDisbursement: v);
      selcomDisbursementChanged?.call(v);
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
