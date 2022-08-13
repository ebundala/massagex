import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfire_ui/auth.dart' hide PhoneInput;
import 'package:massagex/graphql/clients/update_my_profile/update_my_profile_bloc.dart';
import "package:massagex/pages/account_page_layout.dart";
import 'package:massagex/state/app/app_bloc.dart';
import 'package:massagex/state/routes/routes.dart';
import 'package:massagex/widgets/components/buttons.dart';
import 'package:massagex/widgets/components/text_inputs.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:models/enum_gender_field_update_operations_input.dart';
import 'package:models/gender.dart';
import 'package:models/nullable_date_time_field_update_operations_input.dart';
import 'package:models/nullable_string_field_update_operations_input.dart';

class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage({Key? key}) : super(key: key);

  @override
  _CompleteProfilePageState createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  final formKey = GlobalKey<FormState>();
  final double inputHeigt = 114;

  final displayNameCtr = TextEditingController();
  final phoneCtr = TextEditingController();
  Gender? gender;
  final genderItems = Gender.values
      .map(
        (e) => DropdownMenuItem<Gender>(
          value: e,
          child: Gordita(
            text: e.toJson().replaceAll("_", " "),
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      )
      .toList();
  final DateTime firstDate = DateTime(
      DateTime.now().year - 100, DateTime.now().month, DateTime.now().day);
  final DateTime lastDate = DateTime(
      DateTime.now().year - 13, DateTime.now().month, DateTime.now().day);
  final DateTime initialDate = DateTime(
      DateTime.now().year - 13, DateTime.now().month, DateTime.now().day);
  DateTime? dateOfBirth;

  bool submited = false;
  @override
  void initState() {
    super.initState();
    final data = context.app.currentUser?.data;
    if (data != null) {
      dateOfBirth = data.dateOfBirth;
      displayNameCtr.text = data.displayName ?? "";
      gender = data.gender;
      phoneCtr.text =
          data.phoneNumber ?? context.app.fauth.currentUser?.phoneNumber ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return AcountPageLayoutWidget(
      title: "Update profile",
      subTitle: "Kindly share your details to complete your profile",
      children: [
        const SizedBox(
          height: 8,
        ),
        Form(
          key: formKey,
          child: BlocBuilder<UpdateMyProfileBloc, UpdateMyProfileState>(
              bloc: context.app.updateMyProfileBloc,
              builder: (context, state) {
                final loading = state is UpdateMyProfileInProgress && submited;
                final success = state is UpdateMyProfileSuccess && submited;
                final errored = (state is UpdateMyProfileErrored ||
                        state is UpdateMyProfileFailure) &&
                    submited;
                return ListBody(
                  children: [
                    SizedBox(
                      height: inputHeigt,
                      child: PrimaryTextInput(
                        controller: displayNameCtr,
                        keyboardType: TextInputType.emailAddress,
                        enabled: !loading,
                        maxLines: 1,
                        validator: (v) {
                          if (v == null) {
                            return "Display name is required";
                          }
                          return null;
                        },
                        label: const Nunito(text: "Display name"),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: inputHeigt + 7,
                      child: DropdownInput<Gender>(
                        items: genderItems,
                        onChanged: (v) {
                          setState(() {
                            gender = v;
                          });
                        },
                        validator: (v) {
                          if (v == null) {
                            return "Gender is required";
                          }
                          return null;
                        },
                        label: const Nunito(
                          text: "Gender",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: inputHeigt,
                      child: DatePickerInput(
                        firstDate: firstDate,
                        initialDate: initialDate,
                        lastDate: lastDate,
                        selectedDate: dateOfBirth,
                        onChanged: (v) {
                          setState(() {
                            dateOfBirth = v;
                          });
                        },
                        label: const Nunito(
                          text: "Date of birth",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: inputHeigt + 20,
                      child: GestureDetector(
                        onTap: () async {
                          var phoneNumber =
                              context.app.fauth.currentUser?.phoneNumber;
                          if (phoneNumber == null) {
                            await context.navigator
                                .pushNamed(AppRoutes.verifyPhoneOTP);
                          }
                          phoneNumber =
                              context.app.fauth.currentUser?.phoneNumber;
                          if (phoneNumber != null) {
                            phoneCtr.text = phoneNumber;
                          }
                        },
                        child: AbsorbPointer(
                          child: PrimaryTextInput(
                            controller: phoneCtr,
                            keyboardType: TextInputType.phone,
                            enabled: !loading,
                            maxLines: 1,
                            validator: (v) {
                              if (v == null) {
                                return "Phone number is required";
                              }
                              return null;
                            },
                            label: const Nunito(
                              text: "Phone Number",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (success) ...[
                      Nunito(
                        text: state.data.message!,
                        color: Colors.green,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                    if (errored) ...[
                      Nunito(
                        text: state.message ?? state.data?.message ?? "",
                        color: Colors.red,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                    const SizedBox(
                      height: 8,
                    ),
                    PrimaryButton(
                      onPressed: !loading
                          ? () {
                              if (formKey.currentState?.validate() == true) {
                                final displayName = displayNameCtr.text;
                                final phoneNUmber = phoneCtr.text;
                                final uid = context.app.fauth.currentUser!.uid;
                                //TODO handle avator upload
                                setState(() {
                                  submited = true;
                                });
                                context.app.updateMyProfileBloc!
                                  ..add(UpdateMyProfileReseted())
                                  ..add(
                                    UpdateMyProfileExcuted(
                                        id: uid,
                                        dateOfBirth:
                                            NullableDateTimeFieldUpdateOperationsInput(
                                                set$: dateOfBirth?.toUtc()),
                                        displayName:
                                            NullableStringFieldUpdateOperationsInput(
                                                set$: displayName),
                                        gender:
                                            EnumGenderFieldUpdateOperationsInput(
                                                set$: gender),
                                        phoneNumber:
                                            NullableStringFieldUpdateOperationsInput(
                                                set$: phoneNUmber)),
                                  );
                              }
                            }
                          : null,
                      child: !loading
                          ? const Nunito(
                              text: "Submit",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )
                          : SizedBox(
                              height: 32,
                              width: 32,
                              child: CircularProgressIndicator(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                    ),
                  ],
                );
              }),
        )
      ],
    );
  }
}
