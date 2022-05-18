part of 'update_service_bloc.dart';

extension on GraphQLClient {
  Future<OperationResult> updateService(
      {AttachmentCreateWithoutServicesInput? image}) async {
    final Map<String, dynamic> vars = {};
    final List<ArgumentInfo> args = [];
    if (image != null) {
      args.add(ArgumentInfo(name: 'image', value: image));
      vars.addAll(image.getFilesVariables(field_name: 'image'));
    }
    final doc = transform(document, [NormalizeArgumentsVisitor(args: args)]);
    final result = await runObservableOperation(this,
        document: doc, variables: vars, operationName: 'updateOneUser');
    return result;
  }

  //refetch fn
  void updateServiceRetry(ObservableQuery observableQuery) {
    if (observableQuery.isRefetchSafe == true) {
      observableQuery.refetch();
    }
  }
}
