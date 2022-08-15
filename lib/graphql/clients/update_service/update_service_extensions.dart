part of 'update_service_bloc.dart';

extension on GraphQLClient {
  Future<OperationResult> updateService(
      {String? uid,
      required String name,
      required String serviceId,
      JSONObject? metadata,
      required double price,
      String? currency,
      String? description,
      AttachmentUpdateOneWithoutServicesInput? image}) async {
    final Map<String, dynamic> vars = {};
    final List<ArgumentInfo> args = [];
    if (uid != null) {
      vars.addAll({'uid': uid});
    }
    vars.addAll({'name': name});

    vars.addAll({'serviceId': serviceId});

    if (metadata != null) {
      args.add(ArgumentInfo(name: 'metadata', value: metadata));
      vars.addAll(metadata.getFilesVariables(field_name: 'metadata'));
    }
    vars.addAll({'price': price});

    if (currency != null) {
      vars.addAll({'currency': currency});
    }
    if (description != null) {
      vars.addAll({'description': description});
    }
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
