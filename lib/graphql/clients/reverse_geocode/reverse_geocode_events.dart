part of 'reverse_geocode_bloc.dart';

abstract class ReverseGeocodeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ReverseGeocodeStarted extends ReverseGeocodeEvent {
  @override
  List<Object?> get props => [];
}

class ReverseGeocodeExcuted extends ReverseGeocodeEvent {
  final double latitude;
  final double longitude;
  ReverseGeocodeExcuted({required this.latitude, required this.longitude});
  @override
  List<Object?> get props => [latitude, longitude];
}

class ReverseGeocodeIsLoading extends ReverseGeocodeEvent {
  final ReverseGeocodeResponse data;
  ReverseGeocodeIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class ReverseGeocodeIsOptimistic extends ReverseGeocodeEvent {
  final ReverseGeocodeResponse data;
  ReverseGeocodeIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class ReverseGeocodeIsConcrete extends ReverseGeocodeEvent {
  final ReverseGeocodeResponse data;
  ReverseGeocodeIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class ReverseGeocodeErrored extends ReverseGeocodeEvent {
  final ReverseGeocodeResponse data;
  final String message;
  ReverseGeocodeErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class ReverseGeocodeFailed extends ReverseGeocodeEvent {
  final ReverseGeocodeResponse data;
  final String message;
  ReverseGeocodeFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class ReverseGeocodeReseted extends ReverseGeocodeEvent {
  @override
  List<Object?> get props => [];
}

class ReverseGeocodeRefreshed extends ReverseGeocodeEvent {
  final ReverseGeocodeState data;
  ReverseGeocodeRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class ReverseGeocodeRetried extends ReverseGeocodeEvent {
  @override
  List<Object?> get props => [];
}
