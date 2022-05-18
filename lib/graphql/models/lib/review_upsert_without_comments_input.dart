import 'review_update_without_comments_input.dart';
import 'review_create_without_comments_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class ReviewUpsertWithoutCommentsInput extends Equatable {
  final ReviewUpdateWithoutCommentsInput update;
  final ReviewCreateWithoutCommentsInput create;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    {
      update.getFilesVariables(
          field_name: '${field_name}_update', variables: variables);
    }

    {
      create.getFilesVariables(
          field_name: '${field_name}_create', variables: variables);
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
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'update'),
        value: update.toValueNode(field_name: '${field_name}_update'),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'create'),
        value: create.toValueNode(field_name: '${field_name}_create'),
      )
    ]);
  }

  ReviewUpsertWithoutCommentsInput(
      {required this.update, required this.create});

  static ReviewUpsertWithoutCommentsInput fromJson(Map<dynamic, dynamic> json) {
    return ReviewUpsertWithoutCommentsInput(
      update: ReviewUpdateWithoutCommentsInput.fromJson(json['update']),
      create: ReviewCreateWithoutCommentsInput.fromJson(json['create']),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};

    _data['update'] = update.toJson();

    _data['create'] = create.toJson();
    return _data;
  }

  ReviewUpsertWithoutCommentsInput copyWith(
      {ReviewUpdateWithoutCommentsInput? update,
      ReviewCreateWithoutCommentsInput? create}) {
    return ReviewUpsertWithoutCommentsInput(
        update: update ?? this.update, create: create ?? this.create);
  }

  List<Object?> get props => [update, create];
}
