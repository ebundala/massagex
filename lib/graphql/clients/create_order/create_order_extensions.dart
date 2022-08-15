part of 'create_order_bloc.dart';

extension on GraphQLClient {
  Future<OperationResult> createOrder(
      {required String uid,
      required int count,
      required List<OrderCreateWithoutOwnerInput> orders}) async {
    final Map<String, dynamic> vars = {};
    final List<ArgumentInfo> args = [];
    vars.addAll({'uid': uid});

    vars.addAll({'count': count});

    var i = -1;
    var files = orders.map((e) {
      i++;
      return e.getFilesVariables(field_name: 'orders_$i');
    }).fold<Map<String, dynamic>>({}, (p, e) {
      p.addAll(e);
      return p;
    });
    vars.addAll(files);
    args.add(ArgumentInfo(name: 'orders', value: orders));

    final doc = transform(document, [NormalizeArgumentsVisitor(args: args)]);
    final result = await runObservableOperation(this,
        document: doc, variables: vars, operationName: 'updateOneUser');
    return result;
  }

  //refetch fn
  void createOrderRetry(ObservableQuery observableQuery) {
    if (observableQuery.isRefetchSafe == true) {
      observableQuery.refetch();
    }
  }
}
