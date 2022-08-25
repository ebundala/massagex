part of 'location_feed_bloc.dart';

abstract class LocationFeedState extends Equatable {
  final LocationResponse? data;
  final String? message;
  LocationFeedState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class LocationFeedInitial extends LocationFeedState {
  @override
  List<Object?> get props => [];
}

class LocationFeedSuccess extends LocationFeedState {
  final LocationResponse data;
  final String? message;
  LocationFeedSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class LocationFeedFailure extends LocationFeedState {
  final LocationResponse data;
  final String? message;
  LocationFeedFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class LocationFeedInProgress extends LocationFeedState {
  final LocationResponse data;
  final String? message;
  LocationFeedInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class LocationFeedOptimistic extends LocationFeedState {
  final LocationResponse data;
  final String? message;
  LocationFeedOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class LocationFeedError extends LocationFeedState {
  final LocationResponse data;
  final String? message;
  LocationFeedError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}
