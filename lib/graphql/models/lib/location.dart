import 'record_status.dart';
import 'user.dart';
import 'business.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class Location extends Equatable {
  final String? id;
  final String? name;
  final double? lat;
  final double? lon;
  final double? heading;
  final RecordStatus? recordStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<User>? users;
  final List<Business>? businesses;
  Location(
      {this.id,
      this.name,
      this.lat,
      this.lon,
      this.heading,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      this.users,
      this.businesses});

  static Location fromJson(Map<dynamic, dynamic> json) {
    return Location(
      id: json['id'],
      name: json['name'],
      lat: json['lat']?.toDouble(),
      lon: json['lon']?.toDouble(),
      heading: json['heading']?.toDouble(),
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      users: json['users'] != null
          ? List.generate(json['users'].length,
              (index) => User.fromJson(json['users'][index]))
          : null,
      businesses: json['businesses'] != null
          ? List.generate(json['businesses'].length,
              (index) => Business.fromJson(json['businesses'][index]))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (name != null) _data['name'] = name;
    if (lat != null) _data['lat'] = lat;
    if (lon != null) _data['lon'] = lon;
    if (heading != null) _data['heading'] = heading;
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    if (users != null)
      _data['users'] =
          List.generate(users?.length ?? 0, (index) => users![index].toJson());
    if (businesses != null)
      _data['businesses'] = List.generate(
          businesses?.length ?? 0, (index) => businesses![index].toJson());
    return _data;
  }

  Location copyWith(
      {String? id,
      String? name,
      double? lat,
      double? lon,
      double? heading,
      RecordStatus? recordStatus,
      DateTime? createdAt,
      DateTime? updatedAt,
      List<User>? users,
      List<Business>? businesses}) {
    return Location(
        id: id ?? this.id,
        name: name ?? this.name,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        heading: heading ?? this.heading,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        users: users ?? this.users,
        businesses: businesses ?? this.businesses);
  }

  List<Object?> get props => [
        id,
        name,
        lat,
        lon,
        heading,
        recordStatus,
        createdAt,
        updatedAt,
        List.from(users ?? []),
        List.from(businesses ?? [])
      ];
}

extension LocationExt on Location {
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

class LocationController extends ValueNotifier<Location> {
  TextEditingController? idController;

  TextEditingController? nameController;

  TextEditingController? latController;

  TextEditingController? lonController;

  TextEditingController? headingController;

  void Function(RecordStatus value)? recordStatusChanged;
  TextEditingController? createdAtController;

  TextEditingController? updatedAtController;

  final Map<String, User> updatedUsers = {};
  final Map<String, User> deletedUsers = {};
  void Function(User value)? usersChanged;
  void Function(User value)? usersRemoved;
  // User controllers
  final Map<String, UserController> usersController = {};

  final Map<String, Business> updatedBusinesses = {};
  final Map<String, Business> deletedBusinesses = {};
  void Function(Business value)? businessesChanged;
  void Function(Business value)? businessesRemoved;
  // Business controllers
  final Map<String, BusinessController> businessesController = {};

  final Location initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  LocationController({
    required this.initialValue,
    required this.selectionSet,
    this.recordStatusChanged,
    this.usersChanged,
    this.usersRemoved,
    this.businessesChanged,
    this.businessesRemoved,
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
    if (isInSelectionSet('lat')) {
      latController = TextEditingController(text: "${initialValue.lat ?? ''}")
        ..addListener(() {
          value =
              value.copyWith(lat: double.tryParse(latController?.text ?? ''));
        });
    }
    if (isInSelectionSet('lon')) {
      lonController = TextEditingController(text: "${initialValue.lon ?? ''}")
        ..addListener(() {
          value =
              value.copyWith(lon: double.tryParse(lonController?.text ?? ''));
        });
    }
    if (isInSelectionSet('heading')) {
      headingController =
          TextEditingController(text: "${initialValue.heading ?? ''}")
            ..addListener(() {
              value = value.copyWith(
                  heading: double.tryParse(headingController?.text ?? ''));
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
    if (isInSelectionSet('users')) {
      if (initialValue.users?.isNotEmpty == true) {
        var selection = getSelectionNodeData('users')?.selectionSet;
        usersController.clear();
        var values =
            initialValue.users?.map<MapEntry<String, UserController>>((e) {
          var controller =
              UserController(initialValue: e, selectionSet: selection!);
          controller.addListener(() {
            onUsersChanged(controller.value);
          });
          return MapEntry<String, UserController>(e.id!, controller);
        });
        usersController.addEntries(values ?? Iterable.empty());
      }
    }
    if (isInSelectionSet('businesses')) {
      if (initialValue.businesses?.isNotEmpty == true) {
        var selection = getSelectionNodeData('businesses')?.selectionSet;
        businessesController.clear();
        var values = initialValue.businesses
            ?.map<MapEntry<String, BusinessController>>((e) {
          var controller =
              BusinessController(initialValue: e, selectionSet: selection!);
          controller.addListener(() {
            onBusinessesChanged(controller.value);
          });
          return MapEntry<String, BusinessController>(e.id!, controller);
        });
        businessesController.addEntries(values ?? Iterable.empty());
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
    if (isInSelectionSet('lat')) {
      latController?.dispose();
    }
    if (isInSelectionSet('lon')) {
      lonController?.dispose();
    }
    if (isInSelectionSet('heading')) {
      headingController?.dispose();
    }
    if (isInSelectionSet('createdAt')) {
      createdAtController?.dispose();
    }
    if (isInSelectionSet('updatedAt')) {
      updatedAtController?.dispose();
    }
    if (isInSelectionSet('users')) {
      usersController.values.map((v) => v.dispose()).toList();
    }
    if (isInSelectionSet('businesses')) {
      businessesController.values.map((v) => v.dispose()).toList();
    }

    super.dispose();
  }

  void onRecordStatusChanged(RecordStatus v) {
    if (value.recordStatus != v) {
      value = value.copyWith(recordStatus: v);
      recordStatusChanged?.call(v);
    }
  }

  void onUsersChanged(User v) {
    updatedUsers[v.id!] = v;
    var i = value.users?.indexWhere((e) => e.id == v.id) ?? -1;
    var list = List<User>.from(value.users ?? []);
    if (i >= 0) {
      list[i] = v;
    } else {
      list.add(v);
      var selection = getSelectionNodeData("users")?.selectionSet;
      usersController[v.id!] =
          UserController(initialValue: v, selectionSet: selection!);
    }
    value = value.copyWith(users: list);

    usersChanged?.call(v);
  }

  void onUsersRemoved(User v) {
    if (!v.isNew) {
      deletedUsers[v.id!] = v;
    }
    updatedUsers.remove(v.id!);
    usersController.remove(v.id!);
    value = value.copyWith(
        users: value.users?.where((e) => e.id != v.id).toList() ?? []);

    usersRemoved?.call(v);
  }

  void onBusinessesChanged(Business v) {
    updatedBusinesses[v.id!] = v;
    var i = value.businesses?.indexWhere((e) => e.id == v.id) ?? -1;
    var list = List<Business>.from(value.businesses ?? []);
    if (i >= 0) {
      list[i] = v;
    } else {
      list.add(v);
      var selection = getSelectionNodeData("businesses")?.selectionSet;
      businessesController[v.id!] =
          BusinessController(initialValue: v, selectionSet: selection!);
    }
    value = value.copyWith(businesses: list);

    businessesChanged?.call(v);
  }

  void onBusinessesRemoved(Business v) {
    if (!v.isNew) {
      deletedBusinesses[v.id!] = v;
    }
    updatedBusinesses.remove(v.id!);
    businessesController.remove(v.id!);
    value = value.copyWith(
        businesses:
            value.businesses?.where((e) => e.id != v.id).toList() ?? []);

    businessesRemoved?.call(v);
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
