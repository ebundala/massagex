import 'record_status.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class ServiceMaxAggregateOutputType extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final double? price;
  final String? currency;
  final RecordStatus? recordStatus;
  final String? categoryId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? imageId;
  final String? businessId;
  ServiceMaxAggregateOutputType(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.currency,
      this.recordStatus,
      this.categoryId,
      this.createdAt,
      this.updatedAt,
      this.imageId,
      this.businessId});

  static ServiceMaxAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return ServiceMaxAggregateOutputType(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price']?.toDouble(),
      currency: json['currency'],
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      categoryId: json['categoryId'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      imageId: json['imageId'],
      businessId: json['businessId'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (name != null) _data['name'] = name;
    if (description != null) _data['description'] = description;
    if (price != null) _data['price'] = price;
    if (currency != null) _data['currency'] = currency;
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (categoryId != null) _data['categoryId'] = categoryId;
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    if (imageId != null) _data['imageId'] = imageId;
    if (businessId != null) _data['businessId'] = businessId;
    return _data;
  }

  ServiceMaxAggregateOutputType copyWith(
      {String? id,
      String? name,
      String? description,
      double? price,
      String? currency,
      RecordStatus? recordStatus,
      String? categoryId,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? imageId,
      String? businessId}) {
    return ServiceMaxAggregateOutputType(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        currency: currency ?? this.currency,
        recordStatus: recordStatus ?? this.recordStatus,
        categoryId: categoryId ?? this.categoryId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        imageId: imageId ?? this.imageId,
        businessId: businessId ?? this.businessId);
  }

  List<Object?> get props => [
        id,
        name,
        description,
        price,
        currency,
        recordStatus,
        categoryId,
        createdAt,
        updatedAt,
        imageId,
        businessId
      ];
}

extension ServiceMaxAggregateOutputTypeExt on ServiceMaxAggregateOutputType {
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

class ServiceMaxAggregateOutputTypeController
    extends ValueNotifier<ServiceMaxAggregateOutputType> {
  TextEditingController? idController;

  TextEditingController? nameController;

  TextEditingController? descriptionController;

  TextEditingController? priceController;

  TextEditingController? currencyController;

  void Function(RecordStatus value)? recordStatusChanged;
  TextEditingController? categoryIdController;

  TextEditingController? createdAtController;

  TextEditingController? updatedAtController;

  TextEditingController? imageIdController;

  TextEditingController? businessIdController;

  final ServiceMaxAggregateOutputType initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  ServiceMaxAggregateOutputTypeController({
    required this.initialValue,
    required this.selectionSet,
    this.recordStatusChanged,
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
