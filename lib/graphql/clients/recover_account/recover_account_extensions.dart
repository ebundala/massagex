part of 'recover_account_bloc.dart';

extension on GraphQLClient {
  Future<OperationResult> recoverAccount({required String email}) async {
    final Map<String, dynamic> vars = {};
    final List<ArgumentInfo> args = [];
    vars.addAll({'email': email});

    final doc = transform(document, [NormalizeArgumentsVisitor(args: args)]);
    final result = await runObservableOperation(this,
        document: doc, variables: vars, operationName: 'recoverAccount');
    return result;
  }

  //refetch fn
  void recoverAccountRetry(ObservableQuery observableQuery) {
    if (observableQuery.isRefetchSafe == true) {
      observableQuery.refetch();
    }
  }
}
