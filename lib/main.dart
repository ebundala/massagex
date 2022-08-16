import 'package:flutterfire_ui/auth.dart';
import 'package:massagex/pages/complete_profile_page.dart';
import 'package:massagex/pages/create_business_profile.dart';
import 'package:massagex/pages/create_service_page.dart';
import 'package:massagex/pages/login_page.dart';
import 'package:massagex/pages/onbording_page.dart';
import 'package:massagex/pages/splash_page.dart';
import 'package:massagex/pages/verify_phone_page.dart';
import 'package:massagex/state/app/app_bloc.dart';
import 'package:massagex/state/routes/routes.dart';
import 'package:massagex/utils.dart';
import 'package:massagex/widgets/components/buttons.dart';
import 'package:massagex/widgets/texts/app_name.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:massagex/widgets/themes/light_theme.dart';
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
                          return MaterialPageRoute(
                            builder: (context) => const CompleteProfilePage(),
                          );
                        case AppRoutes.verifyPhoneOTP:
                          return MaterialPageRoute(
                            builder: (context) => const VerifyPhonePage(),
                          );

                        case AppRoutes.createService:
                          return MaterialPageRoute(
                            builder: (context) => const CreateServicePage(),
                          );

                        case AppRoutes.createOrder:

                        case AppRoutes.recoverAccount:
                        case AppRoutes.providerHome:
                        case AppRoutes.profile:
                        case AppRoutes.orderSummary:

                        case AppRoutes.payment:
                        case AppRoutes.schedules:

                        case AppRoutes.changePassword:
                        case AppRoutes.tracking:
                        case AppRoutes.providerDetails:
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
                                        ],
                                      ),
                                    ),
                                  )));
                      }
                    },
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
