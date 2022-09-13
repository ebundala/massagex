part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class AppStart extends AppEvent {
  const AppStart();

  @override
  List<Object> get props => [];
}

class AppLogout extends AppEvent {
  const AppLogout();

  @override
  List<Object> get props => [];
}

class AppAuth extends AppEvent {
  const AppAuth();

  @override
  List<Object> get props => [];
}

class AppIdTokenChanged extends AppEvent {
  const AppIdTokenChanged();
  @override
  List<Object> get props => [];
}

class AppResseted extends AppEvent {
  const AppResseted();

  @override
  List<Object> get props => [];
}

class AppModeChaged extends AppEvent {
  final bool? isProviderMode;
  final bool? isTravellingSalesman;
  const AppModeChaged({this.isProviderMode, this.isTravellingSalesman});

  @override
  List<Object?> get props => [isProviderMode, isTravellingSalesman];
}

class AppNotified extends AppEvent {
  final nt.Notification notification;
  const AppNotified(this.notification);
  @override
  List<Object> get props => [notification];
}

class AppNotifiedAck extends AppEvent {
  final nt.Notification notification;

  const AppNotifiedAck(this.notification);
  @override
  List<Object> get props => [notification];
}
