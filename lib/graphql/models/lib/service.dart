import 'scalars/json_object.dart';
import 'record_status.dart';
import 'category.dart';
import 'attachment.dart';
import 'business.dart';
import 'order.dart';
import 'abuse_report.dart';
import 'favorite.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class Service extends Equatable {
  final bool? isFavorited;
  final String? id;
  final String? name;
  final String? description;
  final double? price;
  final JSONObject? metadata;
  final String? currency;
  final RecordStatus? recordStatus;
  final Category? category;
  final String? categoryId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? imageId;
  final Attachment? image;
  final Business? business;
  final String? businessId;
  final List<Order>? orders;
  final List<AbuseReport>? abuseReports;
  final List<Favorite>? favorites;
  Service(
      {this.isFavorited,
      this.id,
      this.name,
      this.description,
      this.price,
      this.metadata,
      this.currency,
      this.recordStatus,
      this.category,
      this.categoryId,
      this.createdAt,
      this.updatedAt,
      this.imageId,
      this.image,
      this.business,
      this.businessId,
      this.orders,
      this.abuseReports,
      this.favorites});

  static Service fromJson(Map<dynamic, dynamic> json) {
    return Service(
      isFavorited: json['isFavorited'],
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price']?.toDouble(),
      metadata: json['metadata'] != null
          ? JSONObject.fromJson(json['metadata'])
          : null,
      currency: json['currency'],
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      category:
          json['category'] != null ? Category.fromJson(json['category']) : null,
      categoryId: json['categoryId'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      imageId: json['imageId'],
      image: json['image'] != null ? Attachment.fromJson(json['image']) : null,
      business:
          json['business'] != null ? Business.fromJson(json['business']) : null,
      businessId: json['businessId'],
      orders: json['orders'] != null
          ? List.generate(json['orders'].length,
              (index) => Order.fromJson(json['orders'][index]))
          : null,
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
    if (id != null) _data['id'] = id;
    if (name != null) _data['name'] = name;
    if (description != null) _data['description'] = description;
    if (price != null) _data['price'] = price;
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (currency != null) _data['currency'] = currency;
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (category != null) _data['category'] = category!.toJson();
    if (categoryId != null) _data['categoryId'] = categoryId;
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    if (imageId != null) _data['imageId'] = imageId;
    if (image != null) _data['image'] = image!.toJson();
    if (business != null) _data['business'] = business!.toJson();
    if (businessId != null) _data['businessId'] = businessId;
    if (orders != null)
      _data['orders'] = List.generate(
          orders?.length ?? 0, (index) => orders![index].toJson());
    if (abuseReports != null)
      _data['abuseReports'] = List.generate(
          abuseReports?.length ?? 0, (index) => abuseReports![index].toJson());
    if (favorites != null)
      _data['favorites'] = List.generate(
          favorites?.length ?? 0, (index) => favorites![index].toJson());
    return _data;
  }

  Service copyWith(
      {bool? isFavorited,
      String? id,
      String? name,
      String? description,
      double? price,
      JSONObject? metadata,
      String? currency,
      RecordStatus? recordStatus,
      Category? category,
      String? categoryId,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? imageId,
      Attachment? image,
      Business? business,
      String? businessId,
      List<Order>? orders,
      List<AbuseReport>? abuseReports,
      List<Favorite>? favorites}) {
    return Service(
        isFavorited: isFavorited ?? this.isFavorited,
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        metadata: metadata ?? this.metadata,
        currency: currency ?? this.currency,
        recordStatus: recordStatus ?? this.recordStatus,
        category: category ?? this.category,
        categoryId: categoryId ?? this.categoryId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        imageId: imageId ?? this.imageId,
        image: image ?? this.image,
        business: business ?? this.business,
        businessId: businessId ?? this.businessId,
        orders: orders ?? this.orders,
        abuseReports: abuseReports ?? this.abuseReports,
        favorites: favorites ?? this.favorites);
  }

  List<Object?> get props => [
        isFavorited,
        id,
        name,
        description,
        price,
        metadata,
        currency,
        recordStatus,
        category,
        categoryId,
        createdAt,
        updatedAt,
        imageId,
        image,
        business,
        businessId,
        List.from(orders ?? []),
        List.from(abuseReports ?? []),
        List.from(favorites ?? [])
      ];
}

extension ServiceExt on Service {
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

class ServiceController extends ValueNotifier<Service> {
  TextEditingController? isFavoritedController;

  TextEditingController? idController;

  TextEditingController? nameController;

  TextEditingController? descriptionController;

  TextEditingController? priceController;

  TextEditingController? metadataController;

  TextEditingController? currencyController;

  void Function(RecordStatus value)? recordStatusChanged;
  CategoryController? categoryController;
  void Function(Category value)? categoryChanged;

  TextEditingController? categoryIdController;

  TextEditingController? createdAtController;

  TextEditingController? updatedAtController;

  TextEditingController? imageIdController;

  AttachmentController? imageController;
  void Function(Attachment value)? imageChanged;

  BusinessController? businessController;
  void Function(Business value)? businessChanged;

  TextEditingController? businessIdController;

  final Map<String, Order> updatedOrders = {};
  final Map<String, Order> deletedOrders = {};
  void Function(Order value)? ordersChanged;
  void Function(Order value)? ordersRemoved;
  // Order controllers
  final Map<String, OrderController> ordersController = {};

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

  final Service initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  ServiceController({
    required this.initialValue,
    required this.selectionSet,
    this.recordStatusChanged,
    this.categoryChanged,
    this.imageChanged,
    this.businessChanged,
    this.ordersChanged,
    this.ordersRemoved,
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
    if (isInSelectionSet('price')) {
      priceController =
          TextEditingController(text: "${initialValue.price ?? ''}")
            ..addListener(() {
              value = value.copyWith(
                  price: double.tryParse(priceController?.text ?? ''));
            });
    }
    if (isInSelectionSet('currency')) {
      currencyController =
          TextEditingController(text: "${initialValue.currency ?? ''}")
            ..addListener(() {
              value = value.copyWith(currency: currencyController?.text);
            });
    }
    if (isInSelectionSet('category')) {
      var selected = getSelectionNodeData('category')?.selectionSet;
      categoryController = CategoryController(
          initialValue: initialValue.category ?? Category(),
          selectionSet: selected!);
      categoryController?.addListener(() {
        var v = categoryController?.value;
        onCategoryChanged(v!);
      });
    }
    if (isInSelectionSet('categoryId')) {
      categoryIdController =
          TextEditingController(text: "${initialValue.categoryId ?? ''}")
            ..addListener(() {
              value = value.copyWith(categoryId: categoryIdController?.text);
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
    if (isInSelectionSet('imageId')) {
      imageIdController =
          TextEditingController(text: "${initialValue.imageId ?? ''}")
            ..addListener(() {
              value = value.copyWith(imageId: imageIdController?.text);
            });
    }
    if (isInSelectionSet('image')) {
      var selected = getSelectionNodeData('image')?.selectionSet;
      imageController = AttachmentController(
          initialValue: initialValue.image ?? Attachment(),
          selectionSet: selected!);
      imageController?.addListener(() {
        var v = imageController?.value;
        onImageChanged(v!);
      });
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
    if (isInSelectionSet('orders')) {
      if (initialValue.orders?.isNotEmpty == true) {
        var selection = getSelectionNodeData('orders')?.selectionSet;
        ordersController.clear();
        var values =
            initialValue.orders?.map<MapEntry<String, OrderController>>((e) {
          var controller =
              OrderController(initialValue: e, selectionSet: selection!);
          controller.addListener(() {
            onOrdersChanged(controller.value);
          });
          return MapEntry<String, OrderController>(e.id!, controller);
        });
        ordersController.addEntries(values ?? Iterable.empty());
      }
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
    if (isInSelectionSet('name')) {
      nameController?.dispose();
    }
    if (isInSelectionSet('description')) {
      descriptionController?.dispose();
    }
    if (isInSelectionSet('price')) {
      priceController?.dispose();
    }
    if (isInSelectionSet('currency')) {
      currencyController?.dispose();
    }
    if (isInSelectionSet('category')) {
      categoryController?.dispose();
    }
    if (isInSelectionSet('categoryId')) {
      categoryIdController?.dispose();
    }
    if (isInSelectionSet('createdAt')) {
      createdAtController?.dispose();
    }
    if (isInSelectionSet('updatedAt')) {
      updatedAtController?.dispose();
    }
    if (isInSelectionSet('imageId')) {
      imageIdController?.dispose();
    }
    if (isInSelectionSet('image')) {
      imageController?.dispose();
    }
    if (isInSelectionSet('business')) {
      businessController?.dispose();
    }
    if (isInSelectionSet('businessId')) {
      businessIdController?.dispose();
    }
    if (isInSelectionSet('orders')) {
      ordersController.values.map((v) => v.dispose()).toList();
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

  void onCategoryChanged(Category v) {
    if (value.category != v) {
      value = value.copyWith(category: v);
      categoryChanged?.call(v);
    }
  }

  void onImageChanged(Attachment v) {
    if (value.image != v) {
      value = value.copyWith(image: v);
      imageChanged?.call(v);
    }
  }

  void onBusinessChanged(Business v) {
    if (value.business != v) {
      value = value.copyWith(business: v);
      businessChanged?.call(v);
    }
  }

  void onOrdersChanged(Order v) {
    updatedOrders[v.id!] = v;
    var i = value.orders?.indexWhere((e) => e.id == v.id) ?? -1;
    var list = List<Order>.from(value.orders ?? []);
    if (i >= 0) {
      list[i] = v;
    } else {
      list.add(v);
      var selection = getSelectionNodeData("orders")?.selectionSet;
      ordersController[v.id!] =
          OrderController(initialValue: v, selectionSet: selection!);
    }
    value = value.copyWith(orders: list);

    ordersChanged?.call(v);
  }

  void onOrdersRemoved(Order v) {
    if (!v.isNew) {
      deletedOrders[v.id!] = v;
    }
    updatedOrders.remove(v.id!);
    ordersController.remove(v.id!);
    value = value.copyWith(
        orders: value.orders?.where((e) => e.id != v.id).toList() ?? []);

    ordersRemoved?.call(v);
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
