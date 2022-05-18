part of 'signup_bloc.dart';

extension on GraphQLClient {
  Future<OperationResult> signup({required SignupInput credentials}) async {
    final Map<String, dynamic> vars = {};
    final List<ArgumentInfo> args = [];
    args.add(ArgumentInfo(name: 'credentials', value: credentials));
    vars.addAll(credentials.getFilesVariables(field_name: 'credentials'));

    final doc = transform(document, [NormalizeArgumentsVisitor(args: args)]);
    final result = await runObservableOperation(this,
        document: doc, variables: vars, operationName: 'signup');
    return result;
  }

  //refetch fn
  void signupRetry(ObservableQuery observableQuery) {
    if (observableQuery.isRefetchSafe == true) {
      observableQuery.refetch();
    }
  }
}
