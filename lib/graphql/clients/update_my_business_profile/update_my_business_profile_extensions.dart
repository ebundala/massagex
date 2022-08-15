part of 'update_my_business_profile_bloc.dart';

extension on GraphQLClient {
  Future<OperationResult> updateMyBusinessProfile(
      {required String id,
      StringFieldUpdateOperationsInput? about,
      StringFieldUpdateOperationsInput? businessName,
      JSONObject? metadata,
      EnumBusinessStatusFieldUpdateOperationsInput? status,
      LocationUpdateWithoutBusinessesInput? location,
      EnumBusinessModeFieldUpdateOperationsInput? mode,
      AttachmentCreateWithoutBusinessesInput? cover,
      List<AttachmentCreateWithoutBusinessInput>? gallery,
      List<AttachmentWhereUniqueInput>? deletedAttachments}) async {
    final Map<String, dynamic> vars = {};
    final List<ArgumentInfo> args = [];
    vars.addAll({'id': id});

    if (about != null) {
      args.add(ArgumentInfo(name: 'about', value: about));
      vars.addAll(about.getFilesVariables(field_name: 'about'));
    }
    if (businessName != null) {
      args.add(ArgumentInfo(name: 'businessName', value: businessName));
      vars.addAll(businessName.getFilesVariables(field_name: 'businessName'));
    }
    if (metadata != null) {
      args.add(ArgumentInfo(name: 'metadata', value: metadata));
      vars.addAll(metadata.getFilesVariables(field_name: 'metadata'));
    }
    if (status != null) {
      args.add(ArgumentInfo(name: 'status', value: status));
      vars.addAll(status.getFilesVariables(field_name: 'status'));
    }
    if (location != null) {
      args.add(ArgumentInfo(name: 'location', value: location));
      vars.addAll(location.getFilesVariables(field_name: 'location'));
    }
    if (mode != null) {
      args.add(ArgumentInfo(name: 'mode', value: mode));
      vars.addAll(mode.getFilesVariables(field_name: 'mode'));
    }
    if (cover != null) {
      args.add(ArgumentInfo(name: 'cover', value: cover));
      vars.addAll(cover.getFilesVariables(field_name: 'cover'));
    }
    if (gallery != null) {
      var i = -1;
      var files = gallery.map((e) {
        i++;
        return e.getFilesVariables(field_name: 'gallery_$i');
      }).fold<Map<String, dynamic>>({}, (p, e) {
        p.addAll(e);
        return p;
      });
      vars.addAll(files);
      args.add(ArgumentInfo(name: 'gallery', value: gallery));
    }
    if (deletedAttachments != null) {
      var i = -1;
      var files = deletedAttachments.map((e) {
        i++;
        return e.getFilesVariables(field_name: 'deletedAttachments_$i');
      }).fold<Map<String, dynamic>>({}, (p, e) {
        p.addAll(e);
        return p;
      });
      vars.addAll(files);
      args.add(
          ArgumentInfo(name: 'deletedAttachments', value: deletedAttachments));
    }
    final doc = transform(document, [NormalizeArgumentsVisitor(args: args)]);
    final result = await runObservableOperation(this,
        document: doc, variables: vars, operationName: 'updateOneUser');
    return result;
  }

  //refetch fn
  void updateMyBusinessProfileRetry(ObservableQuery observableQuery) {
    if (observableQuery.isRefetchSafe == true) {
      observableQuery.refetch();
    }
  }
}
