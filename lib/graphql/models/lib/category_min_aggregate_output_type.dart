import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class CategoryMinAggregateOutputType extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final String? pictureId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  CategoryMinAggregateOutputType(
      {this.id,
      this.name,
      this.description,
      this.pictureId,
      this.createdAt,
      this.updatedAt});

  static CategoryMinAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return CategoryMinAggregateOutputType(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      pictureId: json['pictureId'],
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
    if (pictureId != null) _data['pictureId'] = pictureId;
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    return _data;
  }

  CategoryMinAggregateOutputType copyWith(
      {String? id,
      String? name,
      String? description,
      String? pictureId,
      DateTime? createdAt,
      DateTime? updatedAt}) {
    return CategoryMinAggregateOutputType(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        pictureId: pictureId ?? this.pictureId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props =>
      [id, name, description, pictureId, createdAt, updatedAt];
}

extension CategoryMinAggregateOutputTypeExt on CategoryMinAggregateOutputType {
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

class CategoryMinAggregateOutputTypeController
    extends ValueNotifier<CategoryMinAggregateOutputType> {
  TextEditingController? idController;

  TextEditingController? nameController;

  TextEditingController? descriptionController;

  TextEditingController? pictureIdController;

  TextEditingController? createdAtController;

  TextEditingController? updatedAtController;

  final CategoryMinAggregateOutputType initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  CategoryMinAggregateOutputTypeController({
    required this.initialValue,
    required this.selectionSet,
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
    if (isInSelectionSet('pictureId')) {
      pictureIdController?.dispose();
    }
    if (isInSelectionSet('createdAt')) {
      createdAtController?.dispose();
    }
    if (isInSelectionSet('updatedAt')) {
      updatedAtController?.dispose();
    }

    super.dispose();
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
