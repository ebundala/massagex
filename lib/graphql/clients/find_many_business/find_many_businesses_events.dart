part of 'find_many_businesses_bloc.dart';

abstract class FindManyBusinessesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FindManyBusinessesStarted extends FindManyBusinessesEvent {
  @override
  List<Object?> get props => [];
}

class FindManyBusinessesExcuted extends FindManyBusinessesEvent {
  final BusinessWhereInput? where;
  final int? take;
  final int? skip;
  FindManyBusinessesExcuted({this.where, this.take, this.skip});
  @override
  List<Object?> get props => [where, take, skip];
}

class FindManyBusinessesIsLoading extends FindManyBusinessesEvent {
  final BusinessListResponse data;
  FindManyBusinessesIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindManyBusinessesIsOptimistic extends FindManyBusinessesEvent {
  final BusinessListResponse data;
  FindManyBusinessesIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindManyBusinessesIsConcrete extends FindManyBusinessesEvent {
  final BusinessListResponse data;
  FindManyBusinessesIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindManyBusinessesErrored extends FindManyBusinessesEvent {
  final BusinessListResponse data;
  final String message;
  FindManyBusinessesErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindManyBusinessesFailed extends FindManyBusinessesEvent {
  final BusinessListResponse data;
  final String message;
  FindManyBusinessesFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindManyBusinessesReseted extends FindManyBusinessesEvent {
  @override
  List<Object?> get props => [];
}

class FindManyBusinessesRefreshed extends FindManyBusinessesEvent {
  final FindManyBusinessesState data;
  FindManyBusinessesRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindManyBusinessesMoreLoaded extends FindManyBusinessesEvent {
  final BusinessWhereInput? where;
  final int? take;
  final int? skip;
  FindManyBusinessesMoreLoaded({this.where, this.take, this.skip});
  @override
  List<Object?> get props => [where, take, skip];
}

class FindManyBusinessesStreamEnded extends FindManyBusinessesEvent {
  @override
  List<Object?> get props => [];
}

class FindManyBusinessesRetried extends FindManyBusinessesEvent {
  @override
  List<Object?> get props => [];
}
