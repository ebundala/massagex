import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:massagex/graphql/clients/location_feed/location_feed_bloc.dart';
import 'package:massagex/state/app/app_bloc.dart';
import 'package:massagex/widgets/components/live_map.dart';
import 'package:models/business_mode.dart';
import 'package:models/location.dart';

import 'package:models/order.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({Key? key, required this.order}) : super(key: key);
  final Order order;

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  late LocationFeedBloc locationFeedBloc;
  late LiveMapData mapData;
  bool isTraveller = false;
  bool isProvider = false;
  late LatLng startingPoint;
  late LatLng destinationPoint;
  @override
  void initState() {
    locationFeedBloc = LocationFeedBloc(client: context.client);

    if (widget.order.owner!.id != context.app.fauth.currentUser!.uid) {
      isProvider = true;
    }
    if (isProvider) {
      if (widget.order.business!.mode == BusinessMode.MOBILE$MODE) {
        isTraveller = true;
      }
    } else if (widget.order.business!.mode == BusinessMode.OFFICE$MODE) {
      isTraveller = true;
    }
    Location start;
    Location end;
    if (isTraveller && isProvider) {
      // provider traveller
      start = context.app.currentUser!.data!.location!;
      end = Location.fromJson(widget.order.metadata?.value["venue"] ??
          widget.order.owner!.location!.toJson());
    } else if (isTraveller && !isProvider) {
      // user traveller
      start = context.app.currentUser!.data!.location!;
      end = widget.order.business!.location!;
    } else if (!isTraveller && isProvider) {
      // provider waiting
      start = widget.order.owner!.location!;
      end = widget.order.business!.location!;
    } else {
      //user waiting
      start = widget.order.business!.location!;
      end = widget.order.owner!.location!;
    }
    startingPoint = LatLng(start.lat!, start.lon!);
    destinationPoint = LatLng(end.lat!, end.lon!);

    final stream = locationFeedBloc.stream
        .asBroadcastStream()
        .where((event) => event is LocationFeedSuccess)
        .map<PositionUpdateData>((e) => PositionUpdateData(
            position: LatLng(e.data!.data!.lat!, e.data!.data!.lon!),
            heading: e.data?.data?.heading));
    final positionStream = StreamController<PositionUpdateData>()
      ..addStream(stream);
// TODO use appropriate display name and picture
    if (isTraveller) {
      mapData = TravellerMapData(
          onbackButton: (ctx) {},
          isProvider: isProvider,
          mapTitle:
              "${isProvider ? "Customer" : "specialist"} is waiting for you ",
          displayName: context.app.fauth.currentUser!.displayName!,
          avator: "assets/images/intro_picture_1.png",
          rating: 3.3,
          userSubTitle: "Massage specialist",
          count: 100,
          onCall: (ctx) {},
          destinationPoint: destinationPoint,
          startingPoint: startingPoint,
          destinationName: end.name!,
          eta: "eta",
          isArrived: false,
          positionUpdateStream: positionStream,
          onArrival: (ctx) {},
          onCancel: (ctx) {},
          onPayment: (ctx, state) {},
          serviceDescription: widget.order.service!.description!,
          serviceName: widget.order.service!.name!,
          servicePrice: widget.order.service!.price!.toStringAsFixed(2),
          destinationSubtitle: "destinationSubtitle",
          startingPointName: start.name!,
          startingPointSubtitle: "startingPointSubtitle");
    } else {
      mapData = WaitingMapData(
        onbackButton: ((ctx) {}),
        mapTitle:
            "${isProvider ? "Customer" : "specialist"} is on the way Please wait for ",
        isProvider: isProvider,
        displayName: context.app.fauth.currentUser!.displayName!,
        avator: "assets/images/intro_picture_1.png",
        rating: 3.3,
        userSubTitle: "Massage specialist",
        count: 100,
        onCall: (ctx) {},
        destinationPoint: destinationPoint,
        startingPoint: startingPoint,
        destinationName: end.name!,
        eta: "eta",
        isArrived: false,
        positionUpdateStream: positionStream,
      );
    }
    locationFeedBloc
      ..add(LocationFeedReseted())
      ..add(LocationFeedExcuted(orderId: widget.order.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LiveMap(data: mapData);
  }
}
