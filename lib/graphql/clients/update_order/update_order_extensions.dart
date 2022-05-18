part of 'update_order_bloc.dart';

extension on GraphQLClient {
  Future<OperationResult> updateOrder() async {
    final Map<String, dynamic> vars = {};
    final List<ArgumentInfo> args = [];

    final doc = transform(document, [NormalizeArgumentsVisitor(args: args)]);
    final result = await runObservableOperation(this,
        document: doc, variables: vars, operationName: 'updateOneUser');
    return result;
  }

  //refetch fn
  void updateOrderRetry(ObservableQuery observableQuery) {
    if (observableQuery.isRefetchSafe == true) {
      observableQuery.refetch();
    }
  }
}
