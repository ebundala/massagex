import 'package:gql/ast.dart';
import 'graphql_custom_type_base.dart';

class JSONObject implements GraphQLCustomType<JSONObject> {
  JSONObject(this.value);
  final Map<String, dynamic> value;
  static JSONObject fromJson(Map<dynamic, dynamic> json) {
    var item = json.keys.fold<Map<String, dynamic>>({}, (previousValue, e) {
      if (e is String) {
        previousValue[e] = json[e];
      }
      return previousValue;
    });

    return JSONObject(item);
  }

  @override
  JSONObject copyWith(json) {
    var item = (json as Map<dynamic, dynamic>)
        .keys
        .fold<Map<String, dynamic>>({}, (previousValue, e) {
      if (e is String) {
        previousValue[e] = json[e];
      }
      return previousValue;
    });
    item.addAll(value);
    return JSONObject(item);
  }

  @override
  List<Object?> get props => [value];

  @override
  Map<String, dynamic> toJson() {
    return value;
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
    final List<VariableDefinitionNode> vars = [];
    return vars;
  }

  @override
  bool? get stringify => null;

  @override
  ObjectValueNode toValueNode({required String field_name}) {
    return jsonToValueNode(value);
  }

  ObjectValueNode jsonToValueNode(Map<String, dynamic> json) {
    final keys = json.keys;
    if (keys.length > 0) {
      return ObjectValueNode(fields: [
        ...json.entries.map((e) {
          final nameNode = NameNode(value: e.key);

          if (e.value is Map<String, dynamic>) {
            return ObjectFieldNode(
                name: nameNode, value: jsonToValueNode(e.value));
          } else if (e.value is bool) {
            return ObjectFieldNode(
                name: nameNode, value: BooleanValueNode(value: e.value));
          } else if (e.value is int) {
            return ObjectFieldNode(
                name: nameNode, value: IntValueNode(value: '${e.value}'));
          } else if (e.value is double) {
            return ObjectFieldNode(
                name: nameNode, value: FloatValueNode(value: '${e.value}'));
          } else if (e.value is String) {
            return ObjectFieldNode(
              name: nameNode,
              value: StringValueNode(value: e.value, isBlock: false),
            );
          }
          return ObjectFieldNode(name: nameNode, value: NullValueNode());
        })
      ]);
    } else {
      return ObjectValueNode(fields: []);
    }
  }
}
