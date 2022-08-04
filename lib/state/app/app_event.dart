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
  final AuthResult auth;
  const AppAuth(this.auth);

  @override
  List<Object> get props => [auth];
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
  @override
  List<Object> get props => [];
}
