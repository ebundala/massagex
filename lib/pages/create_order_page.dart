import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:massagex/graphql/clients/create_order/create_order_bloc.dart';
import 'package:massagex/graphql/clients/update_order/update_order_bloc.dart';
import 'package:massagex/pages/page_layout.dart';
import 'package:massagex/state/app/app_bloc.dart';
import 'package:massagex/widgets/components/bottom_sheets.dart';
import 'package:massagex/widgets/components/buttons.dart';
import 'package:massagex/widgets/components/cards.dart';
import 'package:massagex/widgets/components/chips.dart';
import 'package:massagex/widgets/components/map_info_card.dart';
import 'package:massagex/widgets/components/text_inputs.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:models/business_mode.dart';
import 'package:models/location.dart';
import 'package:models/order.dart';
import 'package:models/order_create_without_owner_input.dart';
import 'package:models/scalars/json_object.dart';
import 'package:models/service.dart';
import 'package:models/service_create_nested_one_without_orders_input.dart';
import 'package:models/service_where_unique_input.dart';
import 'package:place_picker/place_picker.dart';
import 'package:models/notification.dart' as nt;
import 'package:models/notification_type.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CreateOrderPage extends StatefulWidget {
  const CreateOrderPage({Key? key, required this.service}) : super(key: key);

  final Service service;

  @override
  State<CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  LocationResult? address;
  final formKey = GlobalKey<FormState>();
  late BusinessMode mode;
  final notesCtr = TextEditingController();
  final quantityCtr = TextEditingController(text: "1");

  @override
  void dispose() {
    super.dispose();
  }

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

  List<bool> checkOrderStatus(Order order, AppState state) {
    final id = order.id;
    var error = false;
    var success = false;

    if (state is AppNewNotification) {
      if (state.notification.notificationType ==
          NotificationType.ORDER$ACCEPTED) {
        final orderId =
            Order.fromJson(state.notification.payload!.toJson()).id!;

        success = orderId == id;
      } else if (state.notification.notificationType ==
          NotificationType.ORDER$CANCELLED) {
        final orderId =
            Order.fromJson(state.notification.payload!.toJson()).id!;
        error = orderId == id;
      }
    }

    return [success, error];
  }

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(
      height: 8,
    );
    return PageLayoutWidget(
      title: "Place Your service order",
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
                  starSize: 18,
                  titleFontWeight: FontWeight.w600,
                  rating: widget.service.business!.owner!.compoundRating!,
                  bottom: DistanceChip(
                      label: Nunito(
                          text: widget.service.business!.distance!.display)),
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
                  child: FutureBuilder<String?>(
                      future: context.getLocationName(address),
                      builder: (context, snapshot) {
                        return Nunito(
                          text: snapshot.data ?? "",
                          overflow: TextOverflow.ellipsis,
                          color: const Color.fromRGBO(22, 10, 49, 1),
                          fontSize: 16,
                        );
                      })),
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
          text: "Quantity",
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(22, 10, 49, 1),
        ),
        space,
        Form(
          key: formKey,
          child: ListBody(children: [
            SizedBox(
              height: 92,
              child: PrimaryTextInput(
                controller: quantityCtr,
                keyboardType: const TextInputType.numberWithOptions(),
                maxLines: 1,
                validator: (v) {
                  if (v == null || v.isEmpty == true) {
                    return "Quantity is required";
                  }
                  if (int.tryParse(v) == null) {
                    return "Invalid quantity must be a number";
                  }
                  return null;
                },
              ),
            ),
            space,
            const Gilroy(
              text: "Notes",
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(22, 10, 49, 1),
            ),
            space,
            SizedBox(
              height: 115,
              child: PrimaryTextInput(
                controller: notesCtr,
                maxLines: 3,
              ),
            ),
          ]),
        ),
        space,
        space,
        space,
        const Divider(),
        space,
        SizedBox(
          height: 114,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Manrope(
                      text: "Total",
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    space,
                    ValueListenableBuilder<TextEditingValue>(
                        valueListenable: quantityCtr,
                        builder: (context, v, _) {
                          return Manrope(
                            text:
                                "${widget.service.price! * (int.tryParse(v.text) ?? 1)}/=${widget.service.currency}",
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.primary,
                          );
                        }),
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(child: Builder(builder: (context) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider<CreateOrderBloc>(
                      create: (context) =>
                          CreateOrderBloc(client: context.client),
                    ),
                    BlocProvider<UpdateOrderBloc>(
                      create: (context) =>
                          UpdateOrderBloc(client: context.client),
                    ),
                  ],
                  child: Builder(builder: (context) {
                    return BlocBuilder<CreateOrderBloc, CreateOrderState>(
                        builder: (context, state) {
                      final isLoading = state is CreateOrderInProgress;
                      final isErrored = state is CreateOrderError ||
                          state is CreateOrderFailure;

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PrimaryButton(
                            width: double.infinity,
                            onPressed: isLoading
                                ? null
                                : () async {
                                    if (formKey.currentState!.validate() ==
                                        true) {
                                      final notes = notesCtr.text;
                                      final quantity =
                                          int.parse(quantityCtr.text);
                                      final uid =
                                          context.app.fauth.currentUser!.uid;
                                      final location = Location(
                                          name: address?.formattedAddress,
                                          lat: address!.latLng!.latitude,
                                          lon: address!.latLng!.longitude);
                                      final metadata = JSONObject(
                                          {"venue": location.toJson()});

                                      final bloc =
                                          context.bloc<CreateOrderBloc>();
                                      final orders = [
                                        OrderCreateWithoutOwnerInput(
                                          quantity: quantity,
                                          notes: notes,
                                          metadata: metadata,
                                          service:
                                              ServiceCreateNestedOneWithoutOrdersInput(
                                            connect: ServiceWhereUniqueInput(
                                                id: widget.service.id!),
                                          ),
                                        )
                                      ];
                                      //bloc.emit(CreateOrderInProgress(data:UserResponse()));
                                      await context.requireRegisteredDevice(
                                          onSuccess: () async {
                                        final result =
                                            await context.waitForBlocOperation<
                                                CreateOrderBloc,
                                                CreateOrderEvent,
                                                CreateOrderState,
                                                CreateOrderSuccess,
                                                CreateOrderFailure,
                                                CreateOrderError,
                                                CreateOrderExcuted,
                                                CreateOrderReseted>(
                                          bloc: bloc,
                                          excuted: CreateOrderExcuted(
                                              uid: uid,
                                              count: orders.length,
                                              orders: orders),
                                          reseted: CreateOrderReseted(),
                                        );

                                        if (result is CreateOrderSuccess &&
                                            result.data.data?.ordered
                                                    ?.isNotEmpty ==
                                                true) {
                                          final order =
                                              result.data.data!.ordered!.first;
                                          // ignore: use_build_context_synchronously
                                          context.showCustomBottomSheet(
                                              backgroundColor: Colors.white,
                                              elevation: 8,
                                              builder: (ctx) {
                                                return BlocBuilder<AppBloc,
                                                        AppState>(
                                                    builder: (context, state) {
                                                  final status =
                                                      checkOrderStatus(
                                                          order, state);
                                                  return RequestBottomSheet(
                                                      success: status[0],
                                                      error: status[1],
                                                      waitingText:
                                                          "Please Hold on! We are requesting now",
                                                      waitingTextSubTitle:
                                                          "Apologies for your waiting",
                                                      waitingButtonText:
                                                          "REQUESTING...",
                                                      avator:
                                                          'assets/images/intro_picture_4.png',
                                                      displayName: widget.service
                                                          .business!.businessName!,
                                                      userSubTitle:
                                                          "Massage therapist",
                                                      count: 1000,
                                                      rating: 3.5,
                                                      badgeIcon1: const Icon(
                                                          IconlyLight
                                                              .shield_done,
                                                          color: Colors.green),
                                                      badgeIcon2: const Icon(
                                                          IconlyLight.star,
                                                          color: Colors.orange),
                                                      badgeIcon3: const Icon(
                                                          IconlyLight
                                                              .shield_fail,
                                                          color: Colors.red),
                                                      badgeText1:
                                                          "${order.business!.acceptance!}%",
                                                      badgeText2:
                                                          "${order.business!.owner!.compoundRating!}%",
                                                      badgeText3:
                                                          "${order.business!.cancelation!}%",
                                                      badgeSubText1:
                                                          "accaptance",
                                                      badgeSubText2: "rating",
                                                      badgeSubText3:
                                                          "cancelation",
                                                      successButtonText:
                                                          "CHECK SCHEDULE",
                                                      successText:
                                                          "Congratulations",
                                                      successTextSubTitle:
                                                          "Please Hold on! We are requesting now",
                                                      errorButtonText:
                                                          "Go back",
                                                      errorText: "Oh Snap!",
                                                      errorTextSubTitle:
                                                          "Please Hold on! We are requesting now",
                                                      onCall: (ctx) async {
                                                        if (status[0]) {
                                                          await launchUrlString(
                                                              "tel:${order.business!.owner!.phoneNumber}");
                                                        }
                                                      },
                                                      onCancel: (ctx) {
                                                        Navigator.of(ctx).pop();
                                                      },
                                                      onComplete:
                                                          (ctx, status) {
                                                        Navigator.of(ctx).pop();
                                                      });
                                                });
                                              });
                                        }
                                      }, onError: () {
                                        // Failed to register device here
                                      });
                                    }
                                  },
                            child: isLoading
                                ? SizedBox(
                                    height: 32,
                                    width: 32,
                                    child: CircularProgressIndicator(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  )
                                : const Nunito(
                                    text: "Place order",
                                  ),
                          ),
                          if (isErrored) ...[
                            space,
                            ErrorText(
                              exception: Exception(state.message ??
                                  state.data?.message ??
                                  "Error"),
                            ),
                            space,
                          ]
                        ],
                      );
                    });
                  }),
                );
              }))
            ],
          ),
        )
      ],
    );
  }
}
