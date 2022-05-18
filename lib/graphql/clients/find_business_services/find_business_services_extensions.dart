part of 'find_business_services_bloc.dart';

extension on GraphQLClient {
  Future<OperationResult> findBusinessServices() async {
    final Map<String, dynamic> vars = {};
    final List<ArgumentInfo> args = [];

    final doc = transform(document, [NormalizeArgumentsVisitor(args: args)]);
    final result = await runObservableOperation(this,
        document: doc, variables: vars, operationName: 'findUniqueUser');
    return result;
  }

  //refetch fn
  void findBusinessServicesRetry(ObservableQuery observableQuery) {
    if (observableQuery.isRefetchSafe == true) {
      observableQuery.refetch();
    }
  }
}
