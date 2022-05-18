part of 'find_many_businesses_bloc.dart';

extension on GraphQLClient {
  Future<OperationResult> findManyBusinesses() async {
    final Map<String, dynamic> vars = {};
    final List<ArgumentInfo> args = [];

    final doc = transform(document, [NormalizeArgumentsVisitor(args: args)]);
    final result = await runObservableOperation(this,
        document: doc, variables: vars, operationName: 'findManyBusiness');
    return result;
  }

  //refetch fn
  void findManyBusinessesRetry(ObservableQuery observableQuery) {
    if (observableQuery.isRefetchSafe == true) {
      observableQuery.refetch();
    }
  }

  //load more fn
  void findManyBusinessesLoadMore(
    ObservableQuery observableQuery,
  ) {
    final Map<String, dynamic> vars = {};
    final List<ArgumentInfo> args = [];

    final doc = transform(document, [NormalizeArgumentsVisitor(args: args)]);
    observableQuery.fetchMore(
      FetchMoreOptions(
        document: doc,
        variables: vars,
        updateQuery: (cached, n) {
          var p = cached ?? observableQuery.latestResult?.data;
          if (n != null) {
            var data = n['findManyBusiness'];
            if (p != null) {
              var data2 = p['findManyBusiness'];
              if (data2 != null && data != null) {
                if (data2['data'] is List && data['data'] is List) {
                  (data2['data'] as List).addAll((data['data'] as List));
                  p['data'] = data2;
                  return p;
                }
              }
            } else {
              return n;
            }
          }

          return p;
        },
      ),
    );
  }
}
