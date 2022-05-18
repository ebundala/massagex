import 'scalars/email_address.dart';
import 'scalars/phone_number.dart';
import 'gender.dart';
import 'business_create_without_owner_input.dart';

import "package:http/http.dart" show MultipartFile;
import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class SignupInput extends Equatable {
  final EmailAddress email;
  final String password;
  final String displayName;
  final PhoneNumber? phoneNumber;
  final Gender? gender;
  final DateTime? dateOfBirth;
  final MultipartFile? avator;
  final BusinessCreateWithoutOwnerInput? business;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (avator != null) {
      variables['${field_name}_avator'] = avator;
    }
    if (business != null) {
      business!.getFilesVariables(
          field_name: '${field_name}_business', variables: variables);
    }

    return variables;
  }

  List<ast.VariableDefinitionNode> getVariableDefinitionsNodes({
    required Map<String, dynamic> variables,
  }) {
    final List<ast.VariableDefinitionNode> vars = [];
    variables.forEach((key, value) {
      vars.add(ast.VariableDefinitionNode(
        variable: ast.VariableNode(name: ast.NameNode(value: key)),
        type: ast.NamedTypeNode(
            name: ast.NameNode(value: 'Upload'), isNonNull: true),
        defaultValue: ast.DefaultValueNode(value: null),
        directives: [],
      ));
    });
    return vars;
  }

  ast.ObjectValueNode toValueNode({required String field_name}) {
    return ast.ObjectValueNode(fields: [
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'email'),
        value: email.toValueNode(field_name: '${field_name}_email'),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'password'),
        value: ast.StringValueNode(value: '${password}', isBlock: false),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'displayName'),
        value: ast.StringValueNode(value: '${displayName}', isBlock: false),
      ),
      if (phoneNumber != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'phoneNumber'),
          value:
              phoneNumber!.toValueNode(field_name: '${field_name}_phoneNumber'),
        ),
      if (gender != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'gender'),
          value: ast.EnumValueNode(name: ast.NameNode(value: gender!.toJson())),
        ),
      if (dateOfBirth != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'dateOfBirth'),
          value: ast.StringValueNode(
              value: dateOfBirth!.toIso8601String(), isBlock: false),
        ),
      if (avator != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'avator'),
          value: ast.VariableNode(
              name: ast.NameNode(value: '${field_name}_avator')),
        ),
      if (business != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'business'),
          value: business!.toValueNode(field_name: '${field_name}_business'),
        )
    ]);
  }

  SignupInput(
      {required this.email,
      required this.password,
      required this.displayName,
      this.phoneNumber,
      this.gender,
      this.dateOfBirth,
      this.avator,
      this.business});

  static SignupInput fromJson(Map<dynamic, dynamic> json) {
    return SignupInput(
      email: EmailAddress.fromJson(json['email']),
      password: json['password'],
      displayName: json['displayName'],
      phoneNumber: json['phoneNumber'] != null
          ? PhoneNumber.fromJson(json['phoneNumber'])
          : null,
      gender:
          json['gender'] != null ? GenderExt.fromJson(json['gender']) : null,
      dateOfBirth: json['dateOfBirth'] != null
          ? DateTime.parse(json['dateOfBirth'])
          : null,
      avator: json['avator'],
      business: json['business'] != null
          ? BusinessCreateWithoutOwnerInput.fromJson(json['business'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};

    _data['email'] = email.toJson();

    _data['password'] = password;

    _data['displayName'] = displayName;
    if (phoneNumber != null) _data['phoneNumber'] = phoneNumber!.toJson();
    if (gender != null) _data['gender'] = gender!.toJson();
    if (dateOfBirth != null) _data['dateOfBirth'] = dateOfBirth!.toString();
    if (avator != null) _data['avator'] = avator;
    if (business != null) _data['business'] = business!.toJson();
    return _data;
  }

  SignupInput copyWith(
      {EmailAddress? email,
      String? password,
      String? displayName,
      PhoneNumber? phoneNumber,
      Gender? gender,
      DateTime? dateOfBirth,
      MultipartFile? avator,
      BusinessCreateWithoutOwnerInput? business}) {
    return SignupInput(
        email: email ?? this.email,
        password: password ?? this.password,
        displayName: displayName ?? this.displayName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        gender: gender ?? this.gender,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        avator: avator ?? this.avator,
        business: business ?? this.business);
  }

  List<Object?> get props => [
        email,
        password,
        displayName,
        phoneNumber,
        gender,
        dateOfBirth,
        avator,
        business
      ];
}
