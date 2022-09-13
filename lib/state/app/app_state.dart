part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  final bool isProviderMode;
  final bool isTravellingSalesman;
  const AppState(
      {required this.isTravellingSalesman, required this.isProviderMode});

  @override
  List<Object> get props => [isProviderMode, isTravellingSalesman];
}

class AppInitial extends AppState {
  const AppInitial(
      {required super.isProviderMode, required super.isTravellingSalesman});
}

class AppFirstStarted extends AppState {
  const AppFirstStarted(
      {required super.isProviderMode, required super.isTravellingSalesman});
}

class AppStarted extends AppState {
  const AppStarted(
      {required super.isProviderMode, required super.isTravellingSalesman});
}

class AppAuthenticated extends AppState {
  const AppAuthenticated(
      {required super.isProviderMode, required super.isTravellingSalesman});
}

class AppModeChage extends AppState {
  const AppModeChage(
      {required super.isProviderMode, required super.isTravellingSalesman});
}

class AppStateReset extends AppState {
  const AppStateReset(
      {required super.isProviderMode, required super.isTravellingSalesman});
}

class AppNewNotification extends AppState {
  final nt.Notification notification;
  const AppNewNotification(
      {required this.notification,
      required super.isProviderMode,
      required super.isTravellingSalesman});
}

class AppSeenNotification extends AppState {
  final nt.Notification notification;
  const AppSeenNotification(
      {required this.notification,
      required super.isProviderMode,
      required super.isTravellingSalesman});
}

class AppLoggedOut extends AppState {
  const AppLoggedOut(
      {required super.isProviderMode, required super.isTravellingSalesman});
}
