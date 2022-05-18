part of 'remove_from_favorites_bloc.dart';

abstract class RemoveFromFavoritesState extends Equatable {
  final UserResponse? data;
  final String? message;
  RemoveFromFavoritesState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class RemoveFromFavoritesInitial extends RemoveFromFavoritesState {
  @override
  List<Object?> get props => [];
}

class RemoveFromFavoritesSuccess extends RemoveFromFavoritesState {
  final UserResponse data;
  final String? message;
  RemoveFromFavoritesSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class RemoveFromFavoritesFailure extends RemoveFromFavoritesState {
  final UserResponse data;
  final String? message;
  RemoveFromFavoritesFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class RemoveFromFavoritesInProgress extends RemoveFromFavoritesState {
  final UserResponse data;
  final String? message;
  RemoveFromFavoritesInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class RemoveFromFavoritesOptimistic extends RemoveFromFavoritesState {
  final UserResponse data;
  final String? message;
  RemoveFromFavoritesOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class RemoveFromFavoritesError extends RemoveFromFavoritesState {
  final UserResponse data;
  final String? message;
  RemoveFromFavoritesError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}
