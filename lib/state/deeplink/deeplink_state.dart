part of 'deeplink_bloc.dart';

abstract class DeeplinkState extends Equatable {
  const DeeplinkState();

  @override
  List<Object> get props => [];
}

class DeeplinkInitial extends DeeplinkState {}

class DeeplinkTapped extends DeeplinkState {
  final Notification data;
  const DeeplinkTapped({required this.data});
  @override
  List<Object> get props => [data];
}
