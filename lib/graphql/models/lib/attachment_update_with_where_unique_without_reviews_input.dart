import 'attachment_where_unique_input.dart';
import 'attachment_update_without_reviews_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class AttachmentUpdateWithWhereUniqueWithoutReviewsInput extends Equatable {
  final AttachmentWhereUniqueInput where;
  final AttachmentUpdateWithoutReviewsInput data;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    {
      where.getFilesVariables(
          field_name: '${field_name}_where', variables: variables);
    }

    {
      data.getFilesVariables(
          field_name: '${field_name}_data', variables: variables);
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
        name: ast.NameNode(value: 'where'),
        value: where.toValueNode(field_name: '${field_name}_where'),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'data'),
        value: data.toValueNode(field_name: '${field_name}_data'),
      )
    ]);
  }

  AttachmentUpdateWithWhereUniqueWithoutReviewsInput(
      {required this.where, required this.data});

  static AttachmentUpdateWithWhereUniqueWithoutReviewsInput fromJson(
      Map<dynamic, dynamic> json) {
    return AttachmentUpdateWithWhereUniqueWithoutReviewsInput(
      where: AttachmentWhereUniqueInput.fromJson(json['where']),
      data: AttachmentUpdateWithoutReviewsInput.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};

    _data['where'] = where.toJson();

    _data['data'] = data.toJson();
    return _data;
  }

  AttachmentUpdateWithWhereUniqueWithoutReviewsInput copyWith(
      {AttachmentWhereUniqueInput? where,
      AttachmentUpdateWithoutReviewsInput? data}) {
    return AttachmentUpdateWithWhereUniqueWithoutReviewsInput(
        where: where ?? this.where, data: data ?? this.data);
  }

  List<Object?> get props => [where, data];
}
