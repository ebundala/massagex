part of 'find_payment_methods_bloc.dart';

extension on GraphQLClient {
  Future<OperationResult> findPaymentMethods() async {
    final Map<String, dynamic> vars = {};
    final List<ArgumentInfo> args = [];

    final doc = transform(document, [NormalizeArgumentsVisitor(args: args)]);
    final result = await runObservableOperation(this,
        document: doc, variables: vars, operationName: 'findManyPaymentMethod');
    return result;
  }

  //refetch fn
  void findPaymentMethodsRetry(ObservableQuery observableQuery) {
    if (observableQuery.isRefetchSafe == true) {
      observableQuery.refetch();
    }
  }

  //load more fn
  void findPaymentMethodsLoadMore(
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
            var data = n['findManyPaymentMethod'];
            if (p != null) {
              var data2 = p['findManyPaymentMethod'];
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
