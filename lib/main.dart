import 'package:massagex/pages/onbording_page.dart';
import 'package:massagex/pages/splash_page.dart';
import 'package:massagex/state/app/app_bloc.dart';
import 'package:massagex/state/routes/routes.dart';
import 'package:massagex/utils.dart';
import 'package:massagex/widgets/texts/app_name.dart';
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
        url: serverUrl(path: 'graphql', port: 3000),
      ),
      child: Builder(builder: (context) {
        return MaterialApp(
          theme: mainTheme,
          home: SafeArea(
            child: BlocListener<AppBloc, AppState>(
                listener: (context, state) {
                  print(state);
                  if (state is AppFirstStarted) {
                    if (_navigatorKey.currentState?.mounted == true) {
                      _navigatorKey.currentState
                          ?.pushReplacementNamed('/onboarding');
                    }
                  }
                  if (state is AppAuth) {
                    if (_navigatorKey.currentState?.mounted == true) {
                      _navigatorKey.currentState?.pushReplacementNamed('/home');
                    }
                  }
                  if (state is AppLoggedOut) {
                    if (_navigatorKey.currentState?.mounted == true) {
                      _navigatorKey.currentState?.pushReplacementNamed('/home');
                    }
                  }
                },
                child: Navigator(
                  key: _navigatorKey,
                  initialRoute: AppRoutes.splash,
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
                      case AppRoutes.register:
                      case AppRoutes.recoverAccount:
                      case AppRoutes.verifyPhoneOTP:
                      case AppRoutes.completeProfile:
                      case AppRoutes.home:
                      case AppRoutes.providerHome:
                      case AppRoutes.profile:
                      case AppRoutes.orderSummary:
                      case AppRoutes.createOrder:
                      case AppRoutes.payment:
                      case AppRoutes.schedules:
                      case AppRoutes.createService:
                      case AppRoutes.changePassword:
                      case AppRoutes.createBussinessProfile:
                      case AppRoutes.tracking:
                      case AppRoutes.providerDetails:
                      default:
                        return MaterialPageRoute(
                            builder: ((context) => Scaffold(
                                  appBar: AppBar(
                                    title: const AppName(),
                                  ),
                                  body: const Text('app name'),
                                )));
                    }
                  },
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
