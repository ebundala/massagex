import 'attachment.dart';
import 'selcom_utility_code.dart';
import 'transaction.dart';
import 'record_status.dart';
import 'payment_method_status.dart';
import 'scalars/json_object.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class PaymentMethod extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final Attachment? logo;
  final String? attachmentId;
  final SelcomUtilityCode? code;
  final List<Transaction>? transactions;
  final RecordStatus? recordStatus;
  final PaymentMethodStatus? status;
  final JSONObject? metadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  PaymentMethod(
      {this.id,
      this.name,
      this.description,
      this.logo,
      this.attachmentId,
      this.code,
      this.transactions,
      this.recordStatus,
      this.status,
      this.metadata,
      this.createdAt,
      this.updatedAt});

  static PaymentMethod fromJson(Map<dynamic, dynamic> json) {
    return PaymentMethod(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      logo: json['logo'] != null ? Attachment.fromJson(json['logo']) : null,
      attachmentId: json['attachmentId'],
      code: json['code'] != null
          ? SelcomUtilityCodeExt.fromJson(json['code'])
          : null,
      transactions: json['transactions'] != null
          ? List.generate(json['transactions'].length,
              (index) => Transaction.fromJson(json['transactions'][index]))
          : null,
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      status: json['status'] != null
          ? PaymentMethodStatusExt.fromJson(json['status'])
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
    if (name != null) _data['name'] = name;
    if (description != null) _data['description'] = description;
    if (logo != null) _data['logo'] = logo!.toJson();
    if (attachmentId != null) _data['attachmentId'] = attachmentId;
    if (code != null) _data['code'] = code!.toJson();
    if (transactions != null)
      _data['transactions'] = List.generate(
          transactions?.length ?? 0, (index) => transactions![index].toJson());
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (status != null) _data['status'] = status!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    return _data;
  }

  PaymentMethod copyWith(
      {String? id,
      String? name,
      String? description,
      Attachment? logo,
      String? attachmentId,
      SelcomUtilityCode? code,
      List<Transaction>? transactions,
      RecordStatus? recordStatus,
      PaymentMethodStatus? status,
      JSONObject? metadata,
      DateTime? createdAt,
      DateTime? updatedAt}) {
    return PaymentMethod(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        logo: logo ?? this.logo,
        attachmentId: attachmentId ?? this.attachmentId,
        code: code ?? this.code,
        transactions: transactions ?? this.transactions,
        recordStatus: recordStatus ?? this.recordStatus,
        status: status ?? this.status,
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props => [
        id,
        name,
        description,
        logo,
        attachmentId,
        code,
        List.from(transactions ?? []),
        recordStatus,
        status,
        metadata,
        createdAt,
        updatedAt
      ];
}

extension PaymentMethodExt on PaymentMethod {
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

class PaymentMethodController extends ValueNotifier<PaymentMethod> {
  TextEditingController? idController;

  TextEditingController? nameController;

  TextEditingController? descriptionController;

  AttachmentController? logoController;
  void Function(Attachment value)? logoChanged;

  TextEditingController? attachmentIdController;

  void Function(SelcomUtilityCode value)? codeChanged;
  final Map<String, Transaction> updatedTransactions = {};
  final Map<String, Transaction> deletedTransactions = {};
  void Function(Transaction value)? transactionsChanged;
  void Function(Transaction value)? transactionsRemoved;
  // Transaction controllers
  final Map<String, TransactionController> transactionsController = {};

  void Function(RecordStatus value)? recordStatusChanged;
  void Function(PaymentMethodStatus value)? statusChanged;
  TextEditingController? metadataController;

  TextEditingController? createdAtController;

  TextEditingController? updatedAtController;

  final PaymentMethod initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  PaymentMethodController({
    required this.initialValue,
    required this.selectionSet,
    this.logoChanged,
    this.codeChanged,
    this.transactionsChanged,
    this.transactionsRemoved,
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
    if (isInSelectionSet('logo')) {
      var selected = getSelectionNodeData('logo')?.selectionSet;
      logoController = AttachmentController(
          initialValue: initialValue.logo ?? Attachment(),
          selectionSet: selected!);
      logoController?.addListener(() {
        var v = logoController?.value;
        onLogoChanged(v!);
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
    if (isInSelectionSet('transactions')) {
      if (initialValue.transactions?.isNotEmpty == true) {
        var selection = getSelectionNodeData('transactions')?.selectionSet;
        transactionsController.clear();
        var values = initialValue.transactions
            ?.map<MapEntry<String, TransactionController>>((e) {
          var controller =
              TransactionController(initialValue: e, selectionSet: selection!);
          controller.addListener(() {
            onTransactionsChanged(controller.value);
          });
          return MapEntry<String, TransactionController>(e.id!, controller);
        });
        transactionsController.addEntries(values ?? Iterable.empty());
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
    if (isInSelectionSet('name')) {
      nameController?.dispose();
    }
    if (isInSelectionSet('description')) {
      descriptionController?.dispose();
    }
    if (isInSelectionSet('logo')) {
      logoController?.dispose();
    }
    if (isInSelectionSet('attachmentId')) {
      attachmentIdController?.dispose();
    }
    if (isInSelectionSet('transactions')) {
      transactionsController.values.map((v) => v.dispose()).toList();
    }
    if (isInSelectionSet('createdAt')) {
      createdAtController?.dispose();
    }
    if (isInSelectionSet('updatedAt')) {
      updatedAtController?.dispose();
    }

    super.dispose();
  }

  void onLogoChanged(Attachment v) {
    if (value.logo != v) {
      value = value.copyWith(logo: v);
      logoChanged?.call(v);
    }
  }

  void onCodeChanged(SelcomUtilityCode v) {
    if (value.code != v) {
      value = value.copyWith(code: v);
      codeChanged?.call(v);
    }
  }

  void onTransactionsChanged(Transaction v) {
    updatedTransactions[v.id!] = v;
    var i = value.transactions?.indexWhere((e) => e.id == v.id) ?? -1;
    var list = List<Transaction>.from(value.transactions ?? []);
    if (i >= 0) {
      list[i] = v;
    } else {
      list.add(v);
      var selection = getSelectionNodeData("transactions")?.selectionSet;
      transactionsController[v.id!] =
          TransactionController(initialValue: v, selectionSet: selection!);
    }
    value = value.copyWith(transactions: list);

    transactionsChanged?.call(v);
  }

  void onTransactionsRemoved(Transaction v) {
    if (!v.isNew) {
      deletedTransactions[v.id!] = v;
    }
    updatedTransactions.remove(v.id!);
    transactionsController.remove(v.id!);
    value = value.copyWith(
        transactions:
            value.transactions?.where((e) => e.id != v.id).toList() ?? []);

    transactionsRemoved?.call(v);
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
