import 'package:gql/ast.dart';

import 'graphql_custom_type_base.dart';

class PhoneNumber implements GraphQLCustomType<PhoneNumber> {
  final String value;

  PhoneNumber(this.value);

  static PhoneNumber fromJson(String json) {
    return PhoneNumber(json);
  }

  @override
  PhoneNumber copyWith(args) {
    return PhoneNumber(value);
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
