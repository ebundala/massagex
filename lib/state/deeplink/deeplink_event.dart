part of 'deeplink_bloc.dart';

abstract class DeeplinkEvent extends Equatable {
  const DeeplinkEvent();

  @override
  List<Object> get props => [];
}

class DeeplinkExcuted extends DeeplinkEvent {
  final Notification data;
  const DeeplinkExcuted({required this.data});
  @override
  List<Object> get props => [data];
}

class DeeplinkResetted extends DeeplinkEvent {
  const DeeplinkResetted();
  @override
  List<Object> get props => [];
}
