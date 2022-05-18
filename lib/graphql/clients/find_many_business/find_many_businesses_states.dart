part of 'find_many_businesses_bloc.dart';

abstract class FindManyBusinessesState extends Equatable {
  final BusinessListResponse? data;
  final String? message;
  FindManyBusinessesState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindManyBusinessesInitial extends FindManyBusinessesState {
  @override
  List<Object?> get props => [];
}

class FindManyBusinessesSuccess extends FindManyBusinessesState {
  final BusinessListResponse data;
  final String? message;
  FindManyBusinessesSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindManyBusinessesFailure extends FindManyBusinessesState {
  final BusinessListResponse data;
  final String? message;
  FindManyBusinessesFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindManyBusinessesInProgress extends FindManyBusinessesState {
  final BusinessListResponse data;
  final String? message;
  FindManyBusinessesInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindManyBusinessesOptimistic extends FindManyBusinessesState {
  final BusinessListResponse data;
  final String? message;
  FindManyBusinessesOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindManyBusinessesError extends FindManyBusinessesState {
  final BusinessListResponse data;
  final String? message;
  FindManyBusinessesError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindManyBusinessesLoadMoreInProgress extends FindManyBusinessesState {
  final BusinessListResponse data;
  final String? message;
  FindManyBusinessesLoadMoreInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindManyBusinessesAllDataLoaded extends FindManyBusinessesState {
  final BusinessListResponse data;
  final String? message;
  FindManyBusinessesAllDataLoaded({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}
