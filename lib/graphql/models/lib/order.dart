import 'record_status.dart';
import 'order_status.dart';
import 'scalars/json_object.dart';
import 'user.dart';
import 'attachment.dart';
import 'service.dart';
import 'transaction.dart';
import 'business.dart';
import 'abuse_report.dart';
import 'favorite.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class Order extends Equatable {
  final bool? isFavorited;
  final bool? isExpired;
  final String? id;
  final int? quantity;
  final RecordStatus? recordStatus;
  final OrderStatus? orderStatus;
  final String? notes;
  final JSONObject? metadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? ownerId;
  final String? receiptId;
  final User? owner;
  final Attachment? receipt;
  final Service? service;
  final String? serviceId;
  final List<Transaction>? transactions;
  final Business? business;
  final String? businessId;
  final List<AbuseReport>? abuseReports;
  final List<Favorite>? favorites;
  Order(
      {this.isFavorited,
      this.isExpired,
      this.id,
      this.quantity,
      this.recordStatus,
      this.orderStatus,
      this.notes,
      this.metadata,
      this.createdAt,
      this.updatedAt,
      this.ownerId,
      this.receiptId,
      this.owner,
      this.receipt,
      this.service,
      this.serviceId,
      this.transactions,
      this.business,
      this.businessId,
      this.abuseReports,
      this.favorites});

  static Order fromJson(Map<dynamic, dynamic> json) {
    return Order(
      isFavorited: json['isFavorited'],
      isExpired: json['isExpired'],
      id: json['id'],
      quantity: json['quantity'],
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      orderStatus: json['orderStatus'] != null
          ? OrderStatusExt.fromJson(json['orderStatus'])
          : null,
      notes: json['notes'],
      metadata: json['metadata'] != null
          ? JSONObject.fromJson(json['metadata'])
          : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      ownerId: json['ownerId'],
      receiptId: json['receiptId'],
      owner: json['owner'] != null ? User.fromJson(json['owner']) : null,
      receipt:
          json['receipt'] != null ? Attachment.fromJson(json['receipt']) : null,
      service:
          json['service'] != null ? Service.fromJson(json['service']) : null,
      serviceId: json['serviceId'],
      transactions: json['transactions'] != null
          ? List.generate(json['transactions'].length,
              (index) => Transaction.fromJson(json['transactions'][index]))
          : null,
      business:
          json['business'] != null ? Business.fromJson(json['business']) : null,
      businessId: json['businessId'],
      abuseReports: json['abuseReports'] != null
          ? List.generate(json['abuseReports'].length,
              (index) => AbuseReport.fromJson(json['abuseReports'][index]))
          : null,
      favorites: json['favorites'] != null
          ? List.generate(json['favorites'].length,
              (index) => Favorite.fromJson(json['favorites'][index]))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (isFavorited != null) _data['isFavorited'] = isFavorited;
    if (isExpired != null) _data['isExpired'] = isExpired;
    if (id != null) _data['id'] = id;
    if (quantity != null) _data['quantity'] = quantity;
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (orderStatus != null) _data['orderStatus'] = orderStatus!.toJson();
    if (notes != null) _data['notes'] = notes;
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    if (ownerId != null) _data['ownerId'] = ownerId;
    if (receiptId != null) _data['receiptId'] = receiptId;
    if (owner != null) _data['owner'] = owner!.toJson();
    if (receipt != null) _data['receipt'] = receipt!.toJson();
    if (service != null) _data['service'] = service!.toJson();
    if (serviceId != null) _data['serviceId'] = serviceId;
    if (transactions != null)
      _data['transactions'] = List.generate(
          transactions?.length ?? 0, (index) => transactions![index].toJson());
    if (business != null) _data['business'] = business!.toJson();
    if (businessId != null) _data['businessId'] = businessId;
    if (abuseReports != null)
      _data['abuseReports'] = List.generate(
          abuseReports?.length ?? 0, (index) => abuseReports![index].toJson());
    if (favorites != null)
      _data['favorites'] = List.generate(
          favorites?.length ?? 0, (index) => favorites![index].toJson());
    return _data;
  }

  Order copyWith(
      {bool? isFavorited,
      bool? isExpired,
      String? id,
      int? quantity,
      RecordStatus? recordStatus,
      OrderStatus? orderStatus,
      String? notes,
      JSONObject? metadata,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? ownerId,
      String? receiptId,
      User? owner,
      Attachment? receipt,
      Service? service,
      String? serviceId,
      List<Transaction>? transactions,
      Business? business,
      String? businessId,
      List<AbuseReport>? abuseReports,
      List<Favorite>? favorites}) {
    return Order(
        isFavorited: isFavorited ?? this.isFavorited,
        isExpired: isExpired ?? this.isExpired,
        id: id ?? this.id,
        quantity: quantity ?? this.quantity,
        recordStatus: recordStatus ?? this.recordStatus,
        orderStatus: orderStatus ?? this.orderStatus,
        notes: notes ?? this.notes,
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        ownerId: ownerId ?? this.ownerId,
        receiptId: receiptId ?? this.receiptId,
        owner: owner ?? this.owner,
        receipt: receipt ?? this.receipt,
        service: service ?? this.service,
        serviceId: serviceId ?? this.serviceId,
        transactions: transactions ?? this.transactions,
        business: business ?? this.business,
        businessId: businessId ?? this.businessId,
        abuseReports: abuseReports ?? this.abuseReports,
        favorites: favorites ?? this.favorites);
  }

  List<Object?> get props => [
        isFavorited,
        isExpired,
        id,
        quantity,
        recordStatus,
        orderStatus,
        notes,
        metadata,
        createdAt,
        updatedAt,
        ownerId,
        receiptId,
        owner,
        receipt,
        service,
        serviceId,
        List.from(transactions ?? []),
        business,
        businessId,
        List.from(abuseReports ?? []),
        List.from(favorites ?? [])
      ];
}

extension OrderExt on Order {
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

class OrderController extends ValueNotifier<Order> {
  TextEditingController? isFavoritedController;

  TextEditingController? isExpiredController;

  TextEditingController? idController;

  TextEditingController? quantityController;

  void Function(RecordStatus value)? recordStatusChanged;
  void Function(OrderStatus value)? orderStatusChanged;
  TextEditingController? notesController;

  TextEditingController? metadataController;

  TextEditingController? createdAtController;

  TextEditingController? updatedAtController;

  TextEditingController? ownerIdController;

  TextEditingController? receiptIdController;

  UserController? ownerController;
  void Function(User value)? ownerChanged;

  AttachmentController? receiptController;
  void Function(Attachment value)? receiptChanged;

  ServiceController? serviceController;
  void Function(Service value)? serviceChanged;

  TextEditingController? serviceIdController;

  final Map<String, Transaction> updatedTransactions = {};
  final Map<String, Transaction> deletedTransactions = {};
  void Function(Transaction value)? transactionsChanged;
  void Function(Transaction value)? transactionsRemoved;
  // Transaction controllers
  final Map<String, TransactionController> transactionsController = {};

  BusinessController? businessController;
  void Function(Business value)? businessChanged;

  TextEditingController? businessIdController;

  final Map<String, AbuseReport> updatedAbuseReports = {};
  final Map<String, AbuseReport> deletedAbuseReports = {};
  void Function(AbuseReport value)? abuseReportsChanged;
  void Function(AbuseReport value)? abuseReportsRemoved;
  // AbuseReport controllers
  final Map<String, AbuseReportController> abuseReportsController = {};

  final Map<String, Favorite> updatedFavorites = {};
  final Map<String, Favorite> deletedFavorites = {};
  void Function(Favorite value)? favoritesChanged;
  void Function(Favorite value)? favoritesRemoved;
  // Favorite controllers
  final Map<String, FavoriteController> favoritesController = {};

  final Order initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  OrderController({
    required this.initialValue,
    required this.selectionSet,
    this.recordStatusChanged,
    this.orderStatusChanged,
    this.ownerChanged,
    this.receiptChanged,
    this.serviceChanged,
    this.transactionsChanged,
    this.transactionsRemoved,
    this.businessChanged,
    this.abuseReportsChanged,
    this.abuseReportsRemoved,
    this.favoritesChanged,
    this.favoritesRemoved,
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
    if (isInSelectionSet('owner')) {
      var selected = getSelectionNodeData('owner')?.selectionSet;
      ownerController = UserController(
          initialValue: initialValue.owner ?? User(), selectionSet: selected!);
      ownerController?.addListener(() {
        var v = ownerController?.value;
        onOwnerChanged(v!);
      });
    }
    if (isInSelectionSet('receipt')) {
      var selected = getSelectionNodeData('receipt')?.selectionSet;
      receiptController = AttachmentController(
          initialValue: initialValue.receipt ?? Attachment(),
          selectionSet: selected!);
      receiptController?.addListener(() {
        var v = receiptController?.value;
        onReceiptChanged(v!);
      });
    }
    if (isInSelectionSet('service')) {
      var selected = getSelectionNodeData('service')?.selectionSet;
      serviceController = ServiceController(
          initialValue: initialValue.service ?? Service(),
          selectionSet: selected!);
      serviceController?.addListener(() {
        var v = serviceController?.value;
        onServiceChanged(v!);
      });
    }
    if (isInSelectionSet('serviceId')) {
      serviceIdController =
          TextEditingController(text: "${initialValue.serviceId ?? ''}")
            ..addListener(() {
              value = value.copyWith(serviceId: serviceIdController?.text);
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
    if (isInSelectionSet('business')) {
      var selected = getSelectionNodeData('business')?.selectionSet;
      businessController = BusinessController(
          initialValue: initialValue.business ?? Business(),
          selectionSet: selected!);
      businessController?.addListener(() {
        var v = businessController?.value;
        onBusinessChanged(v!);
      });
    }
    if (isInSelectionSet('businessId')) {
      businessIdController =
          TextEditingController(text: "${initialValue.businessId ?? ''}")
            ..addListener(() {
              value = value.copyWith(businessId: businessIdController?.text);
            });
    }
    if (isInSelectionSet('abuseReports')) {
      if (initialValue.abuseReports?.isNotEmpty == true) {
        var selection = getSelectionNodeData('abuseReports')?.selectionSet;
        abuseReportsController.clear();
        var values = initialValue.abuseReports
            ?.map<MapEntry<String, AbuseReportController>>((e) {
          var controller =
              AbuseReportController(initialValue: e, selectionSet: selection!);
          controller.addListener(() {
            onAbuseReportsChanged(controller.value);
          });
          return MapEntry<String, AbuseReportController>(e.id!, controller);
        });
        abuseReportsController.addEntries(values ?? Iterable.empty());
      }
    }
    if (isInSelectionSet('favorites')) {
      if (initialValue.favorites?.isNotEmpty == true) {
        var selection = getSelectionNodeData('favorites')?.selectionSet;
        favoritesController.clear();
        var values = initialValue.favorites
            ?.map<MapEntry<String, FavoriteController>>((e) {
          var controller =
              FavoriteController(initialValue: e, selectionSet: selection!);
          controller.addListener(() {
            onFavoritesChanged(controller.value);
          });
          return MapEntry<String, FavoriteController>(e.id!, controller);
        });
        favoritesController.addEntries(values ?? Iterable.empty());
      }
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
    if (isInSelectionSet('owner')) {
      ownerController?.dispose();
    }
    if (isInSelectionSet('receipt')) {
      receiptController?.dispose();
    }
    if (isInSelectionSet('service')) {
      serviceController?.dispose();
    }
    if (isInSelectionSet('serviceId')) {
      serviceIdController?.dispose();
    }
    if (isInSelectionSet('transactions')) {
      transactionsController.values.map((v) => v.dispose()).toList();
    }
    if (isInSelectionSet('business')) {
      businessController?.dispose();
    }
    if (isInSelectionSet('businessId')) {
      businessIdController?.dispose();
    }
    if (isInSelectionSet('abuseReports')) {
      abuseReportsController.values.map((v) => v.dispose()).toList();
    }
    if (isInSelectionSet('favorites')) {
      favoritesController.values.map((v) => v.dispose()).toList();
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

  void onOwnerChanged(User v) {
    if (value.owner != v) {
      value = value.copyWith(owner: v);
      ownerChanged?.call(v);
    }
  }

  void onReceiptChanged(Attachment v) {
    if (value.receipt != v) {
      value = value.copyWith(receipt: v);
      receiptChanged?.call(v);
    }
  }

  void onServiceChanged(Service v) {
    if (value.service != v) {
      value = value.copyWith(service: v);
      serviceChanged?.call(v);
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

  void onBusinessChanged(Business v) {
    if (value.business != v) {
      value = value.copyWith(business: v);
      businessChanged?.call(v);
    }
  }

  void onAbuseReportsChanged(AbuseReport v) {
    updatedAbuseReports[v.id!] = v;
    var i = value.abuseReports?.indexWhere((e) => e.id == v.id) ?? -1;
    var list = List<AbuseReport>.from(value.abuseReports ?? []);
    if (i >= 0) {
      list[i] = v;
    } else {
      list.add(v);
      var selection = getSelectionNodeData("abuseReports")?.selectionSet;
      abuseReportsController[v.id!] =
          AbuseReportController(initialValue: v, selectionSet: selection!);
    }
    value = value.copyWith(abuseReports: list);

    abuseReportsChanged?.call(v);
  }

  void onAbuseReportsRemoved(AbuseReport v) {
    if (!v.isNew) {
      deletedAbuseReports[v.id!] = v;
    }
    updatedAbuseReports.remove(v.id!);
    abuseReportsController.remove(v.id!);
    value = value.copyWith(
        abuseReports:
            value.abuseReports?.where((e) => e.id != v.id).toList() ?? []);

    abuseReportsRemoved?.call(v);
  }

  void onFavoritesChanged(Favorite v) {
    updatedFavorites[v.id!] = v;
    var i = value.favorites?.indexWhere((e) => e.id == v.id) ?? -1;
    var list = List<Favorite>.from(value.favorites ?? []);
    if (i >= 0) {
      list[i] = v;
    } else {
      list.add(v);
      var selection = getSelectionNodeData("favorites")?.selectionSet;
      favoritesController[v.id!] =
          FavoriteController(initialValue: v, selectionSet: selection!);
    }
    value = value.copyWith(favorites: list);

    favoritesChanged?.call(v);
  }

  void onFavoritesRemoved(Favorite v) {
    if (!v.isNew) {
      deletedFavorites[v.id!] = v;
    }
    updatedFavorites.remove(v.id!);
    favoritesController.remove(v.id!);
    value = value.copyWith(
        favorites: value.favorites?.where((e) => e.id != v.id).toList() ?? []);

    favoritesRemoved?.call(v);
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
