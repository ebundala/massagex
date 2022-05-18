import 'sort_order.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class ReviewOrderByInput extends Equatable {
  final SortOrder? id;
  final SortOrder? authorId;
  final SortOrder? revieweeId;
  final SortOrder? value;
  final SortOrder? content;
  final SortOrder? recordStatus;
  final SortOrder? createdAt;
  final SortOrder? updatedAt;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }

    return variables;
  }

  List<ast.VariableDefinitionNode> getVariableDefinitionsNodes({
    required Map<String, dynamic> variables,
  }) {
    final List<ast.VariableDefinitionNode> vars = [];
    variables.forEach((key, value) {
      vars.add(ast.VariableDefinitionNode(
        variable: ast.VariableNode(name: ast.NameNode(value: key)),
        type: ast.NamedTypeNode(
            name: ast.NameNode(value: 'Upload'), isNonNull: true),
        defaultValue: ast.DefaultValueNode(value: null),
        directives: [],
      ));
    });
    return vars;
  }

  ast.ObjectValueNode toValueNode({required String field_name}) {
    return ast.ObjectValueNode(fields: [
      if (id != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'id'),
          value: ast.EnumValueNode(name: ast.NameNode(value: id!.toJson())),
        ),
      if (authorId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'authorId'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: authorId!.toJson())),
        ),
      if (revieweeId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'revieweeId'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: revieweeId!.toJson())),
        ),
      if (value != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'value'),
          value: ast.EnumValueNode(name: ast.NameNode(value: value!.toJson())),
        ),
      if (content != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'content'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: content!.toJson())),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: recordStatus!.toJson())),
        ),
      if (createdAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'createdAt'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: createdAt!.toJson())),
        ),
      if (updatedAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'updatedAt'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: updatedAt!.toJson())),
        )
    ]);
  }

  ReviewOrderByInput(
      {this.id,
      this.authorId,
      this.revieweeId,
      this.value,
      this.content,
      this.recordStatus,
      this.createdAt,
      this.updatedAt});

  static ReviewOrderByInput fromJson(Map<dynamic, dynamic> json) {
    return ReviewOrderByInput(
      id: json['id'] != null ? SortOrderExt.fromJson(json['id']) : null,
      authorId: json['authorId'] != null
          ? SortOrderExt.fromJson(json['authorId'])
          : null,
      revieweeId: json['revieweeId'] != null
          ? SortOrderExt.fromJson(json['revieweeId'])
          : null,
      value:
          json['value'] != null ? SortOrderExt.fromJson(json['value']) : null,
      content: json['content'] != null
          ? SortOrderExt.fromJson(json['content'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? SortOrderExt.fromJson(json['recordStatus'])
          : null,
      createdAt: json['createdAt'] != null
          ? SortOrderExt.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? SortOrderExt.fromJson(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id!.toJson();
    if (authorId != null) _data['authorId'] = authorId!.toJson();
    if (revieweeId != null) _data['revieweeId'] = revieweeId!.toJson();
    if (value != null) _data['value'] = value!.toJson();
    if (content != null) _data['content'] = content!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    return _data;
  }

  ReviewOrderByInput copyWith(
      {SortOrder? id,
      SortOrder? authorId,
      SortOrder? revieweeId,
      SortOrder? value,
      SortOrder? content,
      SortOrder? recordStatus,
      SortOrder? createdAt,
      SortOrder? updatedAt}) {
    return ReviewOrderByInput(
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
