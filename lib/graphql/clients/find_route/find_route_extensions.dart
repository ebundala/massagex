part of 'find_route_bloc.dart';

extension on GraphQLClient {
  Future<OperationResult> findRoute(
      {required LatLngInput origin, required LatLngInput destination}) async {
    final Map<String, dynamic> vars = {};
    final List<ArgumentInfo> args = [];
    args.add(ArgumentInfo(name: 'origin', value: origin));
    vars.addAll(origin.getFilesVariables(field_name: 'origin'));

    args.add(ArgumentInfo(name: 'destination', value: destination));
    vars.addAll(destination.getFilesVariables(field_name: 'destination'));

    final doc = transform(document, [NormalizeArgumentsVisitor(args: args)]);
    final result = await runObservableOperation(this,
        document: doc, variables: vars, operationName: 'route');
    return result;
  }

  //refetch fn
  void findRouteRetry(ObservableQuery observableQuery) {
    if (observableQuery.isRefetchSafe == true) {
      observableQuery.refetch();
    }
  }
}
