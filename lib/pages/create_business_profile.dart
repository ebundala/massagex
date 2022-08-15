import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:massagex/graphql/clients/update_my_profile/update_my_profile_bloc.dart';
import 'package:massagex/pages/account_page_layout.dart';
import 'package:massagex/secrets/api_keys.dart';
import 'package:massagex/state/app/app_bloc.dart';
import 'package:massagex/state/routes/routes.dart';
import 'package:massagex/widgets/components/buttons.dart';
import 'package:massagex/widgets/components/text_inputs.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:models/business_create_without_owner_input.dart';
import 'package:models/business_mode.dart';
import 'package:models/location_create_nested_one_without_businesses_input.dart';
import 'package:models/location_create_without_businesses_input.dart';
import 'package:place_picker/place_picker.dart';

class CreateBusinessProfilePage extends StatefulWidget {
  const CreateBusinessProfilePage({Key? key}) : super(key: key);

  @override
  State<CreateBusinessProfilePage> createState() =>
      _CreateBusinessProfilePageState();
}

class _CreateBusinessProfilePageState extends State<CreateBusinessProfilePage> {
  final formKey = GlobalKey<FormState>();
  final double inputHeigt = 114;

  BusinessMode? _mode;

  TextEditingController nameCtr = TextEditingController();

  LocationResult? address;
  LatLng? displayLocation;
  final addressCtr = TextEditingController();
  final aboutCtr = TextEditingController();
  final items = BusinessMode.values
      .map(
        (e) => DropdownMenuItem<BusinessMode>(
          value: e,
          child: Gordita(
            text: e.toJson().replaceAll("_", " "),
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      )
      .toList();

  bool submited = false;
  @override
  void initState() {
    if (context.app.isBusiness) {
      final profile = context.app.currentUser!.data!.businessProfile!;
      nameCtr.text = profile.businessName!;
      aboutCtr.text = profile.about!;
      _mode = profile.mode!;

      if (profile.location?.lat != null && profile.location?.lon != null) {
        addressCtr.text = profile.location?.name ?? "";
        final latlng = LatLng(profile.location!.lat!, profile.location!.lon!);
        address = LocationResult()
          ..name = profile.location?.name ?? ""
          ..latLng = latlng;
        displayLocation = latlng;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AcountPageLayoutWidget(
      title: context.app.isBusiness
          ? "Update Business profile"
          : "Create Business profile",
      subTitle: "Kindly select your mode to specify your account",
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
              return ListBody(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: inputHeigt,
                    child: PrimaryTextInput(
                      controller: nameCtr,
                      keyboardType: TextInputType.name,
                      // enabled: !loading,
                      maxLines: 1,
                      label: const Nunito(text: "Business Name"),
                      validator: (v) {
                        if (v?.isEmpty == true) {
                          return "Business Name is required";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: inputHeigt,
                    child: DropdownInput<BusinessMode>(
                      items: items,
                      value: _mode,
                      alignment: AlignmentDirectional.centerStart,
                      label: const Nunito(
                        text: "Business Mode",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      onChanged: (v) {
                        setState(() {
                          _mode = v;
                        });
                      },
                      validator: (v) {
                        if (v == null) {
                          return "Business mode is required";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: inputHeigt,
                    child: PrimaryTextInput(
                      controller: aboutCtr,
                      keyboardType: TextInputType.name,
                      // enabled: !loading,
                      maxLines: 1,
                      maxLength: 150,
                      label: const Nunito(text: "Short description"),
                      validator: (v) {
                        if (v?.isEmpty == true) {
                          return "Short description is required";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  if (_mode != BusinessMode.MOBILE$MODE) ...[
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: inputHeigt,
                      child: LocationInput(
                        apiKey: apiKeyGMP,
                        inputController: addressCtr,
                        displayLocation: displayLocation,
                        onChanged: (v) {
                          setState(() {
                            address = v;
                          });
                        },
                        validator: (v) {
                          if (address == null) {
                            return "Address is required";
                          }
                          return null;
                        },
                        label: const Nunito(text: "Office Address"),
                      ),
                    ),
                  ],
                  const SizedBox(
                    height: 8,
                  ),
                  PrimaryButton(
                    width: double.infinity,
                    onPressed: loading
                        ? null
                        : () async {
                            if (formKey.currentState!.validate() == true) {
                              submited = true;
                              formKey.currentState!.save();
                              final profile = BusinessCreateWithoutOwnerInput(
                                about: aboutCtr.text,
                                businessName: nameCtr.text,
                                mode: _mode,
                                location: _mode == BusinessMode.MOBILE$MODE
                                    ? null
                                    : LocationCreateNestedOneWithoutBusinessesInput(
                                        create:
                                            LocationCreateWithoutBusinessesInput(
                                          name: addressCtr.text,
                                          lat: address!.latLng!.latitude,
                                          lon: address!.latLng!.longitude,
                                        ),
                                      ),
                              );
                              await context.app
                                  .saveBusinessProfileData(profile);
                              if (!context.app.isLogedIn) {
                                context.navigator.pushNamed(AppRoutes.login,
                                    arguments: true);
                              } else {
                                await context.app.upsertBusinessProfile(
                                    context.app.fauth.currentUser!.uid);
                              }
                              submited = false;
                            }
                          },
                    child: loading
                        ? SizedBox(
                            height: 32,
                            width: 32,
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          )
                        : Nunito(
                            text: context.app.isLogedIn ? "Save" : "Next",
                          ),
                  ),
                  if (state is UpdateMyProfileSuccess && submited) ...[
                    const SizedBox(
                      height: 8,
                    ),
                    const Nunito(
                      text: "Success",
                      fontSize: 18,
                      color: Colors.green,
                    ),
                  ],
                  if ((state is UpdateMyProfileError ||
                          state is UpdateMyProfileFailure) &&
                      submited) ...[
                    const SizedBox(
                      height: 8,
                    ),
                    Nunito(
                      text: state.message ?? state.data?.message ?? "Error",
                      fontSize: 18,
                      color: Colors.red,
                    ),
                  ],
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
