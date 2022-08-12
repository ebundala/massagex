part of 'update_my_profile_bloc.dart';

extension on GraphQLClient {
  Future<OperationResult> updateMyProfile(
      {required String id,
      NullableStringFieldUpdateOperationsInput? displayName,
      NullableStringFieldUpdateOperationsInput? phoneNumber,
      NullableDateTimeFieldUpdateOperationsInput? dateOfBirth,
      EnumGenderFieldUpdateOperationsInput? gender,
      JSONObject? metadata,
      LocationUpsertWithoutUsersInput? location,
      AttachmentUpdateOneWithoutUsersInput? avator,
      BusinessUpsertWithoutOwnerInput? businessProfile}) async {
    final Map<String, dynamic> vars = {};
    final List<ArgumentInfo> args = [];
    vars.addAll({'id': id});

    if (displayName != null) {
      args.add(ArgumentInfo(name: 'displayName', value: displayName));
      vars.addAll(displayName.getFilesVariables(field_name: 'displayName'));
    }
    if (phoneNumber != null) {
      args.add(ArgumentInfo(name: 'phoneNumber', value: phoneNumber));
      vars.addAll(phoneNumber.getFilesVariables(field_name: 'phoneNumber'));
    }
    if (dateOfBirth != null) {
      args.add(ArgumentInfo(name: 'dateOfBirth', value: dateOfBirth));
      vars.addAll(dateOfBirth.getFilesVariables(field_name: 'dateOfBirth'));
    }
    if (gender != null) {
      args.add(ArgumentInfo(name: 'gender', value: gender));
      vars.addAll(gender.getFilesVariables(field_name: 'gender'));
    }
    if (metadata != null) {
      args.add(ArgumentInfo(name: 'metadata', value: metadata));
      vars.addAll(metadata.getFilesVariables(field_name: 'metadata'));
    }
    if (location != null) {
      args.add(ArgumentInfo(name: 'location', value: location));
      vars.addAll(location.getFilesVariables(field_name: 'location'));
    }
    if (avator != null) {
      args.add(ArgumentInfo(name: 'avator', value: avator));
      vars.addAll(avator.getFilesVariables(field_name: 'avator'));
    }
    if (businessProfile != null) {
      args.add(ArgumentInfo(name: 'businessProfile', value: businessProfile));
      vars.addAll(
          businessProfile.getFilesVariables(field_name: 'businessProfile'));
    }
    final doc = transform(document, [NormalizeArgumentsVisitor(args: args)]);
    final result = await runObservableOperation(this,
        document: doc, variables: vars, operationName: 'updateOneUser');
    return result;
  }

  //refetch fn
  void updateMyProfileRetry(ObservableQuery observableQuery) {
    if (observableQuery.isRefetchSafe == true) {
      observableQuery.refetch();
    }
  }
}
