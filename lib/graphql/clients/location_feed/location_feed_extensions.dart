part of 'location_feed_bloc.dart';

extension on GraphQLClient {
  Future<OperationResult> locationFeed({required String orderId}) async {
    final Map<String, dynamic> vars = {};
    final List<ArgumentInfo> args = [];
    vars.addAll({'orderId': orderId});

    final doc = transform(document, [NormalizeArgumentsVisitor(args: args)]);
    final result = await runObservableOperation(this,
        document: doc, variables: vars, operationName: 'locations');
    return result;
  }

  //refetch fn
  void locationFeedRetry(ObservableQuery observableQuery) {
    if (observableQuery.isRefetchSafe == true) {
      observableQuery.refetch();
    }
  }
}
