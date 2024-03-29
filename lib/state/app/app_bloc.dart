import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql/client.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:massagex/graphql/clients/find_payment_methods/find_payment_methods_bloc.dart';
import 'package:massagex/graphql/clients/find_user/find_user_bloc.dart';
import 'package:massagex/graphql/clients/update_my_business_order/update_my_business_order_bloc.dart';
import 'package:massagex/graphql/clients/update_my_business_profile/update_my_business_profile_bloc.dart';
import 'package:massagex/graphql/clients/update_my_profile/update_my_profile_bloc.dart';
import 'package:massagex/secrets/api_keys.dart';
import 'package:massagex/state/app/fcm_background_handler.dart';
import 'package:massagex/state/deeplink/deeplink_bloc.dart';
import 'package:massagex/state/routes/routes.dart';
import 'package:massagex/widgets/components/bottom_sheets.dart';
import 'package:massagex/widgets/components/buttons.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:models/business_create_without_owner_input.dart';
import 'package:models/business_update_without_owner_input.dart';
import 'package:models/business_upsert_without_owner_input.dart';
import 'package:models/enum_business_mode_field_update_operations_input.dart';
import 'package:models/enum_order_status_field_update_operations_input.dart';
import 'package:models/float_field_update_operations_input.dart';
import 'package:models/gender.dart';
import 'package:models/image_size.dart';
import 'package:models/location_create_without_businesses_input.dart';
import 'package:models/location_create_without_users_input.dart';
import 'package:models/location_update_one_without_businesses_input.dart';
import 'package:models/location_update_without_users_input.dart';
import 'package:models/location_upsert_without_users_input.dart';
import 'package:models/order_status.dart';
import 'package:models/order_update_with_where_unique_without_business_input.dart';
import 'package:models/order_update_without_business_input.dart';
import 'package:models/order_where_unique_input.dart';
import 'package:models/string_field_update_operations_input.dart';
import 'package:models/user_response.dart';
import 'package:models/notification.dart' as nt;
import 'package:models/paybill_request.dart';
import 'package:models/payment_method.dart';
import 'package:models/register_device_input.dart';
import 'package:models/scalars/phone_number.dart';
import 'package:place_picker/place_picker.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:massagex/state/geolocation/geolocation_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:massagex/utils.dart';
import 'package:models/order.dart';
import 'package:massagex/graphql/clients/register_device/register_device_bloc.dart';
import 'package:massagex/graphql/clients/paybill/paybill_bloc.dart';
import 'package:massagex/graphql/clients/reverse_geocode/reverse_geocode_bloc.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:uuid/uuid.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required this.url, this.pageSize = 10})
      : super(const AppInitial(
            isProviderMode: false, isTravellingSalesman: false)) {
    on<AppEvent>((event, emit) => handleEvents(event, emit));
    bootstrap();
  }

  static const appSettingsKey = 'permanent_app_settings_key';
  static const userProfileKey = "app_token";
  static const dataKey = "app_data_key";
  static const deviceIdKey = "device_id_key";
  static const fcmIdKey = "fcm_id_key";
  static const firstLaunchKey = "first_launch";
  static const idTokenKey = "idTokenKey";
  static const notificationsKey = "notifications_Key";
  static const providerkey = "isProvider";
  static const userSettingsKey = "temporary_app_setting_key";
  static const travellingSalesmanKey = "travelling_salesman_key";
  static const businessProfileKey = "business_profile_key";
  static const isProfileIncompleteKey = "incomplete_profile_Key";
  static const isDeviceRegisteredKey = "device_registration_key";
  Box? appSettings;

  /// hive box streams
  StreamSubscription<BoxEvent>? authStream;

  Box<Map<dynamic, dynamic>?>? box;

  GraphQLClient? client;
  DeeplinkBloc? deeplinkBloc;
  final FirebaseAuth fauth = FirebaseAuth.instance;
  StreamSubscription<BoxEvent>? fcmIdStream;
  FindUserBloc? findUserBloc;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// blocs
  GeolocationBloc? geolocationBloc;

  StreamSubscription<BoxEvent>? idTokenStream;
  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  final int pageSize;
  PaybillBloc? paybillBloc;

  /// plugins
  final picker = ImagePicker();

  StreamSubscription<BoxEvent>? providerModeSub;
  RegisterDeviceBloc? registerDeviceBloc;
  Box? userSettings;
  UpdateMyBusinessProfileBloc? updateMyBusinessProfileBloc;
  UpdateMyProfileBloc? updateMyProfileBloc;
  final String url;

  bool get isLogedIn => token?.isNotEmpty == true;

  bool get isBusiness =>
      currentUser?.data?.businessProfile?.id?.isNotEmpty == true;

  bool get isProfileCompleted =>
      !userSettings!.get(isProfileIncompleteKey, defaultValue: true);

  bool get isDeviceRegistered =>
      !userSettings!.get(isDeviceRegisteredKey, defaultValue: false);

  @override
  Future<void> close() async {
    await authStream!.cancel();
    await registerDeviceBloc!.close();
    await idTokenStream!.cancel();
    await fcmIdStream!.cancel();
    await paybillBloc!.close();
    await updateMyBusinessProfileBloc!.close();
    await updateMyProfileBloc!.close();
    await findUserBloc!.close();
    await geolocationBloc!.close();
    await deeplinkBloc!.close();
    await providerModeSub!.cancel();

    return super.close();
  }

  int get getPagesize => pageSize;
  clearStorage() async {
    await box!.clear();
    await userSettings!.clear();
    await appSettings!.clear();
  }

  bootstrap() async {
    box = await Hive.openBox(AppBloc.dataKey);
    userSettings = await Hive.openBox(AppBloc.userSettingsKey);
    appSettings = await Hive.openBox(AppBloc.appSettingsKey);

    // await clearStorage();
    userSettings!.put(isProfileIncompleteKey, true);
    userSettings!.put(isDeviceRegisteredKey, false);

    _initDeviceId();
    final httplink = HttpLink(url);
    final tokenlink = AuthLink(getToken: getIdToken);
    final ws = serverUrl(
      isSubscription: true,
      path: "graphql",
    );

    final wsLink = WebSocketLink(
      ws,
      config: SocketClientConfig(
        inactivityTimeout: const Duration(minutes: 30),
        initialPayload: () async {
          return {"authorization": await getIdToken()};
        },
      ),
    );

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
      alwaysRebroadcast: true,
      cache: GraphQLCache(
        dataIdFromObject: (data) {
          if (data["id"] != null && data["__typename"] != null) {
            return "${data["__typename"]}/${data["id"]}";
          }
          //return data["__typename"] as String?;
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
      if (state is GeolocationPositionChanged &&
          currentUser?.data?.id != null) {
        print(state.position);
        updateMyProfileBloc!
          ..add(UpdateMyProfileReseted())
          ..add(
            UpdateMyProfileExcuted(
                id: currentUser!.data!.id!,
                location: LocationUpsertWithoutUsersInput(
                  update: LocationUpdateWithoutUsersInput(
                    lat: FloatFieldUpdateOperationsInput(
                        set$: state.position.latitude),
                    lon: FloatFieldUpdateOperationsInput(
                        set$: state.position.longitude),
                    heading: FloatFieldUpdateOperationsInput(
                        set$: state.position.heading),
                  ),
                  create: LocationCreateWithoutUsersInput(
                    lat: state.position.latitude!,
                    lon: state.position.longitude!,
                    heading: state.position.heading,
                  ),
                )),
          );
      }
    });
    findUserBloc!.stream.asBroadcastStream().listen((event) {
      userSettings!.put(userProfileKey, event.data?.toJson());
      final user = event.data?.data;
      if (user != null) {
        if (user.displayName == null ||
            user.displayName?.isEmpty == true ||
            user.gender == null ||
            user.phoneNumber == null ||
            user.dateOfBirth == null) {
          userSettings!.put(isProfileIncompleteKey, true);
        } else {
          userSettings!.put(isProfileIncompleteKey, false);
        }
        //device registration
        if (user.device!.fcm$id == null ||
            user.device!.fcm$id?.isEmpty == true) {
          userSettings!.put(isDeviceRegisteredKey, false);
        } else {
          userSettings!.put(isDeviceRegisteredKey, true);
        }
      }
    });

    updateMyProfileBloc!.stream.asBroadcastStream().listen((event) {
      if (event is UpdateMyProfileSuccess) {
        // refresh user profile after every update
        findUserBloc!
          ..add(FindUserReseted())
          ..add(FindUserExcuted(id: fauth.currentUser!.uid));
      }
    });
    updateMyBusinessProfileBloc!.stream.asBroadcastStream().listen((event) {
      if (event is UpdateMyBusinessProfileSuccess) {
        // refresh user profile after every update
        findUserBloc!
          ..add(FindUserReseted())
          ..add(FindUserExcuted(id: fauth.currentUser!.uid));
      }
    });

    // if (currentUser?.data?.id != null) {
    //   findUserBloc!.add(
    //     FindUserExcuted(
    //       id: currentUser!.data!.id!,
    //     ),
    //   );
    //   registerDeviceBloc!.add(
    //     RegisterDeviceExcuted(
    //       device: RegisterDeviceInput(userId: currentUser!.data!.id!, id: deviceId!),
    //     ),
    //   );
    // }

    // authStream = userSettings!.watch(key: authkey).listen((event) {
    //   //Todo change to firebase auth
    //   if (user?.data?.id != null) {
    //     print("default auth  ${user!.data!.id}");
    //     findUserBloc!.add(
    //       FindUserExcuted(id: user!.data!.id!),
    //     );
    //     registerDeviceBloc!.add(
    //       RegisterDeviceExcuted(
    //         device: RegisterDeviceInput(userId: user!.data!.id, id: deviceId!),
    //       ),
    //     );
    //   }
    // });

    fcmIdStream = appSettings!.watch(key: fcmIdKey).listen((event) {
      if (event.value != null) {
        print("fcmid ${event.value}");
        registerDeviceBloc!
          ..add(RegisterDeviceReseted())
          ..add(
            RegisterDeviceExcuted(
              device: RegisterDeviceInput(fcm$id: event.value, id: deviceId!),
            ),
          );
      }
    });

    providerModeSub = userSettings!.watch(key: providerkey).listen((event) {
      //disable traveling salesman if provider mode disabled
      if (event.value == false) {
        userSettings!.put(travellingSalesmanKey, false);
      }
    });

    messaging.onTokenRefresh.listen((key) {
      appSettings!.put(fcmIdKey, key);
    });

    fauth.idTokenChanges().listen((user) async {
      final token = await fauth.currentUser?.getIdToken();
      await userSettings!.put(idTokenKey, token);
      if (user != null) {
        await upsertBusinessProfile(user.uid);
        print("firebase login ${user.uid}");
        registerDeviceBloc!
          ..add(RegisterDeviceReseted())
          ..add(
            RegisterDeviceExcuted(
              device: RegisterDeviceInput(userId: user.uid, id: deviceId!),
            ),
          );
        findUserBloc!
          ..add(FindUserReseted())
          ..add(
            FindUserExcuted(id: user.uid),
          );

        if (state is AppFirstStarted ||
            state is AppLoggedOut ||
            state is AppStarted ||
            state is AppInitial) {
          add(const AppResseted());
          add(const AppAuth());
          return;
        }
      }
      if (state is! AppFirstStarted) {
        add(const AppResseted());
        add(const AppIdTokenChanged());
      }
    });

    //get initial tokens
    await appSettings!.put(fcmIdKey, await messaging.getToken());
    await userSettings!.put(idTokenKey, await fauth.currentUser?.getIdToken());

    await Future.delayed(const Duration(seconds: 2), () {
      add(const AppStart());
    });
  }

  void initializeMessaging() async {
    //should be called after auth passes
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((message) async {
      final notification =
          await handleNotificationPayload(userSettings!, message);
      if (notification != null) {
        final data = parseNotification(notification);
        var body = "";
        if (data is Order) {
          body = data.service!.name!;
        }
        // if (data is Review) {
        //   body = data.author!.displayName!;
        // }
        add(const AppResseted());
        add(AppNotified(notification));
        showNotification(
            notification.hashCode, notification.message ?? " ", body,
            payload: message.data["payload"]);
      }
    });

    flutterLocalNotificationsPlugin.initialize(
        const InitializationSettings(
          android: AndroidInitializationSettings(
            "launch_background",
          ),
        ), onSelectNotification: (payload) async {
      final data = jsonDecode(payload ?? '{}');
      final notification = nt.Notification.fromJson(data);
      // await removeSeenNotification(d);
      add(const AppResseted());
      add(AppNotified(notification));
      // deeplinkBloc!
      //   ..add(const DeeplinkResetted())
      //   ..add(DeeplinkExcuted(data: notification));
    });
    if (!kIsWeb) {
      /// Create an Android Notification Channel.
      ///
      /// We use this channel in the `AndroidManifest.xml` file to override the
      /// default FCM channel to enable heads up notifications.
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(androidNotificationChanel);

      /// Update the iOS foreground notification presentation options to allow
      /// heads up notifications.
      // await FirebaseMessaging.instance
      //     .setForegroundNotificationPresentationOptions(
      //   alert: true,
      //   badge: true,
      //   sound: true,
      // );
    }
  }

  Future<void> handleLaunchByNotification() async {
    //handle app opened by notifications make sure auth is ready before calling this
    final details =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    if (details?.didNotificationLaunchApp == true) {
      try {
        final data =
            nt.Notification.fromJson(jsonDecode(details!.payload ?? '{}'));
        add(const AppResseted());
        add(AppNotified(data));
      } catch (e) {
        print(e);
      }
    }
  }

  void showNotification(int id, String title, String body,
      {String? payload, bool fullScreenIntent = false}) {
    flutterLocalNotificationsPlugin.show(
        id,
        title,
        body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            androidNotificationChanel.id, androidNotificationChanel.name,
            channelDescription: androidNotificationChanel.description,
            importance: Importance.max,
            priority: Priority.max,
            fullScreenIntent: fullScreenIntent,
            playSound: true,
            // icon: 'ic_launcher',
          ),
        ),
        payload: payload);
  }

  UserResponse? getAuthUserProfileFromJson(Map<dynamic, dynamic>? json) {
    try {
      if (json != null) {
        return UserResponse.fromJson(json);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<void> saveBusinessProfileData(
      BusinessCreateWithoutOwnerInput profile) async {
    await box!.put(businessProfileKey, profile.toJson());
  }

  Future<UpdateMyProfileState?> upsertBusinessProfile(String uid) async {
    final profile = box!.get(businessProfileKey, defaultValue: null);
    if (profile == null) return Future.value();
    final data = BusinessCreateWithoutOwnerInput.fromJson(profile);
    final completer = Completer<UpdateMyProfileState>();
    final name = data.businessName;
    final about = data.about;
    final mode = data.mode;
    // final cover = data.cover;
    final subscription =
        updateMyProfileBloc!.stream.asBroadcastStream().listen((event) {
      if (event is UpdateMyProfileSuccess) {
        completer.complete(event);
      }
      if (event is UpdateMyProfileFailure || event is UpdateMyProfileError) {
        completer.completeError(event);
      }
    });

    updateMyProfileBloc!
      ..add(UpdateMyProfileReseted())
      ..add(
        UpdateMyProfileExcuted(
          id: uid,
          businessProfile: BusinessUpsertWithoutOwnerInput(
            create: BusinessCreateWithoutOwnerInput(
              about: about,
              businessName: name,
              mode: mode,
              location: data.location?.create != null ? data.location : null,
            ),
            update: BusinessUpdateWithoutOwnerInput(
              about: StringFieldUpdateOperationsInput(set$: about),
              businessName: StringFieldUpdateOperationsInput(set$: name),
              mode: EnumBusinessModeFieldUpdateOperationsInput(
                set$: mode,
              ),
              location: data.location?.create != null
                  ? LocationUpdateOneWithoutBusinessesInput(
                      create: LocationCreateWithoutBusinessesInput(
                        name: data.location!.create!.name!,
                        lat: data.location!.create!.lat,
                        lon: data.location!.create!.lon,
                      ),
                    )
                  : null,
            ),
          ),
        ),
      );
    UpdateMyProfileState? result;
    await completer.future.then((value) async {
      result = value;
      await box!.delete(businessProfileKey);
    }).whenComplete(() => subscription.cancel());

    return Future.value(result);
  }

  String? get token {
    final idToken = userSettings!.get(idTokenKey);
    return idToken != null ? "Bearer $idToken" : null;
  }

  Future<String?> getIdToken() async {
    final idToken = await fauth.currentUser?.getIdToken();
    return idToken != null ? "Bearer $idToken" : null;
  }

  UserResponse? get currentUser {
    return getAuthUserProfileFromJson(userSettings!.get(
      userProfileKey,
    ));
  }

  bool get firstLauch {
    return appSettings!.get(firstLaunchKey, defaultValue: true);
  }

  String? get deviceId {
    return appSettings!.get(deviceIdKey);
  }

  bool get isProviderEnabled {
    return userSettings!.get(providerkey, defaultValue: false);
  }

  bool get isTravellingSalesman {
    return userSettings!.get(travellingSalesmanKey, defaultValue: false);
  }

  Iterable<nt.Notification> get notifications {
    final data = userSettings!.get(notificationsKey,
        defaultValue: <Map<dynamic, dynamic>>[]) as List<dynamic>;
    return Iterable.generate(data.length, (i) {
      return nt.Notification.fromJson(data[i]);
    });
  }

  Future<Iterable<int>> getShowingNotifications() async {
    final data = await (flutterLocalNotificationsPlugin
            as AndroidFlutterLocalNotificationsPlugin)
        .getActiveNotifications();

    return Iterable.generate(data?.length ?? 0, (i) {
      return data![i].id;
    });
  }

  Future<void> handleEvents(AppEvent event, Emitter<AppState> emit) async {
    // if (event is AppStart) {
    //   //registerLocationListener();
    // }

    if (firstLauch) {
      await appSettings!.put(firstLaunchKey, false);
      emit(AppFirstStarted(
          isProviderMode: isProviderEnabled,
          isTravellingSalesman: isTravellingSalesman));
    } else if (state is AppInitial) {
      emit(AppStarted(
          isProviderMode: isProviderEnabled,
          isTravellingSalesman: isTravellingSalesman));
    } else if (event is AppAuth) {
      emit(AppAuthenticated(
          isProviderMode: isProviderEnabled,
          isTravellingSalesman: isTravellingSalesman));
      initializeMessaging();
      handleLaunchByNotification();
      startGeolocation();
    } else if (event is AppResseted) {
      emit(
        AppStateReset(
            isProviderMode: isProviderEnabled,
            isTravellingSalesman: isTravellingSalesman),
      );
    } else if (event is AppModeChaged) {
      if (event.isProviderMode != null) {
        await userSettings!.put(providerkey, event.isProviderMode);
      }
      if (event.isTravellingSalesman != null) {
        await userSettings!
            .put(travellingSalesmanKey, event.isTravellingSalesman);
      }
      emit(
        AppModeChage(
            isProviderMode: isProviderEnabled,
            isTravellingSalesman: isTravellingSalesman),
      );
    } else if (event is AppNotified) {
      emit(
        AppNewNotification(
            notification: event.notification,
            isProviderMode: isProviderEnabled,
            isTravellingSalesman: isTravellingSalesman),
      );
    } else if (event is AppNotifiedAck) {
      emit(
        AppSeenNotification(
            notification: event.notification,
            isProviderMode: isProviderEnabled,
            isTravellingSalesman: isTravellingSalesman),
      );
      removeSeenNotification(event.notification);
    } else if (event is AppIdTokenChanged) {
      if (token == null || token?.isEmpty == true) {
        add(const AppResseted());
        add(const AppLogout());
      }
    } else if (event is AppLogout) {
      await box?.clear();
      await userSettings!.clear();
      //stop geolocation service
      stopGeolocation();
      emit(
        AppLoggedOut(
            isProviderMode: isProviderEnabled,
            isTravellingSalesman: isTravellingSalesman),
      );
    }
  }

  void stopGeolocation() {
    geolocationBloc!.add(GeolocationStopListenForLocationChanged());
  }

  void startGeolocation() {
    geolocationBloc!.add(GeolocationStart());
  }

  Future<XFile?> pickImage({ImageSource source = ImageSource.camera}) {
    return picker.pickImage(source: source);
  }

  Future<XFile?> pickVideo({ImageSource source = ImageSource.gallery}) {
    return picker.pickVideo(source: source);
  }

  Future<nt.Notification> removeSeenNotification(
      nt.Notification notification) async {
    await flutterLocalNotificationsPlugin.cancel(notification.hashCode);
    var oldData = userSettings!.get(notificationsKey, defaultValue: []) as List;
    var trancated = oldData
        .where((element) => !const DeepCollectionEquality()
            .equals(element, notification.toJson()))
        .toList();
    await userSettings!.put(notificationsKey, trancated);
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

  // reportLinkException(
  //     Request, Stream<Response> Function(Request), LinkException) {}
  // reportGraphQlException() {}
  _initDeviceId() async {
    if (deviceId == null) {
      var uuid = const Uuid();
      await appSettings!.put(deviceIdKey, uuid.v4());
    }
  }

  static Future<void> initializePlugins() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await Hive.initFlutter();
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

  Future<LocationResult?> showPlacePicker([LatLng? displayLocation]) async {
    return Navigator.of(this).push<LocationResult?>(
      MaterialPageRoute(
        builder: (context) => PlacePicker(
          apiKeyGMP,
          displayLocation: displayLocation,
        ),
      ),
    );
  }

  Future<State?> waitForBlocOperation<
          B extends Bloc<Event, State>,
          Event extends Object,
          State extends Object,
          Success extends State,
          Failure extends State,
          Error extends State,
          Excuted extends Event,
          Reseted extends Event>(
      {required B bloc,
      required Excuted excuted,
      required Reseted reseted,
      void Function(bool status)? callback}) async {
    callback?.call(true);
    final completer = Completer<State>();

    final subscription = bloc.stream.asBroadcastStream().listen((event) {
      if (event is Success) {
        completer.complete(event);
      }
      if (event is Error || event is Failure) {
        completer.completeError(event);
      }
    });

    bloc
      ..add(reseted)
      ..add(excuted);
    State? result;
    await completer.future.then((value) async {
      result = value;
    }).whenComplete(() => subscription.cancel());
    callback?.call(false);
    return Future.value(result);
  }

  Future<T?> showIncomingRequestNotification<T>(
      {BuildContext? context, required Order order}) {
    return (context ?? this).showCustomBottomSheet<T>(
        backgroundColor: Colors.white,
        elevation: 8,
        builder: (ctx) {
          return BlocProvider<UpdateMyBusinessOrderBloc>(
              create: ((context) =>
                  UpdateMyBusinessOrderBloc(client: context.client)),
              child: Builder(builder: (context) {
                return BlocConsumer<UpdateMyBusinessOrderBloc,
                    UpdateMyBusinessOrderState>(listener: (context, state) {
                  if (state is UpdateMyBusinessOrderSuccess) {
                    context.navigator.pop();
                  }
                }, builder: (context, state) {
                  final loading = state is UpdateMyBusinessOrderInProgress;
                  final error = state is UpdateMyBusinessOrderError ||
                      state is UpdateMyBusinessOrderFailure;

                  final bloc = context.bloc<UpdateMyBusinessOrderBloc>();
                  final uid = context.app.fauth.currentUser!.uid;
                  final data = IncomingRequestNotificationData(
                      avator: "assets/images/intro_picture_4.png",
                      cancelText: "Cancel",
                      title: loading
                          ? "Processing please wait.."
                          : "Incomming request..",
                      userName: order.owner!.displayName!,
                      dateTime: order.createdAt!.display,
                      onCancel: (ctx) {
                        // bloc
                        //   ..add(UpdateMyBusinessOrderReseted())
                        //   ..add(
                        //     UpdateMyBusinessOrderExcuted(
                        //         uid: uid,
                        //         count: 1,
                        //         orders: [
                        //           OrderUpdateWithWhereUniqueWithoutOwnerInput(
                        //             where: OrderWhereUniqueInput(id: order.id),
                        //             data: OrderUpdateWithoutOwnerInput(
                        //               orderStatus:
                        //                   EnumOrderStatusFieldUpdateOperationsInput(
                        //                       set$: OrderStatus.REJECTED),
                        //             ),
                        //           )
                        //         ]),
                        //   );
                        context.navigator.pop();
                      },
                      onComplete: (ctx, status) {},
                      serviceTitle: order.service!.name!,
                      price: order.service!.price!,
                      description: order.service!.description!,
                      descriptionUnderline: "descriptionUnderline",
                      extras: [],
                      onAccept: (ctx) {
                        bloc
                          ..add(UpdateMyBusinessOrderReseted())
                          ..add(
                            UpdateMyBusinessOrderExcuted(
                                uid: uid,
                                count: 1,
                                orders: [
                                  OrderUpdateWithWhereUniqueWithoutBusinessInput(
                                    where: OrderWhereUniqueInput(id: order.id),
                                    data: OrderUpdateWithoutBusinessInput(
                                      orderStatus:
                                          EnumOrderStatusFieldUpdateOperationsInput(
                                              set$: OrderStatus.ACCEPTED),
                                    ),
                                  )
                                ]),
                          );
                      },
                      onDecline: (ctx) {
                        bloc
                          ..add(UpdateMyBusinessOrderReseted())
                          ..add(
                            UpdateMyBusinessOrderExcuted(
                                uid: uid,
                                count: 1,
                                orders: [
                                  OrderUpdateWithWhereUniqueWithoutBusinessInput(
                                    where: OrderWhereUniqueInput(id: order.id),
                                    data: OrderUpdateWithoutBusinessInput(
                                      orderStatus:
                                          EnumOrderStatusFieldUpdateOperationsInput(
                                              set$: OrderStatus.REJECTED),
                                    ),
                                  )
                                ]),
                          );
                      },
                      distanceText: "${order.business!.distance ?? ""}",
                      declineText: "Decline",
                      acceptText: "Accept");

                  return loading
                      ? SizedBox.expand(
                          child: Center(
                          child: loading
                              ? const SizedBox(
                                  height: 32,
                                  width: 32,
                                  child: CircularProgressIndicator(),
                                )
                              : Nunito(
                                  color: Colors.red,
                                  text: state.message ??
                                      state.data.message ??
                                      "Error"),
                        ))
                      : NotificationBottomSheet(data: data);
                });
              }));
        });
  }

  Future<void> requireToCompleteProfile(
      {VoidCallback? onSuccess,
      VoidCallback? onCancel,
      VoidCallback? onError}) async {
    if (app.isProfileCompleted) {
      onSuccess?.call();
      return;
    }
    final state = await navigator.pushNamed<bool?>(AppRoutes.completeProfile);
    if (state == true) {
      onSuccess?.call();
    } else if (state == false) {
      onCancel?.call();
    } else {
      onError?.call();
    }
  }

  Future<void> requireRegisteredDevice(
      {VoidCallback? onSuccess, VoidCallback? onError}) async {
    if (app.isDeviceRegistered) {
      onSuccess?.call();
      return;
    }
    var fcmId =
        app.appSettings!.get(AppBloc.fcmIdKey, defaultValue: null) as String?;
    fcmId ??= await app.messaging.getToken();

    final state = await waitForBlocOperation<
            RegisterDeviceBloc,
            RegisterDeviceEvent,
            RegisterDeviceState,
            RegisterDeviceSuccess,
            RegisterDeviceFailure,
            RegisterDeviceError,
            RegisterDeviceExcuted,
            RegisterDeviceReseted>(
        bloc: app.registerDeviceBloc!,
        excuted: RegisterDeviceExcuted(
          device: RegisterDeviceInput(
              id: app.deviceId!,
              fcm$id: fcmId,
              userId: app.fauth.currentUser!.uid),
        ),
        reseted: RegisterDeviceReseted());
    if (state is RegisterDeviceSuccess) {
      onSuccess?.call();
    } else if (state is RegisterDeviceError || state is RegisterDeviceFailure) {
      onError?.call();
    }
  }

  Future<String> reverseGeocode(LatLng location) async {
    final result = await waitForBlocOperation<
            ReverseGeocodeBloc,
            ReverseGeocodeEvent,
            ReverseGeocodeState,
            ReverseGeocodeSuccess,
            ReverseGeocodeFailure,
            ReverseGeocodeError,
            ReverseGeocodeExcuted,
            ReverseGeocodeReseted>(
        bloc: ReverseGeocodeBloc(client: client),
        excuted: ReverseGeocodeExcuted(
            longitude: location.longitude, latitude: location.latitude),
        reseted: ReverseGeocodeReseted());
    if (result is ReverseGeocodeSuccess &&
        result.data.data?.results?.isNotEmpty == true) {
      return result.data.data!.results!.first.formatted$address!;
    } else {
      return "unnamed location";
    }
  }

  Future<String?> getLocationName(LocationResult? loc) async {
    if (loc?.formattedAddress == null ||
        loc?.formattedAddress?.isEmpty == true ||
        loc?.formattedAddress == "unknown") {
      final name = await reverseGeocode(
          LatLng(loc!.latLng!.latitude, loc.latLng!.longitude));
      return name;
    }
    return loc?.formattedAddress;
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

extension GenderETX on Gender {
  String get friendlyName {
    if (this == Gender.UNSPECIFIED) {
      return "Any";
    } else if (this == Gender.MALE) {
      return "Male";
    } else {
      return "Female";
    }
  }
}
