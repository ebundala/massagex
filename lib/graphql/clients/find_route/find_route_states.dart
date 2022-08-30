part of 'find_route_bloc.dart';

abstract class FindRouteState extends Equatable {
  final RouteResponse? data;
  final String? message;
  FindRouteState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindRouteInitial extends FindRouteState {
  @override
  List<Object?> get props => [];
}

class FindRouteSuccess extends FindRouteState {
  final RouteResponse data;
  final String? message;
  FindRouteSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindRouteFailure extends FindRouteState {
  final RouteResponse data;
  final String? message;
  FindRouteFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindRouteInProgress extends FindRouteState {
  final RouteResponse data;
  final String? message;
  FindRouteInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindRouteOptimistic extends FindRouteState {
  final RouteResponse data;
  final String? message;
  FindRouteOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindRouteError extends FindRouteState {
  final RouteResponse data;
  final String? message;
  FindRouteError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindRouteOriginLatValidationError extends FindRouteState {
  final LatLngInput $origin;
  final LatLngInput $destination;
  final RouteResponse? data;
  final String? message;
  FindRouteOriginLatValidationError(this.message, this.data,
      {required this.$origin, required this.$destination});
  @override
  List<Object?> get props => [$origin, $destination, message, data];
}

class FindRouteOriginLngValidationError extends FindRouteState {
  final LatLngInput $origin;
  final LatLngInput $destination;
  final RouteResponse? data;
  final String? message;
  FindRouteOriginLngValidationError(this.message, this.data,
      {required this.$origin, required this.$destination});
  @override
  List<Object?> get props => [$origin, $destination, message, data];
}

class FindRouteDestinationLatValidationError extends FindRouteState {
  final LatLngInput $origin;
  final LatLngInput $destination;
  final RouteResponse? data;
  final String? message;
  FindRouteDestinationLatValidationError(this.message, this.data,
      {required this.$origin, required this.$destination});
  @override
  List<Object?> get props => [$origin, $destination, message, data];
}

class FindRouteDestinationLngValidationError extends FindRouteState {
  final LatLngInput $origin;
  final LatLngInput $destination;
  final RouteResponse? data;
  final String? message;
  FindRouteDestinationLngValidationError(this.message, this.data,
      {required this.$origin, required this.$destination});
  @override
  List<Object?> get props => [$origin, $destination, message, data];
}
