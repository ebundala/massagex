part of 'find_business_bloc.dart';

extension on GraphQLClient {
  Future<OperationResult> findBusiness({required String id}) async {
    final Map<String, dynamic> vars = {};
    final List<ArgumentInfo> args = [];
    vars.addAll({'id': id});

    final doc = transform(document, [NormalizeArgumentsVisitor(args: args)]);
    final result = await runObservableOperation(this,
        document: doc, variables: vars, operationName: 'findUniqueBusiness');
    return result;
  }

  //refetch fn
  void findBusinessRetry(ObservableQuery observableQuery) {
    if (observableQuery.isRefetchSafe == true) {
      observableQuery.refetch();
    }
  }
}
