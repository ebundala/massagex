import 'abuse_report_unchecked_create_nested_many_without_type_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class AbuseRecordTypeUncheckedCreateInput extends Equatable {
  final String? id;
  final String name;
  final AbuseReportUncheckedCreateNestedManyWithoutTypeInput? abuseReports;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (abuseReports != null) {
      abuseReports!.getFilesVariables(
          field_name: '${field_name}_abuseReports', variables: variables);
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
          value: ast.StringValueNode(value: '${id!}', isBlock: false),
        ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'name'),
        value: ast.StringValueNode(value: '${name}', isBlock: false),
      ),
      if (abuseReports != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'abuseReports'),
          value: abuseReports!
              .toValueNode(field_name: '${field_name}_abuseReports'),
        )
    ]);
  }

  AbuseRecordTypeUncheckedCreateInput(
      {this.id, required this.name, this.abuseReports});

  static AbuseRecordTypeUncheckedCreateInput fromJson(
      Map<dynamic, dynamic> json) {
    return AbuseRecordTypeUncheckedCreateInput(
      id: json['id'],
      name: json['name'],
      abuseReports: json['abuseReports'] != null
          ? AbuseReportUncheckedCreateNestedManyWithoutTypeInput.fromJson(
              json['abuseReports'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;

    _data['name'] = name;
    if (abuseReports != null) _data['abuseReports'] = abuseReports!.toJson();
    return _data;
  }

  AbuseRecordTypeUncheckedCreateInput copyWith(
      {String? id,
      String? name,
      AbuseReportUncheckedCreateNestedManyWithoutTypeInput? abuseReports}) {
    return AbuseRecordTypeUncheckedCreateInput(
        id: id ?? this.id,
        name: name ?? this.name,
        abuseReports: abuseReports ?? this.abuseReports);
  }

  List<Object?> get props => [id, name, abuseReports];
}
