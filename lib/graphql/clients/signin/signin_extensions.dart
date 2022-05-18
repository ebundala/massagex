part of 'signin_bloc.dart';

extension on GraphQLClient {
  Future<OperationResult> signin({required AuthInput credentials}) async {
    final Map<String, dynamic> vars = {};
    final List<ArgumentInfo> args = [];
    args.add(ArgumentInfo(name: 'credentials', value: credentials));
    vars.addAll(credentials.getFilesVariables(field_name: 'credentials'));

    final doc = transform(document, [NormalizeArgumentsVisitor(args: args)]);
    final result = await runObservableOperation(this,
        document: doc, variables: vars, operationName: 'signin');
    return result;
  }

  //refetch fn
  void signinRetry(ObservableQuery observableQuery) {
    if (observableQuery.isRefetchSafe == true) {
      observableQuery.refetch();
    }
  }
}
