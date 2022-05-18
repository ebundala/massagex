import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class FavoriteRecordTypeMinAggregateOutputType extends Equatable {
  final String? id;
  final String? name;
  FavoriteRecordTypeMinAggregateOutputType({this.id, this.name});

  static FavoriteRecordTypeMinAggregateOutputType fromJson(
      Map<dynamic, dynamic> json) {
    return FavoriteRecordTypeMinAggregateOutputType(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (name != null) _data['name'] = name;
    return _data;
  }

  FavoriteRecordTypeMinAggregateOutputType copyWith(
      {String? id, String? name}) {
    return FavoriteRecordTypeMinAggregateOutputType(
        id: id ?? this.id, name: name ?? this.name);
  }

  List<Object?> get props => [id, name];
}

extension FavoriteRecordTypeMinAggregateOutputTypeExt
    on FavoriteRecordTypeMinAggregateOutputType {
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

class FavoriteRecordTypeMinAggregateOutputTypeController
    extends ValueNotifier<FavoriteRecordTypeMinAggregateOutputType> {
  TextEditingController? idController;

  TextEditingController? nameController;

  final FavoriteRecordTypeMinAggregateOutputType initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  FavoriteRecordTypeMinAggregateOutputTypeController({
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
  }
  @override
  dispose() {
    if (isInSelectionSet('id')) {
      idController?.dispose();
    }
    if (isInSelectionSet('name')) {
      nameController?.dispose();
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
