part of 'find_my_business_services_bloc.dart';

extension on GraphQLClient {
  Future<OperationResult> findMyBusinessServices(
      {required String uid,
      ServiceWhereInput? where,
      int? skip,
      int? take}) async {
    final Map<String, dynamic> vars = {};
    final List<ArgumentInfo> args = [];
    vars.addAll({'uid': uid});

    if (where != null) {
      args.add(ArgumentInfo(name: 'where', value: where));
      vars.addAll(where.getFilesVariables(field_name: 'where'));
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
  void findMyBusinessServicesRetry(ObservableQuery observableQuery) {
    if (observableQuery.isRefetchSafe == true) {
      observableQuery.refetch();
    }
  }
}
