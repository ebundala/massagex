part of 'register_device_bloc.dart';

extension on GraphQLClient {
  Future<OperationResult> registerDevice(
      {required RegisterDeviceInput device}) async {
    final Map<String, dynamic> vars = {};
    final List<ArgumentInfo> args = [];
    args.add(ArgumentInfo(name: 'device', value: device));
    vars.addAll(device.getFilesVariables(field_name: 'device'));

    final doc = transform(document, [NormalizeArgumentsVisitor(args: args)]);
    final result = await runObservableOperation(this,
        document: doc, variables: vars, operationName: 'registerDevice');
    return result;
  }

  //refetch fn
  void registerDeviceRetry(ObservableQuery observableQuery) {
    if (observableQuery.isRefetchSafe == true) {
      observableQuery.refetch();
    }
  }
}
