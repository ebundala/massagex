import 'dart:convert';
import 'package:massagex/widgets/themes/light_theme.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:massagex/graphql/clients/recover_account/recover_account_bloc.dart';
import 'package:massagex/graphql/clients/signin/signin_bloc.dart';
import 'package:massagex/graphql/clients/signup/signup_bloc.dart';
import 'package:massagex/graphql/clients/update_my_profile/update_my_profile_bloc.dart';
import 'package:massagex/graphql/clients/find_user/find_user_bloc.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:graphql/client.dart';
//import 'package:graphql_to_dart/graphql_to_dart.dart';
//import 'package:build/build.dart';
//import 'package:yaml/yaml.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:models/attachment_create_nested_one_without_businesses_input.dart';
import 'package:models/attachment_create_without_businesses_input.dart';
import 'package:models/attachment_create_without_users_input.dart';
import 'package:models/attachment_update_one_without_users_input.dart';
import 'package:models/auth_input.dart';
import 'package:models/business_create_without_owner_input.dart';
import 'package:models/business_mode.dart';
import 'package:models/enum_gender_field_update_operations_input.dart';
import 'package:models/gender.dart';
import 'package:models/scalars/email_address.dart';
import 'package:models/scalars/json_object.dart';
import 'package:models/scalars/phone_number.dart';
import 'package:models/signup_input.dart';
import 'package:models/string_field_update_operations_input.dart';

//import 'package:example/graphql/models/lib/string_field_update_operations_input.dart';

void main(List<String> args) async {
  if (kDebugMode) {
    print(args);
  }

  final client = GraphQLClient(
      link: HttpLink("http://localhost:3000/graphql"),
      cache: GraphQLCache(store: InMemoryStore()));

  runApp(MyApp(
    client: client,
  ));
}

@WidgetbookApp.material(
  name: 'massageX',
  frames: [
    WidgetbookFrame(
      name: 'Widgetbook',
      allowsDevices: true,
    ),
    WidgetbookFrame(
      name: 'None',
      allowsDevices: false,
    ),
  ],
  devices: [Apple.iPhone12],
  textScaleFactors: [
    1,
    2,
    3,
  ],
  foldersExpanded: true,
  widgetsExpanded: true,
)
class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.client}) : super(key: key);
  final GraphQLClient client;
  final excuted = UpdateMyProfileExcuted(
      id: "TuyoLCVuK1VTMIXwFHxWrniFRLn1",
      gender: EnumGenderFieldUpdateOperationsInput(set$: Gender.MALE),
      displayName: StringFieldUpdateOperationsInput(set$: "Juma Athuman"),
      metadata: JSONObject({
        "root": "value",
        "deeper": {"number": 1, "points": 0.67, "checks": false}
      }),
      avator: AttachmentUpdateOneWithoutUsersInput(
          create: AttachmentCreateWithoutUsersInput(
              path: MultipartFile.fromBytes(
                  "", "hello world test file upload here".codeUnits),
              mimetype: "text/plain")));
  final retried = UpdateMyProfileRetried();
  @override
  Widget build(BuildContext context) {
    final bloc = UpdateMyProfileBloc(client: client);
    final userbloc = FindUserBloc(client: client);
    final loginBloc = SigninBloc(client: client);
    final signupBloc = SignupBloc(client: client);
    final recoverAccount = RecoverAccountBloc(client: client);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => bloc),
        BlocProvider(create: (ctx) => userbloc),
        BlocProvider(create: (ctx) => loginBloc),
        BlocProvider(create: (ctx) => signupBloc),
        BlocProvider(create: (ctx) => recoverAccount)
      ],
      child: Builder(builder: (context) {
        return SafeArea(
          child: MaterialApp(
            theme: mainTheme,
            home: Scaffold(
              appBar: AppBar(
                title: const Text("test app"),
              ),
              floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.more),
                onPressed: () {
                  BlocProvider.of<UpdateMyProfileBloc>(context).add(excuted);
                },
              ),
              body: SizedBox.expand(
                child: Builder(builder: (context) {
                  return BlocConsumer<UpdateMyProfileBloc,
                      UpdateMyProfileState>(
                    listener: (context, state) {
                      if (state is UpdateMyProfileSuccess) {
                        if (kDebugMode) {
                          print(state.message);
                        }
                      }
                    },
                    builder: (context, state) {
                      return RefreshIndicator(
                        onRefresh: () {
                          BlocProvider.of<UpdateMyProfileBloc>(context)
                              .add(retried);
                          return Future.value();
                        },
                        child: ListView(
                          children: [
                            if (state is UpdateMyProfileInProgress)
                              const Center(
                                child: CircularProgressIndicator(),
                              ),
                            if (state is UpdateMyProfileSuccess)
                              ListTile(
                                title: Text(state.data.data?.displayName ??
                                    "not changed"),
                              ),
                            if (state is UpdateMyProfileFailure ||
                                state is UpdateMyProfileError)
                              ListTile(
                                title:
                                    Text(state.data?.message ?? "not changed"),
                              ),
                            BlocBuilder<FindUserBloc, FindUserState>(
                              builder: (context, state) {
                                return ListBody(
                                  children: [
                                    if (state is FindUserSuccess)
                                      Text(jsonEncode(
                                          state.data.data!.toJson())),
                                    if (state is FindUserError)
                                      Text(state.message!),
                                    SizedBox(
                                      height: 30,
                                      child: ElevatedButton(
                                          child: const Text("finduser"),
                                          onPressed: () {
                                            BlocProvider.of<FindUserBloc>(
                                                    context)
                                                .add(
                                              FindUserExcuted(
                                                  id: "TuyoLCVuK1VTMIXwFHxWrniFRLn1"),
                                            );
                                          }),
                                    )
                                  ],
                                );
                              },
                            ),
                            BlocBuilder<SigninBloc, SigninState>(
                                builder: (context, state) {
                              if (state is SigninInProgress) {
                                return const SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: CircularProgressIndicator());
                              }
                              if (state is SigninError) {
                                return Text(state.data.message!);
                              }
                              if (state is SigninSuccess) {
                                return Text(
                                    jsonEncode(state.data.data!.toJson()));
                              }
                              return SizedBox(
                                height: 30,
                                child: ElevatedButton(
                                  child: const Text("signin"),
                                  onPressed: () {
                                    BlocProvider.of<SigninBloc>(context).add(
                                        SigninExcuted(
                                            credentials: AuthInput(
                                                password: "password",
                                                email:
                                                    "ebundala+107@gmail.com")));
                                  },
                                ),
                              );
                            }),
                            BlocBuilder<SignupBloc, SignupState>(
                                builder: (context, state) {
                              if (state is SignupInProgress) {
                                return const SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: CircularProgressIndicator());
                              }
                              if (state is SignupError) {
                                return Text(state.data.message!);
                              }
                              if (state is SignupSuccess) {
                                return Text(
                                    jsonEncode(state.data.data!.toJson()));
                              }
                              return SizedBox(
                                height: 30,
                                child: ElevatedButton(
                                  child: const Text("signup"),
                                  onPressed: () {
                                    BlocProvider.of<SignupBloc>(context).add(
                                        SignupExcuted(
                                            credentials: SignupInput(
                                                displayName: "Joseph Doe",
                                                password: "password",
                                                gender: Gender.MALE,
                                                phoneNumber: PhoneNumber(
                                                    "+255753040270"),
                                                email: EmailAddress(
                                                    "ebundala130@gmail.com"),
                                                avator: MultipartFile.fromBytes(
                                                    "",
                                                    "hello test cover"
                                                        .codeUnits),
                                                business:
                                                    BusinessCreateWithoutOwnerInput(
                                                        businessName:
                                                            "Joseph SHop",
                                                        about: "nice shop here",
                                                        mode: BusinessMode
                                                            .MOBILE$MODE,
                                                        cover:
                                                            AttachmentCreateNestedOneWithoutBusinessesInput(
                                                          create:
                                                              AttachmentCreateWithoutBusinessesInput(
                                                            path: MultipartFile
                                                                .fromBytes(
                                                                    "",
                                                                    "hello test cover"
                                                                        .codeUnits),
                                                          ),
                                                        ),
                                                        metadata: JSONObject(
                                                          {
                                                            "shop":
                                                                "good shop here"
                                                          },
                                                        )))));
                                  },
                                ),
                              );
                            })
                          ],
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
          ),
        );
      }),
    );
  }
}

@WidgetbookUseCase(name: "Main app", type: MyApp)
Widget mainApp(BuildContext context) {
  final client = GraphQLClient(
      link: HttpLink("http://localhost:3000/graphql"),
      cache: GraphQLCache(store: InMemoryStore()));
  return MyApp(client: client);
}
