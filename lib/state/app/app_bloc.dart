import 'dart:async';
import 'dart:convert';
import 'package:collection/collection.dart';
// import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql/client.dart';
import 'package:hive/hive.dart';
import 'package:massagex/graphql/clients/find_payment_methods/find_payment_methods_bloc.dart';
import 'package:massagex/graphql/clients/find_user/find_user_bloc.dart';
import 'package:massagex/graphql/clients/update_my_business_profile/update_my_business_profile_bloc.dart';
import 'package:massagex/graphql/clients/update_my_profile/update_my_profile_bloc.dart';
import 'package:massagex/state/app/fcm_background_handler.dart';
import 'package:massagex/state/deeplink/deeplink_bloc.dart';
import 'package:massagex/widgets/components/buttons.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:models/models.dart';
import 'package:models/notification.dart' as _;
import 'package:models/paybill_request.dart';
import 'package:models/payment_method.dart';
import 'package:models/register_device_input.dart';
import 'package:models/scalars/phone_number.dart';
import 'package:models/user_where_unique_input.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:massagex/state/geolocation/geolocation_bloc.dart';
import 'package:models/auth_result.dart';
import 'package:image_picker/image_picker.dart';
import 'package:massagex/utils.dart';
import 'package:models/lat_lon.dart';
import 'package:models/order.dart';
import 'package:massagex/graphql/clients/register_device/register_device_bloc.dart';
import 'package:massagex/graphql/clients/paybill/paybill_bloc.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:uuid/uuid.dart';
part 'app_event.dart';
part 'app_state.dart';

Future<_.Notification?> handleNotificationPayload(
    Box box, RemoteMessage message) async {
  if (message.data['payload'] != null) {
    // await box.delete(AppBloc.notificationsKey);
    var notifications =
        await box.get(AppBloc.notificationsKey, defaultValue: <dynamic>[])
            as List<dynamic>;
    final notification =
        jsonDecode(message.data["payload"]) as Map<dynamic, dynamic>;
    notifications.insertAll(0, [notification]);
    await box.put(AppBloc.notificationsKey, notifications);
    print('Handling message $notification');
    return _.Notification.fromJson(notification);
  }
  return null;
}

class AppBloc extends Bloc<AppEvent, AppState> {
  static const authkey = "app_token";
  static const providerkey = "isProvider";
  static const firstLaunchKey = "first_launch";
  static const deviceIdKey = "device_id_key";
  static const fcmIdKey = "fcm_id_key";
  static const idTokenKey = "idTokenKey";
  static const notificationsKey = "notifications_Key";
  static const dataKey = "app_data_key";
  static const settingsKey = "app_setting_key";
  static const travellingSalesmanKey = "travelling_salesman_key";

  Box<Map<dynamic, dynamic>?>? box;
  Box? settings;
  final String url;
  final int pageSize;
  GraphQLClient? client;

  /// plugins
  final picker = ImagePicker();
  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FirebaseAuth fauth = FirebaseAuth.instance;
  final AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// hive box streams
  StreamSubscription<BoxEvent>? authStream;
  StreamSubscription<BoxEvent>? providerModeSub;
  StreamSubscription<BoxEvent>? fcmIdStream;
  StreamSubscription<BoxEvent>? idTokenStream;
  StreamSubscription<BoxEvent>? notificationsStream;

  /// blocs
  GeolocationBloc? geolocationBloc;
  UpdateMyBusinessProfileBloc? updateMyBusinessProfileBloc;
  FindUserBloc? findUserBloc;
  UpdateMyProfileBloc? updateMyProfileBloc;
  RegisterDeviceBloc? registerDeviceBloc;
  DeeplinkBloc? deeplinkBloc;
  PaybillBloc? paybillBloc;

  //Geolocation blocs
  // LocationsBloc routingFeedBloc;
  // ReverseGeocodeBloc reverseGeocodeBloc;
  // GeocodeBloc geocodeBloc;
  // RouteBloc geoRoutingBloc;

  AppBloc({required this.box, required this.url, this.pageSize = 10})
      : super(const AppInitial(
            isProviderMode: false, isTravellingSalesman: false)) {
    bootstrap();
  }

  int get getPagesize => pageSize;

  // reportLinkException(
  //     Request, Stream<Response> Function(Request), LinkException) {}
  // reportGraphQlException() {}
  _initDeviceId() async {
    if (deviceId == null) {
      var uuid = const Uuid();
      await settings!.put(deviceIdKey, uuid.v4());
    }
  }

  bootstrap() async {
    box = await Hive.openBox(AppBloc.dataKey);
    settings = await Hive.openBox(AppBloc.settingsKey);
    // _notificationOpenedBroadcastStream =
    //     _notificationOpenedStream.stream.asBroadcastStream();
    _initDeviceId();
    final httplink = HttpLink(url);
    final tokenlink = AuthLink(getToken: () => token);
    final ws = serverUrl(
      isSubscription: true,
      path: "graphql",
    );

    final wsLink = WebSocketLink(ws,
        config: SocketClientConfig(
            inactivityTimeout: const Duration(minutes: 30),
            initialPayload: () => ({"authorization": token})));

    final link = Link.from([
      // common links run before every request
      DedupeLink(), // dedupe requests
      // ErrorLink(
      //    onException: reportLinkException,
      //     onGraphQLError: reportGraphQlException),
    ]).split(
      // split terminating links, or they will break
      (request) => request.isSubscription,
      wsLink,
      tokenlink.concat(httplink),
    );

    client = GraphQLClient(
      link: link,
      cache: GraphQLCache(
        dataIdFromObject: (data) {
          if (data["id"] != null && data["__typename"] != null) {
            return "${data["__typename"]}/${data["id"]}";
          }
          return data["__typename"] as String?;
        },
        store: HiveStore(box),
      ),
    );
    // init blocs
    registerDeviceBloc = RegisterDeviceBloc(client: client!);
    paybillBloc = PaybillBloc(client: client!);
    updateMyProfileBloc = UpdateMyProfileBloc(client: client!);
    findUserBloc = FindUserBloc(client: client!);
    geolocationBloc = GeolocationBloc();
    deeplinkBloc = DeeplinkBloc();
    updateMyBusinessProfileBloc = UpdateMyBusinessProfileBloc(client: client!);

    geolocationBloc!.stream.asBroadcastStream().listen((state) {
      if (state is GeolocationPermissionGranted) {
        if (state.enabled) {
          geolocationBloc!.add(GeolocationListenForLocationChanged());
        }
      }
      if (state is GeolocationPositionChanged && auth?.data?.id != null) {
        // updateMyProfileBloc.add(UpdateMyProfileResseted());
        updateMyProfileBloc!.add(
          UpdateMyProfileExcuted(
              id: auth!.data!.id!,
              location: LocationUpdateWithoutUsersInput(
                  lat: FloatFieldUpdateOperationsInput(
                      set$: state.position.latitude),
                  lon: FloatFieldUpdateOperationsInput(
                      set$: state.position.longitude)
                  // Todo add heading param on location data
                  //  heading: FloatFieldUpdateOperationsInput(set$: state.position.heading)
                  )),
        );
      }
    });

    if (auth?.data?.id != null) {
      findUserBloc!.add(
        FindUserExcuted(
          id: auth!.data!.id!,
        ),
      );
      registerDeviceBloc!.add(
        RegisterDeviceExcuted(
          device: RegisterDeviceInput(userId: auth!.data!.id!, id: deviceId!),
        ),
      );
    }
    authStream = settings!.watch(key: authkey).listen((event) {
      //todo link user and device here
      if (auth?.data?.id != null) {
        print("userid ${auth!.data!.id}");
        findUserBloc!.add(
          FindUserExcuted(id: auth!.data!.id!),
        );
        registerDeviceBloc!.add(
          RegisterDeviceExcuted(
            device: RegisterDeviceInput(userId: auth!.data!.id, id: deviceId!),
          ),
        );
      }
    });
    fcmIdStream = settings!.watch(key: fcmIdKey).listen((event) {
      if (event.value != null) {
        print("fcmid ${event.value}");
        registerDeviceBloc!.add(
          RegisterDeviceExcuted(
            device: RegisterDeviceInput(fcm$id: event.value, id: deviceId!),
          ),
        );
      }
    });

    idTokenStream = settings!.watch(key: idTokenKey).listen((event) {
      if (event.value != null) {
        //todo fetch current user here
        print("idToken ${event.value}");
      }
    });

    notificationsStream =
        settings!.watch(key: notificationsKey).listen((event) {
      // if (event.value != null) {
      //  print(event.value);
      add(const AppResseted());
      add(AppNotified());
      //  }
    });
    providerModeSub = settings!.watch(key: providerkey).listen((event) {
      //disable traveling salesman if provider mode disabled
      if (event.value == false) {
        settings!.put(travellingSalesmanKey, false);
      }
    });
    await Firebase.initializeApp();

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((message) async {
      final notification = await handleNotificationPayload(settings!, message);
      final data = parseNotification(notification!);
      var body = "";
      if (data is Order) {
        body = data.service!.name!;
      }
      if (data is Review) {
        body = data.author!.displayName!;
      }

      showNotification(
          notification.hashCode,
          notification!.notificationType!.toJson().replaceAll(RegExp("_"), " "),
          body,
          payload: message.data["payload"]);
    });

    messaging.onTokenRefresh.listen((key) {
      settings!.put(fcmIdKey, key);
    });

    fauth.idTokenChanges().listen((user) async {
      final token = await fauth.currentUser?.getIdToken();
      settings!.put(idTokenKey, token);
    });
    //get initial tokens
    await settings!.put(fcmIdKey, await messaging.getToken());
    await settings!.put(idTokenKey, await fauth.currentUser?.getIdToken());

    flutterLocalNotificationsPlugin.initialize(
        const InitializationSettings(
          android: AndroidInitializationSettings(
            "logo",
          ),
        ), onSelectNotification: (payload) async {
      final data = jsonDecode(payload ?? '{}');
      final d = _.Notification.fromJson(data);
      await removeSeenNotification(d);
    });
    if (!kIsWeb) {
      /// Create an Android Notification Channel.
      ///
      /// We use this channel in the `AndroidManifest.xml` file to override the
      /// default FCM channel to enable heads up notifications.
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      /// Update the iOS foreground notification presentation options to allow
      /// heads up notifications.
      // await FirebaseMessaging.instance
      //     .setForegroundNotificationPresentationOptions(
      //   alert: true,
      //   badge: true,
      //   sound: true,
      // );
    }

    await Future.delayed(const Duration(seconds: 2), () {
      add(const AppStart());
    });

    //handle app opened by notifications
    final details =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    if (details?.didNotificationLaunchApp ?? false) {
      try {
        final data =
            _.Notification.fromJson(jsonDecode(details!.payload ?? '{}'));
        deeplinkBloc!
          ..add(const DeeplinkResetted())
          ..add(DeeplinkExcuted(data: data));
      } catch (e) {
        print(e);
      }
    }

    geolocationBloc!.add(GeolocationStart());
  }

  showNotification(int id, String title, String body, {String? payload}) {
    flutterLocalNotificationsPlugin.show(
        id,
        title,
        body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            // TODO add a proper drawable resource to android, for now using
            //      one that already exists in example app.
            //  icon: 'launch_background',
          ),
        ),
        payload: payload);
  }

  AuthResult? getAuthFromJson(Map<dynamic, dynamic>? json) {
    try {
      if (json != null) {
        return AuthResult.fromJson(json);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> close() async {
    await authStream!.cancel();
    await registerDeviceBloc!.close();
    await idTokenStream!.cancel();
    await fcmIdStream!.cancel();
    await notificationsStream!.cancel();
    await paybillBloc!.close();
    await updateMyBusinessProfileBloc!.close();
    await updateMyProfileBloc!.close();
    await findUserBloc!.close();
    await geolocationBloc!.close();
    await deeplinkBloc!.close();
    await authStream!.cancel();
    await providerModeSub!.cancel();
    await fcmIdStream!.cancel();
    await idTokenStream!.cancel();
    await notificationsStream!.cancel();

    return super.close();
  }

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    yield* init(event);
  }

  String? get token {
    return auth?.token != null ? "Bearer ${auth?.token}" : null;
  }

  AuthResult? get auth {
    return getAuthFromJson(settings!.get(
      authkey,
    ));
  }

  bool get firstLauch {
    return settings!.get(firstLaunchKey, defaultValue: true);
  }

  String? get deviceId {
    return settings!.get(deviceIdKey);
  }

  bool get isProviderEnabled {
    return settings!.get(providerkey, defaultValue: false);
  }

  bool get isTravellingSalesman {
    return settings!.get(travellingSalesmanKey, defaultValue: false);
  }

  Iterable<_.Notification> get notifications {
    final data =
        settings!.get(notificationsKey, defaultValue: <Map<dynamic, dynamic>>[])
            as List<dynamic>;
    return Iterable.generate(data.length, (i) {
      return _.Notification.fromJson(data[i]);
    });
  }

  Stream<AppState> init(AppEvent event) async* {
    if (event is AppStart) {
      //registerLocationListener();
    }

    if (firstLauch) {
      await settings!.put(firstLaunchKey, false);
      yield AppFirstStarted(
          isProviderMode: isProviderEnabled,
          isTravellingSalesman: isTravellingSalesman);
    } else if (event is AppAuth) {
      await settings!.put(authkey, event.auth.toJson());
      yield AppAuthenticated(
          isProviderMode: isProviderEnabled,
          isTravellingSalesman: isTravellingSalesman);
    } else if (event is AppLogout) {
      await box?.clear();
      await settings!.clear();
      yield AppLoggedOut(
          isProviderMode: isProviderEnabled,
          isTravellingSalesman: isTravellingSalesman);
    } else if (event is AppResseted) {
      yield AppStateReset(
          isProviderMode: isProviderEnabled,
          isTravellingSalesman: isTravellingSalesman);
    } else if (event is AppModeChaged) {
      if (event.isProviderMode != null) {
        await settings!.put(providerkey, event.isProviderMode);
      }
      if (event.isTravellingSalesman != null) {
        await settings!.put(travellingSalesmanKey, event.isTravellingSalesman);
      }
      yield AppModeChage(
          isProviderMode: isProviderEnabled,
          isTravellingSalesman: isTravellingSalesman);
    } else if (event is AppNotified) {
      yield AppNewNotification(
          isProviderMode: isProviderEnabled,
          isTravellingSalesman: isTravellingSalesman);
    } else if (token?.isNotEmpty == true) {
      yield AppAuthenticated(
          isProviderMode: isProviderEnabled,
          isTravellingSalesman: isTravellingSalesman);
    } else {
      await box?.clear();
      await settings!.clear();
      yield AppLoggedOut(
          isProviderMode: isProviderEnabled,
          isTravellingSalesman: isTravellingSalesman);
    }
  }

  Future<XFile?> pickImage({ImageSource source = ImageSource.camera}) {
    return picker.pickImage(source: source);
  }

  Future<XFile?> pickVideo({ImageSource source = ImageSource.gallery}) {
    return picker.pickVideo(source: source);
  }

  Future<_.Notification> removeSeenNotification(
      _.Notification notification) async {
    var oldData = settings!.get(notificationsKey, defaultValue: []) as List;
    var trancated = oldData
        .where((element) => !const DeepCollectionEquality()
            .equals(element, notification.toJson()))
        .toList();
    await settings!.put(notificationsKey, trancated);
    deeplinkBloc!
      ..add(const DeeplinkResetted())
      ..add(DeeplinkExcuted(data: notification));
    return notification;
  }

  paybill(
      {required BuildContext context,
      required PaymentMethod method,
      required Order order}) async {
    final phoneController = TextEditingController();
    paybillBloc!.add(PaybillStarted());
    return showGeneralDialog(
        context: context,
        pageBuilder: (ctx, a, a1) {
          final total = order.quantity! * order.service!.price!;
          return BlocBuilder<PaybillBloc, PaybillState>(
            bloc: paybillBloc,
            builder: (context, state) {
              return AlertDialog(
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                title: const Center(child: Text("Checkout")),
                content: SizedBox(
                  height: 200,
                  child: Column(
                    children: [
                      ListTile(
                        dense: true,
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                            serverUrl(
                                path: order.service?.image?.path,
                                thumbnail: ImageSize.smallest),
                          ),
                        ),
                        title: Text(order.service!.name!),
                        subtitle: Text("x${order.quantity} = $total/=Tsh"),
                      ),
                      ListTile(
                        dense: true,
                        trailing: CircleAvatar(
                          radius: 12,
                          backgroundImage: NetworkImage(
                            serverUrl(path: method.logo?.path),
                          ),
                        ),
                        title: Text(
                          "${method.name}",
                          textAlign: TextAlign.end,
                        ),
                      ),
                      if (state is PaybillInProgress)
                        const Center(
                          child: SizedBox(
                            height: 32,
                            width: 32,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      if (state is PaybillFailure)
                        Center(
                          child: Text("${state.data.message}"),
                        ),
                      if (state is! PaybillInProgress)
                        Row(
                          children: [
                            Flexible(
                                flex: 1,
                                child: TextField(
                                  controller:
                                      TextEditingController(text: "+255"),
                                  enabled: false,
                                )),
                            const SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: phoneController,
                              ),
                            )
                          ],
                        )
                    ],
                  ),
                ),
                actions: [
                  SecondaryButton(
                    child: const Nunito(text: 'Cancel'),
                    onPressed: () {
                      context.navigator.pop();
                    },
                  ),
                  PrimaryButton(
                    child: const Nunito(text: "Checkout"),
                    onPressed: () {
                      final phone = phoneController.text;

                      paybillBloc!.add(
                        PaybillExcuted(
                          data: PaybillRequest(
                            currency: "TZN",
                            orderId: order.id!,
                            method: method.id,
                            msisdn: PhoneNumber("255$phone"),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          );
        });
  }
}

extension DisplayDate on DateTime {
  String get display {
    final local = toLocal();
    return "${local.day}/${local.month}/${local.year}";
  }

  static DateTime? fromDisplay(String str) {
    try {
      final parts = str.split(RegExp("/")).map(int.tryParse).toList();
      return DateTime(parts[2]!, parts[1]!, parts[0]!);
    } catch (e) {
      return null;
    }
  }
}

extension ClientContext on BuildContext {
  // ignore: unused_element
  GraphQLClient get client {
    return BlocProvider.of<AppBloc>(this).client!;
  }

  ThemeData get theme {
    return Theme.of(this);
  }

  MediaQueryData get media {
    return MediaQuery.of(this);
  }

  NavigatorState get navigator {
    return Navigator.of(this);
  }

  T bloc<T extends BlocBase>() {
    return BlocProvider.of<T>(this);
  }

  void pop<T extends Object?>([T? result]) {
    navigator.pop(result);
  }

  AppBloc get app {
    return BlocProvider.of<AppBloc>(this);
  }

  Future<T?> showDialog<T>(
      {String? message,
      Widget? content,
      void Function()? onPressed,
      void Function()? onCancel,
      String okText = "OK",
      String cancelText = "CANCEL",
      String title = "Alert"}) {
    return showGeneralDialog<T?>(
        context: this,
        pageBuilder: (ctx, anim, anim1) {
          return AlertDialog(
            title: Text(title),
            content: content ?? Text(message ?? ''),
            actions: [
              if (onCancel != null)
                TextButton(onPressed: onCancel, child: Text(cancelText)),
              if (onPressed != null)
                TextButton(onPressed: onPressed, child: Text(okText))
            ],
          );
        });
  }

  Future<T?> showModelBottomSheetList<T>(BuildContext context,
      {required String title,
      required List<T> items,
      required Widget Function(BuildContext context, T item, int i) itemBuilder,
      BoxConstraints constraints = const BoxConstraints.expand(height: 400),
      double? elevation}) {
    return showModalBottomSheet<T?>(
        context: context,
        isScrollControlled: true,
        constraints: constraints,
        elevation: elevation,
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
        builder: (context) {
          return Scaffold(
            body: SizedBox.expand(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        color: Color(0xff2e1f46),
                        letterSpacing: -0.28800000000000003,
                        fontWeight: FontWeight.w700,
                        height: 2,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, i) {
                          final item = items[i];
                          return itemBuilder(context, item, i);
                        },
                        itemCount: items.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<PaymentMethod?> showPaymentModelBottomSheetList(BuildContext context,
      {required String title,
      BoxConstraints constraints = const BoxConstraints.expand(height: 400),
      double? elevation}) {
    return showModalBottomSheet<PaymentMethod>(
        context: context,
        isScrollControlled: true,
        constraints: constraints,
        elevation: elevation,
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
        builder: (context) {
          return Scaffold(
            body: SizedBox.expand(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: BlocConsumer<FindPaymentMethodsBloc,
                    FindPaymentMethodsState>(
                  listener: (context, state) {
                    if (state is FindPaymentMethodsFailure ||
                        state is FindPaymentMethodsError) {
                      showDialog(
                          message: state.message,
                          onPressed: () {
                            pop();
                          });
                    }
                  },
                  builder: (context, state) {
                    if (state is FindPaymentMethodsInProgress) {
                      return const Center(
                          child: SizedBox(
                        height: 32,
                        width: 32,
                        child: CircularProgressIndicator(),
                      ));
                    } else if (state.data?.data?.isNotEmpty == true) {
                      return Column(
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                              color: Color(0xff2e1f46),
                              letterSpacing: -0.28800000000000003,
                              fontWeight: FontWeight.w700,
                              height: 2,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemBuilder: (context, i) {
                                final item = state.data!.data![i];
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      serverUrl(path: item.logo?.path),
                                    ),
                                  ),
                                  title: Text(item.name!),
                                  onTap: () {
                                    pop<PaymentMethod>(item);
                                  },
                                );
                              },
                              itemCount: state.data!.data!.length,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
          );
        });
  }

  void geolocationListener(GeolocationState state) {
    final b = app.geolocationBloc!;
    print(state);
    if (state is GeolocationPermissionGranted) {
      if (!state.enabled) {
        showDialog(
            title: "Turn on Location",
            message:
                "Please turn on location service for find nearby services to work properly",
            onCancel: () {
              pop();
            },
            onPressed: () {
              b.add(GeolocationOpenLocationSettings());
              pop();
            });
      } else {
        //TODO enable location when ready
        //   b.add(GeolocationListenForLocationChanged());
      }
    } else if (state is GeolocationPermissionDenied) {
      showDialog(
          title: "Location Permission",
          message:
              "Please allow location permission for 'find nearby services' to work properly",
          onCancel: () {
            pop();
          },
          onPressed: () {
            b.add(GeolocationRequestPermission());
            pop();
          });
    } else if (state is GeolocationPermissionDeniedForever) {
      showDialog(
          title: "Location Settings",
          message:
              "Please allow location permission for 'find nearby services' to work properly",
          onCancel: () {
            pop();
          },
          onPressed: () {
            b.add(GeolocationOpenAppSettings());
            pop();
          });
    } else if (state is GeolocationPositionChanged) {
      // location.add(LocationFeedReseted());
      // location.add(
      //   LocationFeedExcuted(
      //     location: LatLon(
      //         lat: state.position.latitude, lon: state.position.longitude),
      //   ),
      // );
    }
  }
}

extension Distance on double {
  String get kilometers {
    return (this / 1000).toStringAsFixed(2);
  }

  String get meters {
    return toStringAsFixed(2);
  }

  String get display {
    if (this >= 1000) {
      return "$kilometers km";
    } else {
      return "$meters m";
    }
  }
}

extension Lastseen on DateTime {
  String get seen {
    if (status) {
      return 'online';
    }
    final diff = DateTime.now().millisecondsSinceEpoch - millisecondsSinceEpoch;
    final diff2 = DateTime.now().subtract(Duration(milliseconds: diff));
    return timeago.format(
      diff2,
    );
  }

  bool get status {
    final diff = DateTime.now().millisecondsSinceEpoch - millisecondsSinceEpoch;
    if (diff < 1000 * 60 * 2) {
      return true;
    }
    return false;
  }
}
