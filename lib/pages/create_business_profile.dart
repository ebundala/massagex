import 'package:flutter/material.dart';
import 'package:massagex/pages/account_page_layout.dart';
import 'package:massagex/secrets/api_keys.dart';
import 'package:massagex/widgets/components/buttons.dart';
import 'package:massagex/widgets/components/text_inputs.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:models/business_mode.dart';
import 'package:place_picker/entities/location_result.dart';

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

  final addressCtr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final items = BusinessMode.values
        .map(
          (e) => DropdownMenuItem<BusinessMode>(
            value: e,
            // onTap: () {

            // },
            child: Gordita(
              text: e.toJson().replaceAll("_", " "),
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
        .toList();
    return AcountPageLayoutWidget(
      title: "Create Business profile",
      subTitle: "Kindly select your mode to specify your account",
      children: [
        const SizedBox(
          height: 8,
        ),
        Form(
          key: formKey,
          child: ListBody(
            children: [
              SizedBox(
                height: inputHeigt,
                child: DropdownInput<BusinessMode>(
                  items: items,
                  value: _mode,
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
              if (_mode != BusinessMode.MOBILE$MODE) ...[
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: inputHeigt,
                  child: LocationInput(
                    apiKey: apiKeyGMP,
                    inputController: addressCtr,
                    onChanged: (v) {
                      setState(() {
                        address = v;
                      });
                    },
                    validator: (v) {
                      if (address == null) {
                        return "Address is required";
                      }
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
                onPressed: () {},
                child: const Nunito(
                  text: "Next",
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
