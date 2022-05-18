import 'user.dart';
import 'business_mode.dart';
import 'attachment.dart';
import 'scalars/json_object.dart';
import 'business_status.dart';
import 'record_status.dart';
import 'service.dart';
import 'order.dart';
import 'location.dart';
import 'abuse_report.dart';
import 'favorite.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class Business extends Equatable {
  final String? id;
  final User? owner;
  final String? ownerId;
  final BusinessMode? mode;
  final Attachment? cover;
  final String? coverId;
  final String? about;
  final String? businessName;
  final JSONObject? metadata;
  final BusinessStatus? status;
  final RecordStatus? recordStatus;
  final List<Service>? services;
  final List<Order>? orders;
  final List<Attachment>? attachments;
  final Location? location;
  final String? locationId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<AbuseReport>? abuseReports;
  final List<Favorite>? favorites;
  Business(
      {this.id,
      this.owner,
      this.ownerId,
      this.mode,
      this.cover,
      this.coverId,
      this.about,
      this.businessName,
      this.metadata,
      this.status,
      this.recordStatus,
      this.services,
      this.orders,
      this.attachments,
      this.location,
      this.locationId,
      this.createdAt,
      this.updatedAt,
      this.abuseReports,
      this.favorites});

  static Business fromJson(Map<dynamic, dynamic> json) {
    return Business(
      id: json['id'],
      owner: json['owner'] != null ? User.fromJson(json['owner']) : null,
      ownerId: json['ownerId'],
      mode:
          json['mode'] != null ? BusinessModeExt.fromJson(json['mode']) : null,
      cover: json['cover'] != null ? Attachment.fromJson(json['cover']) : null,
      coverId: json['coverId'],
      about: json['about'],
      businessName: json['businessName'],
      metadata: json['metadata'] != null
          ? JSONObject.fromJson(json['metadata'])
          : null,
      status: json['status'] != null
          ? BusinessStatusExt.fromJson(json['status'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      services: json['services'] != null
          ? List.generate(json['services'].length,
              (index) => Service.fromJson(json['services'][index]))
          : null,
      orders: json['orders'] != null
          ? List.generate(json['orders'].length,
              (index) => Order.fromJson(json['orders'][index]))
          : null,
      attachments: json['attachments'] != null
          ? List.generate(json['attachments'].length,
              (index) => Attachment.fromJson(json['attachments'][index]))
          : null,
      location:
          json['location'] != null ? Location.fromJson(json['location']) : null,
      locationId: json['locationId'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
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
    if (id != null) _data['id'] = id;
    if (owner != null) _data['owner'] = owner!.toJson();
    if (ownerId != null) _data['ownerId'] = ownerId;
    if (mode != null) _data['mode'] = mode!.toJson();
    if (cover != null) _data['cover'] = cover!.toJson();
    if (coverId != null) _data['coverId'] = coverId;
    if (about != null) _data['about'] = about;
    if (businessName != null) _data['businessName'] = businessName;
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (status != null) _data['status'] = status!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (services != null)
      _data['services'] = List.generate(
          services?.length ?? 0, (index) => services![index].toJson());
    if (orders != null)
      _data['orders'] = List.generate(
          orders?.length ?? 0, (index) => orders![index].toJson());
    if (attachments != null)
      _data['attachments'] = List.generate(
          attachments?.length ?? 0, (index) => attachments![index].toJson());
    if (location != null) _data['location'] = location!.toJson();
    if (locationId != null) _data['locationId'] = locationId;
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    if (abuseReports != null)
      _data['abuseReports'] = List.generate(
          abuseReports?.length ?? 0, (index) => abuseReports![index].toJson());
    if (favorites != null)
      _data['favorites'] = List.generate(
          favorites?.length ?? 0, (index) => favorites![index].toJson());
    return _data;
  }

  Business copyWith(
      {String? id,
      User? owner,
      String? ownerId,
      BusinessMode? mode,
      Attachment? cover,
      String? coverId,
      String? about,
      String? businessName,
      JSONObject? metadata,
      BusinessStatus? status,
      RecordStatus? recordStatus,
      List<Service>? services,
      List<Order>? orders,
      List<Attachment>? attachments,
      Location? location,
      String? locationId,
      DateTime? createdAt,
      DateTime? updatedAt,
      List<AbuseReport>? abuseReports,
      List<Favorite>? favorites}) {
    return Business(
        id: id ?? this.id,
        owner: owner ?? this.owner,
        ownerId: ownerId ?? this.ownerId,
        mode: mode ?? this.mode,
        cover: cover ?? this.cover,
        coverId: coverId ?? this.coverId,
        about: about ?? this.about,
        businessName: businessName ?? this.businessName,
        metadata: metadata ?? this.metadata,
        status: status ?? this.status,
        recordStatus: recordStatus ?? this.recordStatus,
        services: services ?? this.services,
        orders: orders ?? this.orders,
        attachments: attachments ?? this.attachments,
        location: location ?? this.location,
        locationId: locationId ?? this.locationId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        abuseReports: abuseReports ?? this.abuseReports,
        favorites: favorites ?? this.favorites);
  }

  List<Object?> get props => [
        id,
        owner,
        ownerId,
        mode,
        cover,
        coverId,
        about,
        businessName,
        metadata,
        status,
        recordStatus,
        List.from(services ?? []),
        List.from(orders ?? []),
        List.from(attachments ?? []),
        location,
        locationId,
        createdAt,
        updatedAt,
        List.from(abuseReports ?? []),
        List.from(favorites ?? [])
      ];
}

extension BusinessExt on Business {
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

class BusinessController extends ValueNotifier<Business> {
  TextEditingController? idController;

  UserController? ownerController;
  void Function(User value)? ownerChanged;

  TextEditingController? ownerIdController;

  void Function(BusinessMode value)? modeChanged;
  AttachmentController? coverController;
  void Function(Attachment value)? coverChanged;

  TextEditingController? coverIdController;

  TextEditingController? aboutController;

  TextEditingController? businessNameController;

  TextEditingController? metadataController;

  void Function(BusinessStatus value)? statusChanged;
  void Function(RecordStatus value)? recordStatusChanged;
  final Map<String, Service> updatedServices = {};
  final Map<String, Service> deletedServices = {};
  void Function(Service value)? servicesChanged;
  void Function(Service value)? servicesRemoved;
  // Service controllers
  final Map<String, ServiceController> servicesController = {};

  final Map<String, Order> updatedOrders = {};
  final Map<String, Order> deletedOrders = {};
  void Function(Order value)? ordersChanged;
  void Function(Order value)? ordersRemoved;
  // Order controllers
  final Map<String, OrderController> ordersController = {};

  final Map<String, Attachment> updatedAttachments = {};
  final Map<String, Attachment> deletedAttachments = {};
  void Function(Attachment value)? attachmentsChanged;
  void Function(Attachment value)? attachmentsRemoved;
  // Attachment controllers
  final Map<String, AttachmentController> attachmentsController = {};

  LocationController? locationController;
  void Function(Location value)? locationChanged;

  TextEditingController? locationIdController;

  TextEditingController? createdAtController;

  TextEditingController? updatedAtController;

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

  final Business initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  BusinessController({
    required this.initialValue,
    required this.selectionSet,
    this.ownerChanged,
    this.modeChanged,
    this.coverChanged,
    this.statusChanged,
    this.recordStatusChanged,
    this.servicesChanged,
    this.servicesRemoved,
    this.ordersChanged,
    this.ordersRemoved,
    this.attachmentsChanged,
    this.attachmentsRemoved,
    this.locationChanged,
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
    if (isInSelectionSet('owner')) {
      var selected = getSelectionNodeData('owner')?.selectionSet;
      ownerController = UserController(
          initialValue: initialValue.owner ?? User(), selectionSet: selected!);
      ownerController?.addListener(() {
        var v = ownerController?.value;
        onOwnerChanged(v!);
      });
    }
    if (isInSelectionSet('ownerId')) {
      ownerIdController =
          TextEditingController(text: "${initialValue.ownerId ?? ''}")
            ..addListener(() {
              value = value.copyWith(ownerId: ownerIdController?.text);
            });
    }
    if (isInSelectionSet('cover')) {
      var selected = getSelectionNodeData('cover')?.selectionSet;
      coverController = AttachmentController(
          initialValue: initialValue.cover ?? Attachment(),
          selectionSet: selected!);
      coverController?.addListener(() {
        var v = coverController?.value;
        onCoverChanged(v!);
      });
    }
    if (isInSelectionSet('coverId')) {
      coverIdController =
          TextEditingController(text: "${initialValue.coverId ?? ''}")
            ..addListener(() {
              value = value.copyWith(coverId: coverIdController?.text);
            });
    }
    if (isInSelectionSet('about')) {
      aboutController =
          TextEditingController(text: "${initialValue.about ?? ''}")
            ..addListener(() {
              value = value.copyWith(about: aboutController?.text);
            });
    }
    if (isInSelectionSet('businessName')) {
      businessNameController =
          TextEditingController(text: "${initialValue.businessName ?? ''}")
            ..addListener(() {
              value =
                  value.copyWith(businessName: businessNameController?.text);
            });
    }
    if (isInSelectionSet('services')) {
      if (initialValue.services?.isNotEmpty == true) {
        var selection = getSelectionNodeData('services')?.selectionSet;
        servicesController.clear();
        var values = initialValue.services
            ?.map<MapEntry<String, ServiceController>>((e) {
          var controller =
              ServiceController(initialValue: e, selectionSet: selection!);
          controller.addListener(() {
            onServicesChanged(controller.value);
          });
          return MapEntry<String, ServiceController>(e.id!, controller);
        });
        servicesController.addEntries(values ?? Iterable.empty());
      }
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
    if (isInSelectionSet('attachments')) {
      if (initialValue.attachments?.isNotEmpty == true) {
        var selection = getSelectionNodeData('attachments')?.selectionSet;
        attachmentsController.clear();
        var values = initialValue.attachments
            ?.map<MapEntry<String, AttachmentController>>((e) {
          var controller =
              AttachmentController(initialValue: e, selectionSet: selection!);
          controller.addListener(() {
            onAttachmentsChanged(controller.value);
          });
          return MapEntry<String, AttachmentController>(e.id!, controller);
        });
        attachmentsController.addEntries(values ?? Iterable.empty());
      }
    }
    if (isInSelectionSet('location')) {
      var selected = getSelectionNodeData('location')?.selectionSet;
      locationController = LocationController(
          initialValue: initialValue.location ?? Location(),
          selectionSet: selected!);
      locationController?.addListener(() {
        var v = locationController?.value;
        onLocationChanged(v!);
      });
    }
    if (isInSelectionSet('locationId')) {
      locationIdController =
          TextEditingController(text: "${initialValue.locationId ?? ''}")
            ..addListener(() {
              value = value.copyWith(locationId: locationIdController?.text);
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
    if (isInSelectionSet('owner')) {
      ownerController?.dispose();
    }
    if (isInSelectionSet('ownerId')) {
      ownerIdController?.dispose();
    }
    if (isInSelectionSet('cover')) {
      coverController?.dispose();
    }
    if (isInSelectionSet('coverId')) {
      coverIdController?.dispose();
    }
    if (isInSelectionSet('about')) {
      aboutController?.dispose();
    }
    if (isInSelectionSet('businessName')) {
      businessNameController?.dispose();
    }
    if (isInSelectionSet('services')) {
      servicesController.values.map((v) => v.dispose()).toList();
    }
    if (isInSelectionSet('orders')) {
      ordersController.values.map((v) => v.dispose()).toList();
    }
    if (isInSelectionSet('attachments')) {
      attachmentsController.values.map((v) => v.dispose()).toList();
    }
    if (isInSelectionSet('location')) {
      locationController?.dispose();
    }
    if (isInSelectionSet('locationId')) {
      locationIdController?.dispose();
    }
    if (isInSelectionSet('createdAt')) {
      createdAtController?.dispose();
    }
    if (isInSelectionSet('updatedAt')) {
      updatedAtController?.dispose();
    }
    if (isInSelectionSet('abuseReports')) {
      abuseReportsController.values.map((v) => v.dispose()).toList();
    }
    if (isInSelectionSet('favorites')) {
      favoritesController.values.map((v) => v.dispose()).toList();
    }

    super.dispose();
  }

  void onOwnerChanged(User v) {
    if (value.owner != v) {
      value = value.copyWith(owner: v);
      ownerChanged?.call(v);
    }
  }

  void onModeChanged(BusinessMode v) {
    if (value.mode != v) {
      value = value.copyWith(mode: v);
      modeChanged?.call(v);
    }
  }

  void onCoverChanged(Attachment v) {
    if (value.cover != v) {
      value = value.copyWith(cover: v);
      coverChanged?.call(v);
    }
  }

  void onStatusChanged(BusinessStatus v) {
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

  void onServicesChanged(Service v) {
    updatedServices[v.id!] = v;
    var i = value.services?.indexWhere((e) => e.id == v.id) ?? -1;
    var list = List<Service>.from(value.services ?? []);
    if (i >= 0) {
      list[i] = v;
    } else {
      list.add(v);
      var selection = getSelectionNodeData("services")?.selectionSet;
      servicesController[v.id!] =
          ServiceController(initialValue: v, selectionSet: selection!);
    }
    value = value.copyWith(services: list);

    servicesChanged?.call(v);
  }

  void onServicesRemoved(Service v) {
    if (!v.isNew) {
      deletedServices[v.id!] = v;
    }
    updatedServices.remove(v.id!);
    servicesController.remove(v.id!);
    value = value.copyWith(
        services: value.services?.where((e) => e.id != v.id).toList() ?? []);

    servicesRemoved?.call(v);
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

  void onAttachmentsChanged(Attachment v) {
    updatedAttachments[v.id!] = v;
    var i = value.attachments?.indexWhere((e) => e.id == v.id) ?? -1;
    var list = List<Attachment>.from(value.attachments ?? []);
    if (i >= 0) {
      list[i] = v;
    } else {
      list.add(v);
      var selection = getSelectionNodeData("attachments")?.selectionSet;
      attachmentsController[v.id!] =
          AttachmentController(initialValue: v, selectionSet: selection!);
    }
    value = value.copyWith(attachments: list);

    attachmentsChanged?.call(v);
  }

  void onAttachmentsRemoved(Attachment v) {
    if (!v.isNew) {
      deletedAttachments[v.id!] = v;
    }
    updatedAttachments.remove(v.id!);
    attachmentsController.remove(v.id!);
    value = value.copyWith(
        attachments:
            value.attachments?.where((e) => e.id != v.id).toList() ?? []);

    attachmentsRemoved?.call(v);
  }

  void onLocationChanged(Location v) {
    if (value.location != v) {
      value = value.copyWith(location: v);
      locationChanged?.call(v);
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
