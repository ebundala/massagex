part of 'reverse_geocode_bloc.dart';

abstract class ReverseGeocodeState extends Equatable {
  final ReverseGeocodeResponse? data;
  final String? message;
  ReverseGeocodeState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class ReverseGeocodeInitial extends ReverseGeocodeState {
  @override
  List<Object?> get props => [];
}

class ReverseGeocodeSuccess extends ReverseGeocodeState {
  final ReverseGeocodeResponse data;
  final String? message;
  ReverseGeocodeSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class ReverseGeocodeFailure extends ReverseGeocodeState {
  final ReverseGeocodeResponse data;
  final String? message;
  ReverseGeocodeFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class ReverseGeocodeInProgress extends ReverseGeocodeState {
  final ReverseGeocodeResponse data;
  final String? message;
  ReverseGeocodeInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class ReverseGeocodeOptimistic extends ReverseGeocodeState {
  final ReverseGeocodeResponse data;
  final String? message;
  ReverseGeocodeOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class ReverseGeocodeError extends ReverseGeocodeState {
  final ReverseGeocodeResponse data;
  final String? message;
  ReverseGeocodeError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}
