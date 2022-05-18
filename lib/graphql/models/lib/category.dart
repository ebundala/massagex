import 'attachment.dart';
import 'scalars/json_object.dart';
import 'service.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class Category extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final Attachment? picture;
  final String? pictureId;
  final JSONObject? metadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Service>? services;
  Category(
      {this.id,
      this.name,
      this.description,
      this.picture,
      this.pictureId,
      this.metadata,
      this.createdAt,
      this.updatedAt,
      this.services});

  static Category fromJson(Map<dynamic, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      picture:
          json['picture'] != null ? Attachment.fromJson(json['picture']) : null,
      pictureId: json['pictureId'],
      metadata: json['metadata'] != null
          ? JSONObject.fromJson(json['metadata'])
          : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      services: json['services'] != null
          ? List.generate(json['services'].length,
              (index) => Service.fromJson(json['services'][index]))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (name != null) _data['name'] = name;
    if (description != null) _data['description'] = description;
    if (picture != null) _data['picture'] = picture!.toJson();
    if (pictureId != null) _data['pictureId'] = pictureId;
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    if (services != null)
      _data['services'] = List.generate(
          services?.length ?? 0, (index) => services![index].toJson());
    return _data;
  }

  Category copyWith(
      {String? id,
      String? name,
      String? description,
      Attachment? picture,
      String? pictureId,
      JSONObject? metadata,
      DateTime? createdAt,
      DateTime? updatedAt,
      List<Service>? services}) {
    return Category(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        picture: picture ?? this.picture,
        pictureId: pictureId ?? this.pictureId,
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        services: services ?? this.services);
  }

  List<Object?> get props => [
        id,
        name,
        description,
        picture,
        pictureId,
        metadata,
        createdAt,
        updatedAt,
        List.from(services ?? [])
      ];
}

extension CategoryExt on Category {
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

class CategoryController extends ValueNotifier<Category> {
  TextEditingController? idController;

  TextEditingController? nameController;

  TextEditingController? descriptionController;

  AttachmentController? pictureController;
  void Function(Attachment value)? pictureChanged;

  TextEditingController? pictureIdController;

  TextEditingController? metadataController;

  TextEditingController? createdAtController;

  TextEditingController? updatedAtController;

  final Map<String, Service> updatedServices = {};
  final Map<String, Service> deletedServices = {};
  void Function(Service value)? servicesChanged;
  void Function(Service value)? servicesRemoved;
  // Service controllers
  final Map<String, ServiceController> servicesController = {};

  final Category initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  CategoryController({
    required this.initialValue,
    required this.selectionSet,
    this.pictureChanged,
    this.servicesChanged,
    this.servicesRemoved,
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
    if (isInSelectionSet('picture')) {
      var selected = getSelectionNodeData('picture')?.selectionSet;
      pictureController = AttachmentController(
          initialValue: initialValue.picture ?? Attachment(),
          selectionSet: selected!);
      pictureController?.addListener(() {
        var v = pictureController?.value;
        onPictureChanged(v!);
      });
    }
    if (isInSelectionSet('pictureId')) {
      pictureIdController =
          TextEditingController(text: "${initialValue.pictureId ?? ''}")
            ..addListener(() {
              value = value.copyWith(pictureId: pictureIdController?.text);
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
    if (isInSelectionSet('picture')) {
      pictureController?.dispose();
    }
    if (isInSelectionSet('pictureId')) {
      pictureIdController?.dispose();
    }
    if (isInSelectionSet('createdAt')) {
      createdAtController?.dispose();
    }
    if (isInSelectionSet('updatedAt')) {
      updatedAtController?.dispose();
    }
    if (isInSelectionSet('services')) {
      servicesController.values.map((v) => v.dispose()).toList();
    }

    super.dispose();
  }

  void onPictureChanged(Attachment v) {
    if (value.picture != v) {
      value = value.copyWith(picture: v);
      pictureChanged?.call(v);
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
