part of 'paybill_bloc.dart';

extension on GraphQLClient {
  Future<OperationResult> paybill({required PaybillRequest data}) async {
    final Map<String, dynamic> vars = {};
    final List<ArgumentInfo> args = [];
    args.add(ArgumentInfo(name: 'data', value: data));
    vars.addAll(data.getFilesVariables(field_name: 'data'));

    final doc = transform(document, [NormalizeArgumentsVisitor(args: args)]);
    final result = await runObservableOperation(this,
        document: doc, variables: vars, operationName: 'paybill');
    return result;
  }

  //refetch fn
  void paybillRetry(ObservableQuery observableQuery) {
    if (observableQuery.isRefetchSafe == true) {
      observableQuery.refetch();
    }
  }
}
