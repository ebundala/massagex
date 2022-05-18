import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';

class OperationRuntimeInfo {
  final String operationName;
  final String fieldName;
  final OperationType type;
  const OperationRuntimeInfo(
      {required this.operationName,
      required this.fieldName,
      required this.type});
}

class OperationResult {
  final OperationRuntimeInfo info;
  final bool isStream;
  final bool isObservable;
  final Map<String, dynamic>? result;
  final Stream<QueryResult>? stream;
  final ObservableQuery? observableQuery;
  StreamSubscription<QueryResult>? subscription;

  OperationResult(
      {this.isStream = false,
      this.observableQuery,
      required this.info,
      this.result,
      this.stream,
      this.subscription,
      this.isObservable = false});
}

Future<OperationResult> runOperation(GraphQLClient client,
    {required DocumentNode document,
    Map<String, dynamic> variables = const {},
    FetchPolicy? fetchPolicy,
    ErrorPolicy? errorPolicy,
    CacheRereadPolicy? cacheRereadPolicy,
    Context? context,
    Object? optimisticResult,
    FutureOr<void> Function(dynamic)? onCompleted,
    FutureOr<void> Function(GraphQLDataProxy, QueryResult?)? update,
    FutureOr<void> Function(OperationException?)? onError}) async {
  var info = getOperationInfo(document);

  var result;
  switch (info!.type) {
    case OperationType.query:
      result = await client.query(QueryOptions(
        document: document,
        variables: variables,
        fetchPolicy: fetchPolicy,
        errorPolicy: errorPolicy,
        cacheRereadPolicy: cacheRereadPolicy,
        context: context,
        optimisticResult: optimisticResult,
      ));
      break;
    case OperationType.mutation:
      result = await client.mutate(MutationOptions(
          document: document,
          variables: variables,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          context: context,
          optimisticResult: optimisticResult,
          onCompleted: onCompleted,
          update: update,
          onError: onError));
      break;
    case OperationType.subscription:
      var subscription = await client.subscribe(SubscriptionOptions(
        document: document,
        variables: variables,
        fetchPolicy: fetchPolicy,
        errorPolicy: errorPolicy,
        cacheRereadPolicy: cacheRereadPolicy,
        context: context,
        optimisticResult: optimisticResult,
      ));
      var data = subscription.map((result) {
        var res = getDataFromField(info.fieldName, result);
        if (res != null) {
          result.data = res;
        }
        return result;
      });
      return OperationResult(isStream: true, stream: data, info: info);
  }
  var data = getDataFromField(info.fieldName, result);
  return OperationResult(result: data, info: info);
}

Future<OperationResult> runObservableOperation(GraphQLClient client,
    {required DocumentNode document,
    Map<String, dynamic> variables = const {},
    FetchPolicy? fetchPolicy,
    ErrorPolicy? errorPolicy,
    CacheRereadPolicy? cacheRereadPolicy,
    Context? context,
    Object? optimisticResult,
    Duration? pollInterval,
    bool fetchResults = false,
    bool carryForwardDataOnException = true,
    bool? eagerlyFetchResults,
    required String operationName}) async {
  var info = getOperationInfo(document);

  var result;
  switch (info!.type) {
    case OperationType.query:
      result = client.watchQuery(WatchQueryOptions(
          document: document,
          variables: variables,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          context: context,
          optimisticResult: optimisticResult,
          fetchResults: fetchResults,
          eagerlyFetchResults: eagerlyFetchResults,
          pollInterval: pollInterval,
          carryForwardDataOnException: carryForwardDataOnException));
      break;
    case OperationType.mutation:
      result = await client.watchMutation(WatchQueryOptions(
          document: document,
          variables: variables,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          context: context,
          optimisticResult: optimisticResult,
          fetchResults: fetchResults,
          eagerlyFetchResults: eagerlyFetchResults,
          pollInterval: pollInterval,
          carryForwardDataOnException: carryForwardDataOnException));
      break;
    case OperationType.subscription:
    default:
      result = await client.subscribe(
        SubscriptionOptions(
          document: document,
          variables: variables,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          context: context,
          optimisticResult: optimisticResult,
        ),
      );
      break;
  }

  if (result is ObservableQuery) {
    var stream = result.stream.map((res) {
      var data = getDataFromField(operationName, res);
      res.data = data;
      return res;
    });
    return OperationResult(
        info: info,
        isObservable: true,
        observableQuery: result,
        stream: stream);
  } else if (result is Stream<QueryResult>) {
    var stream = result.map((res) {
      var data = getDataFromField(operationName, res);
      res.data = data;
      return res;
    });
    return OperationResult(isStream: true, stream: stream, info: info);
  } else {
    throw UnsupportedError("Operation is not supported");
  }
}

Map<String, dynamic>? getDataFromField(String fieldName, QueryResult result) {
  return result.data?['$fieldName'];
}

OperationRuntimeInfo? getOperationInfo(DocumentNode document) {
  var defs = document.definitions;
  if (defs.isNotEmpty == true) {
    bool predicate(DefinitionNode v) {
      if (v is OperationDefinitionNode) {
        return true;
      }
      return false;
    }

    ;
    var op = defs.firstWhere(predicate) as OperationDefinitionNode;
    var type = op.type;
    var name = op.name?.value;
    var field = op.selectionSet.selections.firstWhere((v) {
      if (v is FieldNode) {
        if (v.selectionSet != null) {
          return true;
        }
      }
      return false;
    }) as FieldNode;
    var fieldName = field.name.value;
    return OperationRuntimeInfo(
        fieldName: fieldName, operationName: name!, type: type);
  }
  return null;
}

class ArgumentInfo {
  final String name;
  final dynamic value;
  ArgumentInfo({required this.name, this.value});
}

class NormalizeArgumentsVisitor extends TransformingVisitor {
  final List<ArgumentInfo> args;
  List<VariableDefinitionNode> definitions = [];
  Map<String, ValueNode> valueNodes = {};

  NormalizeArgumentsVisitor({required this.args}) : super() {
    for (var k = 0; k < args.length; k++) {
      final v = args.elementAt(k);
      final value = v.value;
      Map<String, dynamic> vars;
      if (value is List) {
        var i = -1;
        vars = value.map((e) {
          i++;
          return e.getFilesVariables(field_name: '${v.name}_$i');
        }).fold<Map<String, dynamic>>({}, (p, e) {
          p.addAll(e);
          return p;
        });
        valueNodes[v.name] = ListValueNode(
          values: value
              .map<ValueNode>(
                (e) => e?.toValueNode(field_name: v.name),
              )
              .toList(),
        );
        definitions.addAll(
          value
              .map<List<VariableDefinitionNode>>(
                  (e) => e?.getVariableDefinitionsNodes(variables: vars) ?? [])
              .fold<List<VariableDefinitionNode>>(
            [],
            (p, n) {
              p.addAll(n);
              return p;
            },
          ).toList(),
        );
      } else {
        vars = value?.getFilesVariables(field_name: v.name);
        valueNodes[v.name] = value?.toValueNode(field_name: v.name);
        definitions
            .addAll(value?.getVariableDefinitionsNodes(variables: vars) ?? []);
      }
    }
  }
  // @override
  // FieldNode visitFieldNode(FieldNode node) {
  //   final normalized = argsNodes.where((e) {
  //     if(e.value is )
  //     valueNodes[e.value.name.value] != null;
  //   }).toList();
  //   final newNode = FieldNode(
  //     name: node.name,
  //     alias: node.alias,
  //     arguments: [
  //       ...node.arguments
  //           .where((e) => e.value
  //               is! VariableNode /* valueNodes[e.value.name.value] == null */)
  //           .toList(),
  //     ],
  //     directives: node.directives,
  //     selectionSet: node.selectionSet,
  //   );
  //   return newNode;
  // }

  @override
  OperationDefinitionNode visitOperationDefinitionNode(
      OperationDefinitionNode node) {
    final defs = node.variableDefinitions.where((element) {
      return args
              .firstWhere((e) => e.name == element.variable.name.value,
                  orElse: () => ArgumentInfo(name: "__notfound"))
              .name ==
          "__notfound";
    }).toList();
    return OperationDefinitionNode(
        directives: node.directives,
        name: node.name,
        selectionSet: node.selectionSet,
        type: node.type,
        variableDefinitions: [...defs, ...definitions]);
  }

  @override
  ObjectFieldNode visitObjectFieldNode(ObjectFieldNode node) {
    if (node.value is VariableNode) {
      final v = node.value as VariableNode;
      final newArgValue = valueNodes[v.name.value];
      if (newArgValue != null) {
        return super.visitObjectFieldNode(
            ObjectFieldNode(name: node.name, value: newArgValue));
      }
    }
    return super.visitObjectFieldNode(node);
  }

  @override
  ArgumentNode visitArgumentNode(ArgumentNode node) {
    //add arguments values
    if (node.value is VariableNode) {
      final v = node.value as VariableNode;
      final newArgValue = valueNodes[v.name.value];
      if (newArgValue != null) {
        return super.visitArgumentNode(
            ArgumentNode(name: node.name, value: newArgValue));
      }
    }
    return super.visitArgumentNode(node);
  }
}
