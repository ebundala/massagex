part of 'find_user_bloc.dart';

extension on GraphQLClient {
  Future<OperationResult> findUser({required String id}) async {
    final Map<String, dynamic> vars = {};
    final List<ArgumentInfo> args = [];
    vars.addAll({'id': id});

    final doc = transform(document, [NormalizeArgumentsVisitor(args: args)]);
    final result = await runObservableOperation(this,
        document: doc, variables: vars, operationName: 'findUniqueUser');
    return result;
  }

  //refetch fn
  void findUserRetry(ObservableQuery observableQuery) {
    if (observableQuery.isRefetchSafe == true) {
      observableQuery.refetch();
    }
  }
}
