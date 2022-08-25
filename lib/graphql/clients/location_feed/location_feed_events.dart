part of 'location_feed_bloc.dart';

abstract class LocationFeedEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LocationFeedStarted extends LocationFeedEvent {
  @override
  List<Object?> get props => [];
}

class LocationFeedExcuted extends LocationFeedEvent {
  final String orderId;
  LocationFeedExcuted({required this.orderId});
  @override
  List<Object?> get props => [orderId];
}

class LocationFeedIsLoading extends LocationFeedEvent {
  final LocationResponse data;
  LocationFeedIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class LocationFeedIsOptimistic extends LocationFeedEvent {
  final LocationResponse data;
  LocationFeedIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class LocationFeedIsConcrete extends LocationFeedEvent {
  final LocationResponse data;
  LocationFeedIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class LocationFeedErrored extends LocationFeedEvent {
  final LocationResponse data;
  final String message;
  LocationFeedErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class LocationFeedFailed extends LocationFeedEvent {
  final LocationResponse data;
  final String message;
  LocationFeedFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class LocationFeedReseted extends LocationFeedEvent {
  @override
  List<Object?> get props => [];
}

class LocationFeedRefreshed extends LocationFeedEvent {
  final LocationFeedState data;
  LocationFeedRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class LocationFeedRetried extends LocationFeedEvent {
  @override
  List<Object?> get props => [];
}
