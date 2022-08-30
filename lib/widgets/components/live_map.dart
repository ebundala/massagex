import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:massagex/state/app/app_bloc.dart';
import 'package:massagex/widgets/components/map_info_card.dart';
import 'package:massagex/widgets/components/map_location_name_card.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:massagex/graphql/clients/find_route/find_route_bloc.dart';
import 'package:models/lat_lng_input.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart'
    show WidgetbookUseCase;
import 'package:widgetbook/widgetbook.dart' hide WidgetbookUseCase;

class PositionUpdateData {
  final LatLng position;
  final double? heading;
  PositionUpdateData({required this.position, this.heading});
}

class LiveMap extends StatefulWidget {
  final LiveMapData data;
  const LiveMap({Key? key, required this.data}) : super(key: key);

  @override
  State<LiveMap> createState() => _LiveMapState();
}

class _LiveMapState extends State<LiveMap> {
  final Completer<GoogleMapController> _mapControllerCompleter = Completer();
  GoogleMapController? mapController;
  late CameraPosition startingPosition;
  late FindRouteBloc routeBloc;
  final Set<Marker> markers = <Marker>{};
  PolylinePoints polylinePoints = PolylinePoints();
  bool showMapInfo = false;
  Polyline? route;
  // final Set<Polygon> polygons = <Polygon>{};
  final Set<Polyline> polylines = <Polyline>{};
  bool isFindingRoute = false;

  // final Set<Circle> circles = <Circle>{};
  // final Set<TileOverlay> tileOverlays = <TileOverlay>{};
  @override
  void didUpdateWidget(covariant LiveMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data.positionUpdateStream !=
        widget.data.positionUpdateStream) {
      oldWidget.data.positionUpdateStream.close();
      widget.data.positionUpdateStream.stream.listen(updateCurrentPosition);
    }
  }

  @override
  void initState() {
    super.initState();
    routeBloc = FindRouteBloc(client: context.client);
    startingPosition =
        CameraPosition(target: widget.data.startingPoint, zoom: 12);
    _mapControllerCompleter.future.then((value) async {
      mapController = value;
      const imageConfig = ImageConfiguration(
        size: Size(50, 50),
      );
      final startIcon = await BitmapDescriptor.fromAssetImage(
          imageConfig, "assets/images/starting_pos.png");
      final destnationIcon = await BitmapDescriptor.fromAssetImage(
          imageConfig, "assets/images/destination_pos.png");
      final positionIcon = await BitmapDescriptor.fromAssetImage(
          imageConfig, "assets/images/current_pos.png");

      setState(() {
        markers.addAll([
          Marker(
              markerId: const MarkerId("startingPoint"),
              position: widget.data.startingPoint,
              icon: startIcon),
          Marker(
              markerId: const MarkerId("destinationPoint"),
              position: widget.data.destinationPoint,
              icon: destnationIcon),
          Marker(
              markerId: const MarkerId("currentPosition"),
              position: widget.data.startingPoint,
              icon: positionIcon)
        ]);
        widget.data.positionUpdateStream.stream.listen(updateCurrentPosition);
      });

      // ignore: use_build_context_synchronously
      // final routes = await context.waitForBlocOperation<
      //         FindRouteBloc,
      //         FindRouteEvent,
      //         FindRouteState,
      //         FindRouteSuccess,
      //         FindRouteFailure,
      //         FindRouteError,
      //         FindRouteExcuted,
      //         FindRouteReseted>(
      //     bloc: routeBloc,
      //     excuted: FindRouteExcuted(
      //         origin: LatLngInput(
      //           lat: widget.data.startingPoint.latitude,
      //           lng: widget.data.startingPoint.longitude,
      //         ),
      //         destination: LatLngInput(
      //           lat: widget.data.destinationPoint.latitude,
      //           lng: widget.data.destinationPoint.longitude,
      //         )),
      //     reseted: FindRouteReseted(),
      //     callback: (v) => isFindingRoute = !isFindingRoute);
      // if (routes is FindRouteSuccess) {
      //   _handleRouteResult(routes);
      // }
    });
  }

  Marker getMarkerById(MarkerId id) {
    return markers.singleWhere((element) => element.markerId == id);
  }

  void updateCurrentPosition(PositionUpdateData event) {
    setState(() {
      const id = MarkerId("currentPosition");
      final marker1 = getMarkerById(id);
      var marker2 = marker1.copyWith(
        rotationParam: event.heading,
        positionParam: event.position,
      );
      markers.removeWhere((element) => element.markerId == id);
      markers.add(marker2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Gilroy(
          text: widget.data.mapTitle,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        )),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              showMapInfo = !showMapInfo;
            });
          },
          child: Icon(
            showMapInfo ? Icons.arrow_downward : Icons.arrow_upward,
            size: 32,
          ),
        ),
        body: BlocConsumer<FindRouteBloc, FindRouteState>(
          bloc: routeBloc
            ..add(FindRouteReseted())
            ..add(FindRouteExcuted(
                origin: LatLngInput(
                  lat: widget.data.startingPoint.latitude,
                  lng: widget.data.startingPoint.longitude,
                ),
                destination: LatLngInput(
                  lat: widget.data.destinationPoint.latitude,
                  lng: widget.data.destinationPoint.longitude,
                ))),
          listener: (context, state) {
            if (state is FindRouteSuccess) {
              _handleRouteResult(state);
            }
          },
          builder: (context, state) => SizedBox.expand(
              child: Stack(
            children: [
              //map goes here
              Positioned.fill(
                child: GoogleMap(
                  padding: const EdgeInsets.fromLTRB(
                      8, kTextTabBarHeight * 2 + 20, 8, 8),
                  myLocationEnabled: true, //?? widget.data.myLocationEnabled,
                  initialCameraPosition: startingPosition,
                  mapType: MapType.normal,
                  markers: markers,
                  // tileOverlays: tileOverlays,
                  polylines: polylines,
                  // polygons: polygons,
                  // onCameraIdle: () async {
                  //   // await getStartAndDestinationCordinates();
                  // },
                  onMapCreated: (ctr) => _mapControllerCompleter.complete(ctr),
                ),
              ),

              //Headers
              if (widget.data is TravellerMapData)
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: kToolbarHeight * 2,
                    child: Material(
                      color: Colors.white,
                      elevation: 8,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(24),
                            bottomRight: Radius.circular(24)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            //  Row(
                            //   children: [
                            //     Align(
                            //       alignment: Alignment.centerLeft,
                            //       child: BackButton(
                            //         onPressed: () =>
                            //             widget.data.onbackButton(context),
                            //       ),
                            //     ),
                            //     Align(
                            //       alignment: Alignment.center,
                            //       child: Gilroy(
                            //         text: widget.data.mapTitle,
                            //         fontSize: 21,
                            //         fontWeight: FontWeight.w600,
                            //       ),
                            //     )
                            //   ],
                            // ),
                            Expanded(
                              child: MapNavigationDestinationInfo(
                                startingPoint: (widget.data as TravellerMapData)
                                    .startingPointName,
                                startingPointSubtitle:
                                    (widget.data as TravellerMapData)
                                        .startingPointSubtitle,
                                destination: widget.data.destinationName,
                                destinationSubTitle:
                                    (widget.data as TravellerMapData)
                                        .destinationSubtitle,
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
            ],
          )),
        ),
        bottomSheet: showInfo());
  }

  Widget? showInfo() {
    if (!showMapInfo) return null;
    return widget.data is WaitingMapData
        ? SizedBox(
            height: 180,
            child: Material(
              color: Colors.white,
              elevation: 8,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24)),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4.0, 36, 4.0, 8),
                child: WaitingMapInfoCard(
                    avator: widget.data.avator,
                    displayName: widget.data.displayName,
                    rating: widget.data.rating,
                    onCall: () => widget.data.onCall(context),
                    eta: (widget.data as WaitingMapData).eta,
                    destination:
                        (widget.data as WaitingMapData).destinationName,
                    userSubTitle: widget.data.userSubTitle,
                    count: widget.data.count),
              ),
            ))
        : SizedBox(
            height: 320,
            child: Material(
              color: Colors.white,
              clipBehavior: Clip.antiAlias,
              elevation: 8,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24)),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4.0, 36, 4.0, 8),
                child: TravelerMapInfoCard(
                  avator: widget.data.avator,
                  displayName: widget.data.displayName,
                  rating: widget.data.rating,
                  currency: widget.data.currency,
                  onCall: () => widget.data.onCall(context),
                  eta: widget.data.eta,
                  userSubTitle: widget.data.userSubTitle,
                  count: widget.data.count,
                  discription:
                      (widget.data as TravellerMapData).serviceDescription,
                  price: (widget.data as TravellerMapData).servicePrice,
                  title: (widget.data as TravellerMapData).serviceName,
                  onArrival: () =>
                      (widget.data as TravellerMapData).onArrival(context),
                  onCancel: () =>
                      (widget.data as TravellerMapData).onCancel(context),
                  onPayment: (status) => (widget.data as TravellerMapData)
                      .onPayment(context, status),
                  isProvider: widget.data.isProvider,
                  isArrived: widget.data.isArrived,
                ),
              ),
            ));
  }

  void _handleRouteResult(FindRouteSuccess state) {
    if (state.data.data?.routes?.isNotEmpty == true) {
      if (mounted) {
        setState(() {
          final line = state.data.data!.routes!.first;
          final points = polylinePoints
              .decodePolyline(line.overview$polyline!.points!)
              .map<LatLng>((e) => LatLng(e.latitude, e.longitude))
              .toList();

          polylines.remove(route);
          route = Polyline(
              polylineId: const PolylineId("main-route"),
              points: points,
              width: 5,
              color: Theme.of(context).colorScheme.primary);
          polylines.add(route!);
        });
      }
    }
  }
}

abstract class LiveMapData {
  final bool isProvider;
  final String mapTitle;
  final String displayName;
  final String avator;
  final double rating;
  final String userSubTitle;
  final int? count;
  final void Function(BuildContext ctx) onCall;
  final LatLng startingPoint;
  final LatLng destinationPoint;
  final String eta;
  final String destinationName;
  final void Function(BuildContext ctx) onbackButton;

  final bool isArrived;

  StreamController<PositionUpdateData> positionUpdateStream;

  final bool myLocationEnabled;

  final String currency;

  LiveMapData(
      {required this.eta,
      required this.destinationName,
      required this.onbackButton,
      required this.isProvider,
      required this.mapTitle,
      required this.displayName,
      required this.avator,
      required this.rating,
      required this.userSubTitle,
      this.count,
      required this.onCall,
      required this.startingPoint,
      required this.destinationPoint,
      required this.isArrived,
      required this.currency,
      this.myLocationEnabled = false,
      required this.positionUpdateStream});
}

class TravellerMapData extends LiveMapData {
  final String serviceDescription;

  final String servicePrice;

  final String serviceName;

  void Function(BuildContext ctx) onArrival;

  void Function(BuildContext ctx) onCancel;

  void Function(BuildContext ctx, bool status) onPayment;

  final String startingPointName;
  final String startingPointSubtitle;
  final String destinationSubtitle;

  TravellerMapData({
    required super.onbackButton,
    required super.isProvider,
    required super.mapTitle,
    required super.displayName,
    required super.avator,
    required super.rating,
    required super.userSubTitle,
    super.count,
    required super.onCall,
    required super.destinationPoint,
    required super.startingPoint,
    required super.destinationName,
    required super.eta,
    required super.isArrived,
    required super.currency,
    super.myLocationEnabled,
    required super.positionUpdateStream,
    required this.onArrival,
    required this.onCancel,
    required this.onPayment,
    required this.serviceDescription,
    required this.serviceName,
    required this.servicePrice,
    required this.destinationSubtitle,
    required this.startingPointName,
    required this.startingPointSubtitle,
  });
}

class WaitingMapData extends LiveMapData {
  WaitingMapData({
    required super.onbackButton,
    required super.isProvider,
    required super.mapTitle,
    required super.displayName,
    required super.avator,
    required super.rating,
    required super.userSubTitle,
    super.count,
    required super.onCall,
    required super.destinationPoint,
    required super.startingPoint,
    required super.destinationName,
    required super.positionUpdateStream,
    required super.currency,
    super.myLocationEnabled = true,
    required super.eta,
    required super.isArrived,
  });
}

@WidgetbookUseCase(name: "primary", type: LiveMap)
Widget getTravellerLivemap(BuildContext context) {
  LiveMapData? data;
  bool isTraveller =
      context.knobs.boolean(label: " IS Traveller", initialValue: true);
  bool isProvider =
      context.knobs.boolean(label: " IS Provider", initialValue: false);
  bool isArrived =
      context.knobs.boolean(label: " IS Arrived", initialValue: false);

  final positionStream = StreamController<PositionUpdateData>()
    ..add(PositionUpdateData(position: const LatLng(44.6, 26.6), heading: 0));

  if (isTraveller) {
    data = TravellerMapData(
        onbackButton: (ctx) {},
        isProvider: isProvider,
        mapTitle: "Tracking masseur",
        displayName: "John doe",
        avator: "assets/images/intro_picture_2.png",
        rating: 3.3,
        userSubTitle: "Specialist",
        currency: 'tzs',
        count: 45674,
        onCall: (ctx) {},
        destinationPoint: const LatLng(44.5, 24.5),
        startingPoint: const LatLng(44.6, 26.6),
        eta: "15:24",
        destinationName: "102 Kimara mwisho",
        isArrived: isArrived,
        serviceDescription: "This is the description of the service here",
        serviceName: "Full body massage",
        servicePrice: "45 Tsh",
        startingPointName: "Temboni Uzunguni",
        startingPointSubtitle: "123 Htz house 12",
        destinationSubtitle: "123 htx house 45",
        positionUpdateStream: positionStream,
        onArrival: (ctx) {},
        onPayment: (ctx, status) {},
        onCancel: (ctx) {});
  } else {
    data = WaitingMapData(
        onbackButton: (ctx) {},
        isProvider: isProvider,
        mapTitle: "Tracking masseur",
        displayName: "John doe",
        avator: "assets/images/intro_picture_2.png",
        rating: 3.3,
        userSubTitle: "Specialist",
        currency: 'tzs',
        count: 45674,
        positionUpdateStream: positionStream,
        onCall: (ctx) {},
        destinationPoint: const LatLng(0.5, 0.5),
        startingPoint: const LatLng(0.6, 0.6),
        destinationName: "110 Kimara mwisho ",
        eta: "2hrs 15 minutes",
        isArrived: isArrived);
  }
  return Builder(builder: (context) {
    double latitude = context.knobs
        .slider(label: "latitude", initialValue: 44.6, max: 44.6, min: 44.5)
        .toDouble();
    double langitude = context.knobs
        .slider(label: "longitude", initialValue: 24.5, max: 26.5, min: 24.5)
        .toDouble();
    double heading = context.knobs
        .slider(label: "rotation", initialValue: 0, max: 360, min: 0)
        .toDouble();
    positionStream.add(PositionUpdateData(
        position: LatLng(latitude, langitude), heading: heading));
    return LiveMap(
      data: data!,
    );
  });
}
