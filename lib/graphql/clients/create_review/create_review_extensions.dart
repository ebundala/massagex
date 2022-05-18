part of 'create_review_bloc.dart';

extension on GraphQLClient {
  Future<OperationResult> createReview(
      {List<AttachmentCreateWithoutReviewsInput>? attachments}) async {
    final Map<String, dynamic> vars = {};
    final List<ArgumentInfo> args = [];
    if (attachments != null) {
      var i = -1;
      var files = attachments.map((e) {
        i++;
        return e.getFilesVariables(field_name: 'attachments_$i');
      }).fold<Map<String, dynamic>>({}, (p, e) {
        p.addAll(e);
        return p;
      });
      vars.addAll(files);
      args.add(ArgumentInfo(name: 'attachments', value: attachments));
    }
    final doc = transform(document, [NormalizeArgumentsVisitor(args: args)]);
    final result = await runObservableOperation(this,
        document: doc, variables: vars, operationName: 'updateOneUser');
    return result;
  }

  //refetch fn
  void createReviewRetry(ObservableQuery observableQuery) {
    if (observableQuery.isRefetchSafe == true) {
      observableQuery.refetch();
    }
  }
}
