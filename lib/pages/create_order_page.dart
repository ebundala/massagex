import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:massagex/pages/page_layout.dart';
import 'package:massagex/state/app/app_bloc.dart';
import 'package:massagex/widgets/components/buttons.dart';
import 'package:massagex/widgets/components/cards.dart';
import 'package:massagex/widgets/components/chips.dart';
import 'package:massagex/widgets/components/map_info_card.dart';
import 'package:massagex/widgets/components/text_inputs.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:models/business_mode.dart';
import 'package:models/location.dart';
import 'package:models/service.dart';
import 'package:place_picker/place_picker.dart';

class CreateOrderPage extends StatefulWidget {
  const CreateOrderPage({Key? key, required this.service}) : super(key: key);
  final Service service;
  @override
  State<CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  LocationResult? address;
  final notesCtr = TextEditingController();
  late BusinessMode mode;
  @override
  void initState() {
    mode = widget.service.business!.mode!;
    Location? loc;
    if (mode == BusinessMode.MOBILE$MODE) {
      // mobile use business address;
      loc = widget.service.business!.location!;
    } else {
      // office use user adddress

      loc = context.app.currentUser!.data!.location!;
    }

    if (loc.lat != null && loc.lon != null) {
      final latlng = LatLng(loc.lat!, loc.lon!);
      address = LocationResult()
        ..name = loc.name ?? ""
        ..formattedAddress = loc.name ?? ""
        ..latLng = latlng;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(
      height: 8,
    );
    return PageLayoutWidget(
      title: "Your service order",
      children: [
        space,
        PrimaryCard(
          color: Theme.of(context).backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileTile(
                  avator: "assets/images/intro_picture_2.png",
                  displayName: widget.service.business!.businessName!,
                  userSubTitle: "Massage specialist",
                  subTitleFontSize: 14,
                  titleFontSize: 18,
                  titleFontWeight: FontWeight.w600,
                  rating: 3.2,
                  bottom: const DistanceChip(label: Nunito(text: "5 km away")),
                ),
                space,
                Gilroy(
                    text: widget.service.name!,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(22, 10, 49, 1)),
                space,
                Nunito(
                  text: widget.service.description!,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(128, 128, 128, 1),
                ),
                space,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(IconlyLight.time_circle),
                    const SizedBox(
                      width: 8,
                    ),
                    Nunito(
                        text:
                            "${widget.service.metadata!.value["duration"]} minutes",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(22, 10, 49, 1))
                  ],
                ),
                // space,
              ],
            ),
          ),
        ),
        space,
        const Gilroy(
          text: "Venue Location",
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(22, 10, 49, 1),
        ),
        StatefulBuilder(builder: (context, setState) {
          return Row(
            children: [
              Icon(IconlyLight.location,
                  color: Theme.of(context).colorScheme.primary),
              Expanded(
                  child: Nunito(
                text: address?.formattedAddress ?? "",
                overflow: TextOverflow.ellipsis,
                color: const Color.fromRGBO(22, 10, 49, 1),
                fontSize: 16,
              )),
              if (mode == BusinessMode.MOBILE$MODE)
                TextsButton(
                  color: Theme.of(context).backgroundColor,
                  child: const Nunito(text: "Change"),
                  onPressed: () async {
                    final result =
                        await context.showPlacePicker(address?.latLng);
                    if (result != null) {
                      setState(
                        () {
                          address = result;
                        },
                      );
                    }
                  },
                )
            ],
          );
        }),
        space,
        const Gilroy(
          text: "Notes",
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(22, 10, 49, 1),
        ),
        space,
        SizedBox(
          height: 114,
          child: PrimaryTextInput(
            controller: notesCtr,
            maxLines: 4,
          ),
        ),
        space,
        const Spacer(),
        space,
        const Divider(),
        space,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Manrope(
                    text: "Total",
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  space,
                  Manrope(
                    text: "${widget.service.price}/=${widget.service.currency}",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                child: PrimaryButton(
              onPressed: () {},
              child: const Nunito(
                text: "Request now",
              ),
            ))
          ],
        )
      ],
    );
  }
}
