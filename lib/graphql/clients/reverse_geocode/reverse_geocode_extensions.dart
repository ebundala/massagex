part of 'reverse_geocode_bloc.dart';

extension on GraphQLClient {
  Future<OperationResult> reverseGeocode(
      {required double latitude, required double longitude}) async {
    final Map<String, dynamic> vars = {};
    final List<ArgumentInfo> args = [];
    vars.addAll({'latitude': latitude});

    vars.addAll({'longitude': longitude});

    final doc = transform(document, [NormalizeArgumentsVisitor(args: args)]);
    final result = await runObservableOperation(this,
        document: doc, variables: vars, operationName: 'reverseGeocode');
    return result;
  }

  //refetch fn
  void reverseGeocodeRetry(ObservableQuery observableQuery) {
    if (observableQuery.isRefetchSafe == true) {
      observableQuery.refetch();
    }
  }
}
