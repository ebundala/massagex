part of 'find_route_bloc.dart';

abstract class FindRouteEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FindRouteStarted extends FindRouteEvent {
  @override
  List<Object?> get props => [];
}

class FindRouteExcuted extends FindRouteEvent {
  final LatLngInput origin;
  final LatLngInput destination;
  FindRouteExcuted({required this.origin, required this.destination});
  @override
  List<Object?> get props => [origin, destination];
}

class FindRouteIsLoading extends FindRouteEvent {
  final RouteResponse data;
  FindRouteIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindRouteIsOptimistic extends FindRouteEvent {
  final RouteResponse data;
  FindRouteIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindRouteIsConcrete extends FindRouteEvent {
  final RouteResponse data;
  FindRouteIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindRouteErrored extends FindRouteEvent {
  final RouteResponse data;
  final String message;
  FindRouteErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindRouteFailed extends FindRouteEvent {
  final RouteResponse data;
  final String message;
  FindRouteFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindRouteReseted extends FindRouteEvent {
  @override
  List<Object?> get props => [];
}

class FindRouteRefreshed extends FindRouteEvent {
  final FindRouteState data;
  FindRouteRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindRouteRetried extends FindRouteEvent {
  @override
  List<Object?> get props => [];
}
