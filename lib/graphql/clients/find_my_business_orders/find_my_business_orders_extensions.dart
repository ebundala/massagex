part of 'find_my_business_orders_bloc.dart';

extension on GraphQLClient {
  Future<OperationResult> findMyBusinessOrders(
      {required String uid,
      OrderWhereInput? where,
      List<OrderOrderByInput>? orderBy,
      int? take,
      int? skip}) async {
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
    if (take != null) {
      vars.addAll({'take': take});
    }
    if (skip != null) {
      vars.addAll({'skip': skip});
    }
    final doc = transform(document, [NormalizeArgumentsVisitor(args: args)]);
    final result = await runObservableOperation(this,
        document: doc, variables: vars, operationName: 'findUniqueUser');
    return result;
  }

  //refetch fn
  void findMyBusinessOrdersRetry(ObservableQuery observableQuery) {
    if (observableQuery.isRefetchSafe == true) {
      observableQuery.refetch();
    }
  }
}
