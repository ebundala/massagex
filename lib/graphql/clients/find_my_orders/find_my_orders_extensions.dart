part of 'find_my_orders_bloc.dart';

extension on GraphQLClient {
  Future<OperationResult> findMyOrders(
      {required String uid,
      OrderWhereInput? where,
      List<OrderOrderByInput>? orderBy,
      int? skip,
      int? take}) async {
    final Map<String, dynamic> vars = {};
    final List<ArgumentInfo> args = [];
    vars.addAll({'uid': uid});

    if (where != null) {
      args.add(ArgumentInfo(name: 'where', value: where));
      vars.addAll(where.getFilesVariables(field_name: 'where'));
    }
    if (orderBy != null) {
      var i = -1;
      var files = orderBy.map((e) {
        i++;
        return e.getFilesVariables(field_name: 'orderBy_$i');
      }).fold<Map<String, dynamic>>({}, (p, e) {
        p.addAll(e);
        return p;
      });
      vars.addAll(files);
      args.add(ArgumentInfo(name: 'orderBy', value: orderBy));
    }
    if (skip != null) {
      vars.addAll({'skip': skip});
    }
    if (take != null) {
      vars.addAll({'take': take});
    }
    final doc = transform(document, [NormalizeArgumentsVisitor(args: args)]);
    final result = await runObservableOperation(this,
        document: doc, variables: vars, operationName: 'findUniqueUser');
    return result;
  }

  //refetch fn
  void findMyOrdersRetry(ObservableQuery observableQuery) {
    if (observableQuery.isRefetchSafe == true) {
      observableQuery.refetch();
    }
  }
}
