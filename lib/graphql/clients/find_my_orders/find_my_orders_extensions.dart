part of 'find_my_orders_bloc.dart';

extension on GraphQLClient {
  Future<OperationResult> findMyOrders() async {
    final Map<String, dynamic> vars = {};
    final List<ArgumentInfo> args = [];

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
