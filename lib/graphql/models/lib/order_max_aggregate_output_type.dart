import 'record_status.dart';
import 'order_status.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class OrderMaxAggregateOutputType extends Equatable {
  final String? id;
  final int? quantity;
  final RecordStatus? recordStatus;
  final OrderStatus? orderStatus;
  final String? notes;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? ownerId;
  final String? receiptId;
  final String? serviceId;
  final String? businessId;
  OrderMaxAggregateOutputType(
      {this.id,
      this.quantity,
      this.recordStatus,
      this.orderStatus,
      this.notes,
      this.createdAt,
      this.updatedAt,
      this.ownerId,
      this.receiptId,
      this.serviceId,
      this.businessId});

  static OrderMaxAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return OrderMaxAggregateOutputType(
      id: json['id'],
      quantity: json['quantity'],
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      orderStatus: json['orderStatus'] != null
          ? OrderStatusExt.fromJson(json['orderStatus'])
          : null,
      notes: json['notes'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      ownerId: json['ownerId'],
      receiptId: json['receiptId'],
      serviceId: json['serviceId'],
      businessId: json['businessId'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (quantity != null) _data['quantity'] = quantity;
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (orderStatus != null) _data['orderStatus'] = orderStatus!.toJson();
    if (notes != null) _data['notes'] = notes;
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    if (ownerId != null) _data['ownerId'] = ownerId;
    if (receiptId != null) _data['receiptId'] = receiptId;
    if (serviceId != null) _data['serviceId'] = serviceId;
    if (businessId != null) _data['businessId'] = businessId;
    return _data;
  }

  OrderMaxAggregateOutputType copyWith(
      {String? id,
      int? quantity,
      RecordStatus? recordStatus,
      OrderStatus? orderStatus,
      String? notes,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? ownerId,
      String? receiptId,
      String? serviceId,
      String? businessId}) {
    return OrderMaxAggregateOutputType(
        id: id ?? this.id,
        quantity: quantity ?? this.quantity,
        recordStatus: recordStatus ?? this.recordStatus,
        orderStatus: orderStatus ?? this.orderStatus,
        notes: notes ?? this.notes,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        ownerId: ownerId ?? this.ownerId,
        receiptId: receiptId ?? this.receiptId,
        serviceId: serviceId ?? this.serviceId,
        businessId: businessId ?? this.businessId);
  }

  List<Object?> get props => [
        id,
        quantity,
        recordStatus,
        orderStatus,
        notes,
        createdAt,
        updatedAt,
        ownerId,
        receiptId,
        serviceId,
        businessId
      ];
}

extension OrderMaxAggregateOutputTypeExt on OrderMaxAggregateOutputType {
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

class OrderMaxAggregateOutputTypeController
    extends ValueNotifier<OrderMaxAggregateOutputType> {
  TextEditingController? idController;

  TextEditingController? quantityController;

  void Function(RecordStatus value)? recordStatusChanged;
  void Function(OrderStatus value)? orderStatusChanged;
  TextEditingController? notesController;

  TextEditingController? createdAtController;

  TextEditingController? updatedAtController;

  TextEditingController? ownerIdController;

  TextEditingController? receiptIdController;

  TextEditingController? serviceIdController;

  TextEditingController? businessIdController;

  final OrderMaxAggregateOutputType initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  OrderMaxAggregateOutputTypeController({
    required this.initialValue,
    required this.selectionSet,
    this.recordStatusChanged,
    this.orderStatusChanged,
  }) : super(initialValue) {
    initSelectionData();
    if (isInSelectionSet('id')) {
      idController = TextEditingController(text: "${initialValue.id ?? ''}")
        ..addListener(() {
          value = value.copyWith(id: idController?.text);
        });
    }
    if (isInSelectionSet('quantity')) {
      quantityController =
          TextEditingController(text: "${initialValue.quantity ?? ''}")
            ..addListener(() {
              value = value.copyWith(
                  quantity: int.tryParse(quantityController?.text ?? ''));
            });
    }
    if (isInSelectionSet('notes')) {
      notesController =
          TextEditingController(text: "${initialValue.notes ?? ''}")
            ..addListener(() {
              value = value.copyWith(notes: notesController?.text);
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
    if (isInSelectionSet('ownerId')) {
      ownerIdController =
          TextEditingController(text: "${initialValue.ownerId ?? ''}")
            ..addListener(() {
              value = value.copyWith(ownerId: ownerIdController?.text);
            });
    }
    if (isInSelectionSet('receiptId')) {
      receiptIdController =
          TextEditingController(text: "${initialValue.receiptId ?? ''}")
            ..addListener(() {
              value = value.copyWith(receiptId: receiptIdController?.text);
            });
    }
    if (isInSelectionSet('serviceId')) {
      serviceIdController =
          TextEditingController(text: "${initialValue.serviceId ?? ''}")
            ..addListener(() {
              value = value.copyWith(serviceId: serviceIdController?.text);
            });
    }
    if (isInSelectionSet('businessId')) {
      businessIdController =
          TextEditingController(text: "${initialValue.businessId ?? ''}")
            ..addListener(() {
              value = value.copyWith(businessId: businessIdController?.text);
            });
    }
  }
  @override
  dispose() {
    if (isInSelectionSet('id')) {
      idController?.dispose();
    }
    if (isInSelectionSet('quantity')) {
      quantityController?.dispose();
    }
    if (isInSelectionSet('notes')) {
      notesController?.dispose();
    }
    if (isInSelectionSet('createdAt')) {
      createdAtController?.dispose();
    }
    if (isInSelectionSet('updatedAt')) {
      updatedAtController?.dispose();
    }
    if (isInSelectionSet('ownerId')) {
      ownerIdController?.dispose();
    }
    if (isInSelectionSet('receiptId')) {
      receiptIdController?.dispose();
    }
    if (isInSelectionSet('serviceId')) {
      serviceIdController?.dispose();
    }
    if (isInSelectionSet('businessId')) {
      businessIdController?.dispose();
    }

    super.dispose();
  }

  void onRecordStatusChanged(RecordStatus v) {
    if (value.recordStatus != v) {
      value = value.copyWith(recordStatus: v);
      recordStatusChanged?.call(v);
    }
  }

  void onOrderStatusChanged(OrderStatus v) {
    if (value.orderStatus != v) {
      value = value.copyWith(orderStatus: v);
      orderStatusChanged?.call(v);
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
