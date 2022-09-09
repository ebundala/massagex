import 'package:flutterfire_ui/auth.dart';
import 'package:massagex/pages/checkout_page.dart';
import 'package:massagex/pages/complete_profile_page.dart';
import 'package:massagex/pages/create_business_profile.dart';
import 'package:massagex/pages/create_order_page.dart';
import 'package:massagex/pages/create_service_page.dart';
import 'package:massagex/pages/login_page.dart';
import 'package:massagex/pages/onbording_page.dart';
import 'package:massagex/pages/provider_details_page.dart';
import 'package:massagex/pages/provider_home_page.dart';
import 'package:massagex/pages/splash_page.dart';
import 'package:massagex/pages/tracking_page.dart';
import 'package:massagex/pages/user_home_page.dart';
import 'package:massagex/pages/verify_phone_page.dart';
import 'package:massagex/state/app/app_bloc.dart';
import 'package:massagex/state/routes/routes.dart';
import 'package:massagex/utils.dart';
import 'package:massagex/widgets/components/buttons.dart';
import 'package:massagex/widgets/components/push_notifications_listener.dart';
import 'package:massagex/widgets/texts/app_name.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:massagex/widgets/themes/light_theme.dart';
import 'package:models/business.dart';
import 'package:models/order.dart';
import 'package:models/service.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) async {
  await AppBloc.initializePlugins();
  runApp(MassageX());
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
  devices: [
    Device.mobile(
      name: 'Galaxy A10',
      resolution: Resolution(
        nativeSize: DeviceSize(
          height: 1520.0,
          width: 720.0,
        ),
        scaleFactor: 3.0,
      ),
      type: DeviceType.mobile,
    ),
    Apple.iPhone12,
  ],
  textScaleFactors: [
    1,
    2,
    3,
  ],
  foldersExpanded: true,
  widgetsExpanded: true,
)
class MassageX extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  MassageX({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(
        url: serverUrl(path: 'graphql', port: 443),
      ),
      child: Builder(builder: (context) {
        return MaterialApp(
          theme: mainTheme,
          title: "massagex",
          home: SafeArea(
            child: BlocListener<AppBloc, AppState>(
                listener: (context, state) {
                  print(state);
                  if (state is AppFirstStarted) {
                    if (_navigatorKey.currentState?.mounted == true) {
                      _navigatorKey.currentState
                          ?.pushReplacementNamed(AppRoutes.onboarding);
                    }
                  }
                  if (state is AppAuthenticated) {
                    if (_navigatorKey.currentState?.mounted == true) {
                      _navigatorKey.currentState
                          ?.pushReplacementNamed(AppRoutes.home);
                    }
                  }
                  if (state is AppLoggedOut) {
                    if (_navigatorKey.currentState?.mounted == true) {
                      _navigatorKey.currentState?.pushNamedAndRemoveUntil(
                          AppRoutes.login, (r) => false);
                    }
                  }
                },
                child: WillPopScope(
                  onWillPop: () async {
                    if (_navigatorKey.currentState?.canPop() == true) {
                      _navigatorKey.currentState!.pop();
                      return false;
                    }
                    return true;
                  },
                  child: PushNotificationsListener(
                    child: Navigator(
                      key: _navigatorKey,
                      initialRoute: AppRoutes.splash,
                      // TODO use on on generate initial route for deeplinks and app open on notifications
                      // onGenerateInitialRoutes: ,
                      onGenerateRoute: (settings) {
                        switch (settings.name) {
                          case AppRoutes.splash:
                            return MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (context) => const SplashPage(),
                            );
                          case AppRoutes.onboarding:
                            return MaterialPageRoute(
                              builder: ((context) => const OnboardingPage()),
                            );
                          case AppRoutes.login:
                            return MaterialPageRoute(
                                builder: (context) => LoginPage(
                                      register:
                                          (settings.arguments ?? false) as bool,
                                    ));
                          case AppRoutes.createBusinessProfile:
                            return MaterialPageRoute(
                              builder: (context) =>
                                  const CreateBusinessProfilePage(),
                            );
                          case AppRoutes.completeProfile:
                            return MaterialPageRoute<bool?>(
                              builder: (context) => const CompleteProfilePage(),
                            );
                          case AppRoutes.verifyPhoneOTP:
                            return MaterialPageRoute(
                              builder: (context) => const VerifyPhonePage(),
                            );

                          case AppRoutes.createService:
                            return MaterialPageRoute<bool?>(
                              builder: (context) => CreateServicePage(
                                service: settings.arguments != null
                                    ? settings.arguments as Service
                                    : null,
                              ),
                            );
                          case AppRoutes.userHome:
                            return MaterialPageRoute(
                              builder: (context) => const UserHomePage(),
                            );
                          case AppRoutes.providerHome:
                            return MaterialPageRoute(
                              builder: (context) => const ProviderHomePage(),
                            );
                          case AppRoutes.providerDetails:
                            return MaterialPageRoute(
                              builder: (context) => ProviderDetailsPage(
                                business: settings.arguments! as Business,
                              ),
                            );
                          case AppRoutes.createOrder:
                            return MaterialPageRoute<bool?>(
                              builder: (context) => CreateOrderPage(
                                service: settings.arguments! as Service,
                              ),
                            );
                          case AppRoutes.orderSummary:
                          case AppRoutes.payment:
                            return MaterialPageRoute<bool?>(
                              builder: (context) => CheckoutPage(
                                order: settings.arguments! as Order,
                              ),
                            );
                          case AppRoutes.tracking:
                            return MaterialPageRoute(
                              builder: (context) => TrackingPage(
                                order: settings.arguments! as Order,
                              ),
                            );
                          case AppRoutes.profile:

                          case AppRoutes.recoverAccount:
                          case AppRoutes.changePassword:

                          case AppRoutes.home:
                          default:
                            return MaterialPageRoute(
                                builder: ((context) => Scaffold(
                                      appBar: AppBar(
                                        title: const AppName(),
                                      ),
                                      body: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            PrimaryButton(
                                              onPressed: () {
                                                context.navigator.pushNamed(
                                                    AppRoutes.completeProfile);
                                              },
                                              child: const Nunito(
                                                  text: "Complete profile"),
                                            ),
                                            PrimaryButton(
                                              onPressed: () {
                                                context.navigator.pushNamed(
                                                    AppRoutes
                                                        .createBusinessProfile);
                                              },
                                              child: const Nunito(
                                                  text:
                                                      "create business profile"),
                                            ),
                                            const SignOutButton(
                                              variant: ButtonVariant.text,
                                            ),
                                            PrimaryButton(
                                              onPressed: () {
                                                context.navigator.pushNamed(
                                                    AppRoutes.createService);
                                              },
                                              child: const Nunito(
                                                  text: "Create service"),
                                            ),
                                            if (context.app.isBusiness)
                                              PrimaryButton(
                                                onPressed: () {
                                                  context.navigator.pushNamed(
                                                      AppRoutes.providerHome);
                                                },
                                                child: const Nunito(
                                                    text: "provider home"),
                                              ),
                                            PrimaryButton(
                                              onPressed: () {
                                                context.navigator.pushNamed(
                                                    AppRoutes.userHome);
                                              },
                                              child: const Nunito(
                                                  text: "user home"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )));
                        }
                      },
                    ),
                  ),
                )),
          ),
        );
      }),
    );
  }
}

@WidgetbookUseCase(name: "Main app", type: MassageX)
Widget mainApp(BuildContext context) {
  return MassageX();
}
