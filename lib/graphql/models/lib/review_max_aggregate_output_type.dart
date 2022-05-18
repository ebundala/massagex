import 'record_status.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class ReviewMaxAggregateOutputType extends Equatable {
  final String? id;
  final String? authorId;
  final String? revieweeId;
  final int? value;
  final String? content;
  final RecordStatus? recordStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  ReviewMaxAggregateOutputType(
      {this.id,
      this.authorId,
      this.revieweeId,
      this.value,
      this.content,
      this.recordStatus,
      this.createdAt,
      this.updatedAt});

  static ReviewMaxAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return ReviewMaxAggregateOutputType(
      id: json['id'],
      authorId: json['authorId'],
      revieweeId: json['revieweeId'],
      value: json['value'],
      content: json['content'],
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
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
    if (authorId != null) _data['authorId'] = authorId;
    if (revieweeId != null) _data['revieweeId'] = revieweeId;
    if (value != null) _data['value'] = value;
    if (content != null) _data['content'] = content;
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    return _data;
  }

  ReviewMaxAggregateOutputType copyWith(
      {String? id,
      String? authorId,
      String? revieweeId,
      int? value,
      String? content,
      RecordStatus? recordStatus,
      DateTime? createdAt,
      DateTime? updatedAt}) {
    return ReviewMaxAggregateOutputType(
        id: id ?? this.id,
        authorId: authorId ?? this.authorId,
        revieweeId: revieweeId ?? this.revieweeId,
        value: value ?? this.value,
        content: content ?? this.content,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props => [
        id,
        authorId,
        revieweeId,
        value,
        content,
        recordStatus,
        createdAt,
        updatedAt
      ];
}

extension ReviewMaxAggregateOutputTypeExt on ReviewMaxAggregateOutputType {
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

class ReviewMaxAggregateOutputTypeController
    extends ValueNotifier<ReviewMaxAggregateOutputType> {
  TextEditingController? idController;

  TextEditingController? authorIdController;

  TextEditingController? revieweeIdController;

  TextEditingController? valueController;

  TextEditingController? contentController;

  void Function(RecordStatus value)? recordStatusChanged;
  TextEditingController? createdAtController;

  TextEditingController? updatedAtController;

  final ReviewMaxAggregateOutputType initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  ReviewMaxAggregateOutputTypeController({
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
    if (isInSelectionSet('authorId')) {
      authorIdController =
          TextEditingController(text: "${initialValue.authorId ?? ''}")
            ..addListener(() {
              value = value.copyWith(authorId: authorIdController?.text);
            });
    }
    if (isInSelectionSet('revieweeId')) {
      revieweeIdController =
          TextEditingController(text: "${initialValue.revieweeId ?? ''}")
            ..addListener(() {
              value = value.copyWith(revieweeId: revieweeIdController?.text);
            });
    }
    if (isInSelectionSet('value')) {
      valueController = TextEditingController(
          text: "${initialValue.value ?? ''}")
        ..addListener(() {
          value =
              value.copyWith(value: int.tryParse(valueController?.text ?? ''));
        });
    }
    if (isInSelectionSet('content')) {
      contentController =
          TextEditingController(text: "${initialValue.content ?? ''}")
            ..addListener(() {
              value = value.copyWith(content: contentController?.text);
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
    if (isInSelectionSet('authorId')) {
      authorIdController?.dispose();
    }
    if (isInSelectionSet('revieweeId')) {
      revieweeIdController?.dispose();
    }
    if (isInSelectionSet('value')) {
      valueController?.dispose();
    }
    if (isInSelectionSet('content')) {
      contentController?.dispose();
    }
    if (isInSelectionSet('createdAt')) {
      createdAtController?.dispose();
    }
    if (isInSelectionSet('updatedAt')) {
      updatedAtController?.dispose();
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
