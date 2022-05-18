import 'package:gql/ast.dart';

import 'graphql_custom_type_base.dart';

class EmailAddress implements GraphQLCustomType<EmailAddress> {
  final String value;

  EmailAddress(this.value);
  @override
  EmailAddress copyWith(args) {
    return EmailAddress(value);
  }

  static EmailAddress fromJson(String json) {
    return EmailAddress(json);
  }

  @override
  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    return variables;
  }

  @override
  List<VariableDefinitionNode> getVariableDefinitionsNodes(
      {required Map<String, dynamic> variables}) {
    return [];
  }

  @override
  List<Object?> get props => [value];

  @override
  bool? get stringify => null;

  @override
  String toJson() {
    return value;
  }

  @override
  ValueNode toValueNode({required String field_name}) {
    return StringValueNode(value: value, isBlock: false);
  }
}
