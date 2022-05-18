import 'record_status.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class CommentMaxAggregateOutputType extends Equatable {
  final String? id;
  final String? authorId;
  final String? reviewId;
  final bool? commentsEnabled;
  final String? content;
  final RecordStatus? recordStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? commentId;
  CommentMaxAggregateOutputType(
      {this.id,
      this.authorId,
      this.reviewId,
      this.commentsEnabled,
      this.content,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      this.commentId});

  static CommentMaxAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return CommentMaxAggregateOutputType(
      id: json['id'],
      authorId: json['authorId'],
      reviewId: json['reviewId'],
      commentsEnabled: json['commentsEnabled'],
      content: json['content'],
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      commentId: json['commentId'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (authorId != null) _data['authorId'] = authorId;
    if (reviewId != null) _data['reviewId'] = reviewId;
    if (commentsEnabled != null) _data['commentsEnabled'] = commentsEnabled;
    if (content != null) _data['content'] = content;
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    if (commentId != null) _data['commentId'] = commentId;
    return _data;
  }

  CommentMaxAggregateOutputType copyWith(
      {String? id,
      String? authorId,
      String? reviewId,
      bool? commentsEnabled,
      String? content,
      RecordStatus? recordStatus,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? commentId}) {
    return CommentMaxAggregateOutputType(
        id: id ?? this.id,
        authorId: authorId ?? this.authorId,
        reviewId: reviewId ?? this.reviewId,
        commentsEnabled: commentsEnabled ?? this.commentsEnabled,
        content: content ?? this.content,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        commentId: commentId ?? this.commentId);
  }

  List<Object?> get props => [
        id,
        authorId,
        reviewId,
        commentsEnabled,
        content,
        recordStatus,
        createdAt,
        updatedAt,
        commentId
      ];
}

extension CommentMaxAggregateOutputTypeExt on CommentMaxAggregateOutputType {
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

class CommentMaxAggregateOutputTypeController
    extends ValueNotifier<CommentMaxAggregateOutputType> {
  TextEditingController? idController;

  TextEditingController? authorIdController;

  TextEditingController? reviewIdController;

  TextEditingController? commentsEnabledController;

  TextEditingController? contentController;

  void Function(RecordStatus value)? recordStatusChanged;
  TextEditingController? createdAtController;

  TextEditingController? updatedAtController;

  TextEditingController? commentIdController;

  final CommentMaxAggregateOutputType initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  CommentMaxAggregateOutputTypeController({
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
    if (isInSelectionSet('reviewId')) {
      reviewIdController =
          TextEditingController(text: "${initialValue.reviewId ?? ''}")
            ..addListener(() {
              value = value.copyWith(reviewId: reviewIdController?.text);
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
    if (isInSelectionSet('commentId')) {
      commentIdController =
          TextEditingController(text: "${initialValue.commentId ?? ''}")
            ..addListener(() {
              value = value.copyWith(commentId: commentIdController?.text);
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
    if (isInSelectionSet('reviewId')) {
      reviewIdController?.dispose();
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
    if (isInSelectionSet('commentId')) {
      commentIdController?.dispose();
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
