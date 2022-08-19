part of 'find_services_bloc.dart';

extension on GraphQLClient {
  Future<OperationResult> findServices(
      {required String businessId,
      ServiceWhereInput? where,
      int? take,
      int? skip}) async {
    final Map<String, dynamic> vars = {};
    final List<ArgumentInfo> args = [];
    vars.addAll({'businessId': businessId});

    if (where != null) {
      args.add(ArgumentInfo(name: 'where', value: where));
      vars.addAll(where.getFilesVariables(field_name: 'where'));
    }
    if (take != null) {
      vars.addAll({'take': take});
    }
    if (skip != null) {
      vars.addAll({'skip': skip});
    }
    final doc = transform(document, [NormalizeArgumentsVisitor(args: args)]);
    final result = await runObservableOperation(this,
        document: doc, variables: vars, operationName: 'findUniqueBusiness');
    return result;
  }

  //refetch fn
  void findServicesRetry(ObservableQuery observableQuery) {
    if (observableQuery.isRefetchSafe == true) {
      observableQuery.refetch();
    }
  }
}
